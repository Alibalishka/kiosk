package dd.qrPay

import android.app.admin.DevicePolicyManager
import android.content.Context
import android.content.pm.PackageManager
import android.Manifest
import android.net.ConnectivityManager
import android.net.Network
import android.net.NetworkCapabilities
import android.net.NetworkRequest
import android.net.wifi.WifiConfiguration
import android.net.wifi.WifiManager
import android.net.wifi.WifiNetworkSpecifier
import android.net.wifi.WifiNetworkSuggestion
import android.os.Build
import android.os.Handler
import android.os.Looper
import android.os.PatternMatcher
import android.util.Log

/**
 * Подключение к Wi‑Fi по SSID и паролю: **только WPA2‑PSK** (или открытая сеть без пароля).
 *
 * **Device Owner (API 29+):** сначала [WifiConfiguration] + [WifiManager.addNetwork] — системная сеть,
 * без подписи «Available via app» и с обычной маркировкой INTERNET при валидном WAN.
 *
 * Иначе Android 10+ — [WifiNetworkSpecifier] + [ConnectivityManager.requestNetwork].
 * SSID совпадает с точкой **включая регистр**.
 */
object WifiConnectHelper {
  private const val TAG = "WifiConnectHelper"
  private const val REQUEST_NETWORK_TIMEOUT_MS = 30_000

  private val mainHandler = Handler(Looper.getMainLooper())
  @Volatile private var activeCallback: ConnectivityManager.NetworkCallback? = null

  fun apply(
    context: Context,
    ssid: String,
    password: String,
    hiddenSsid: Boolean = false,
  ) {
    val appContext = context.applicationContext
    DeviceOwnerPermissionHelper.grantWifiPermissionsIfDeviceOwner(appContext)
    logMissingWifiPermissions(appContext)

    val wifiManager = appContext.getSystemService(Context.WIFI_SERVICE) as WifiManager

    try {
      @Suppress("DEPRECATION")
      if (!wifiManager.isWifiEnabled) {
        @Suppress("DEPRECATION")
        wifiManager.isWifiEnabled = true
      }
    } catch (e: Throwable) {
      Log.w(TAG, "Could not enable WiFi: ${e.message}")
    }

    val isDeviceOwner = runCatching {
      val dpm = appContext.getSystemService(Context.DEVICE_POLICY_SERVICE) as DevicePolicyManager
      dpm.isDeviceOwnerApp(appContext.packageName)
    }.getOrDefault(false)

    if (isDeviceOwner && Build.VERSION.SDK_INT >= Build.VERSION_CODES.Q) {
      cancelActiveWifiRequest(appContext)
      if (connectViaWifiConfiguration(wifiManager, ssid, password, hiddenSsid)) {
        Log.i(TAG, "Wi‑Fi через WifiConfiguration (Device Owner), requestNetwork не используется")
        return
      }
      Log.w(TAG, "Device Owner: addNetwork не принят, используем requestNetwork + suggestions")
    }

    if (Build.VERSION.SDK_INT >= Build.VERSION_CODES.Q) {
      connectApi29Plus(appContext, wifiManager, ssid, password, hiddenSsid)
    } else {
      connectViaWifiConfiguration(wifiManager, ssid, password, hiddenSsid)
    }
  }

  private fun cancelActiveWifiRequest(appContext: Context) {
    val cb = activeCallback ?: return
    activeCallback = null
    val cm = appContext.getSystemService(Context.CONNECTIVITY_SERVICE) as ConnectivityManager
    runCatching { cm.unregisterNetworkCallback(cb) }
      .onFailure { Log.w(TAG, "unregisterNetworkCallback: ${it.message}") }
  }

  private fun logMissingWifiPermissions(context: Context) {
    val pkg = context.packageName
    if (context.checkSelfPermission(Manifest.permission.ACCESS_FINE_LOCATION) !=
      PackageManager.PERMISSION_GRANTED
    ) {
      Log.e(
        TAG,
        "Нет ACCESS_FINE_LOCATION — на Android 10+ Wi‑Fi из приложения часто не работает. " +
          "Выполните: adb shell pm grant $pkg android.permission.ACCESS_FINE_LOCATION",
      )
    }
    if (Build.VERSION.SDK_INT >= Build.VERSION_CODES.TIRAMISU) {
      if (context.checkSelfPermission(Manifest.permission.NEARBY_WIFI_DEVICES) !=
        PackageManager.PERMISSION_GRANTED
      ) {
        Log.e(
          TAG,
          "Нет NEARBY_WIFI_DEVICES (Android 13+). " +
            "adb shell pm grant $pkg android.permission.NEARBY_WIFI_DEVICES",
        )
      }
    }
  }

  private fun connectApi29Plus(
    appContext: Context,
    wifiManager: WifiManager,
    ssid: String,
    password: String,
    hiddenSsid: Boolean,
  ) {
    val cm = appContext.getSystemService(Context.CONNECTIVITY_SERVICE) as ConnectivityManager

    fun buildSpecifier(): WifiNetworkSpecifier {
      val specifierBuilder = WifiNetworkSpecifier.Builder()
      if (Build.VERSION.SDK_INT >= Build.VERSION_CODES.TIRAMISU) {
        specifierBuilder.setSsid(ssid)
        if (hiddenSsid) {
          specifierBuilder.setIsHiddenSsid(true)
        }
      } else {
        specifierBuilder.setSsidPattern(
          PatternMatcher(ssid, PatternMatcher.PATTERN_LITERAL),
        )
      }
      if (password.isNotEmpty()) {
        specifierBuilder.setWpa2Passphrase(password)
      }
      return specifierBuilder.build()
    }

    val securityLabel = if (password.isEmpty()) "open" else "WPA2"
    val specifier = buildSpecifier()
    val request = NetworkRequest.Builder()
      .addTransportType(NetworkCapabilities.TRANSPORT_WIFI)
      .setNetworkSpecifier(specifier)
      .build()

    val callback = object : ConnectivityManager.NetworkCallback() {
      override fun onAvailable(network: Network) {
        Log.i(
          TAG,
          "requestNetwork onAvailable ssid=$ssid security=$securityLabel network=$network",
        )
        // Не вызываем bindProcessToNetwork: для «обычного» интернета через Wi‑Fi процесс должен
        // ходить через сеть по умолчанию системы. Привязка ко всему процессу даёт «есть Wi‑Fi,
        // но нет интернета» (маршрут/DNS/валидация), хотя в настройках сеть уже видна.
      }

      override fun onCapabilitiesChanged(
        network: Network,
        networkCapabilities: NetworkCapabilities,
      ) {
        logWifiCapabilities(ssid, networkCapabilities)
      }

      override fun onLost(network: Network) {
        Log.w(TAG, "requestNetwork onLost ssid=$ssid")
      }

      override fun onUnavailable() {
        runCatching { cm.unregisterNetworkCallback(this) }
          .onFailure { Log.w(TAG, "unregisterNetworkCallback: ${it.message}") }
        if (activeCallback === this) {
          activeCallback = null
        }
        Log.e(
          TAG,
          "requestNetwork onUnavailable ssid=$ssid hidden=$hiddenSsid security=$securityLabel " +
            "(SSID/регистр, пароль WPA2, зона AP, LOCATION/NEARBY_WIFI).",
        )
      }
    }

    mainHandler.post {
      activeCallback?.let { cb ->
        runCatching { cm.unregisterNetworkCallback(cb) }
      }
      activeCallback = callback
      try {
        if (Build.VERSION.SDK_INT >= Build.VERSION_CODES.O) {
          cm.requestNetwork(
            request,
            callback,
            mainHandler,
            REQUEST_NETWORK_TIMEOUT_MS,
          )
        } else {
          cm.requestNetwork(request, callback)
        }
        Log.i(
          TAG,
          "requestNetwork dispatched ssid=$ssid security=$securityLabel " +
            "timeout=${REQUEST_NETWORK_TIMEOUT_MS}ms hidden=$hiddenSsid",
        )
      } catch (e: Throwable) {
        Log.e(TAG, "requestNetwork failed", e)
        activeCallback = null
      }
    }

    if (Build.VERSION.SDK_INT >= Build.VERSION_CODES.TIRAMISU) {
      mainHandler.post {
        runCatching {
          val suggestion = WifiNetworkSuggestion.Builder()
            .setSsid(ssid)
            .apply {
              if (password.isNotEmpty()) setWpa2Passphrase(password)
            }
            .build()
          val status = wifiManager.addNetworkSuggestions(listOf(suggestion))
          logNetworkSuggestionsStatus(status)
        }.onFailure { Log.w(TAG, "addNetworkSuggestions: ${it.message}") }
      }
    }
  }

  private fun logWifiCapabilities(ssid: String, caps: NetworkCapabilities) {
    val validated = caps.hasCapability(NetworkCapabilities.NET_CAPABILITY_VALIDATED)
    val internet = caps.hasCapability(NetworkCapabilities.NET_CAPABILITY_INTERNET)
    val captive = if (Build.VERSION.SDK_INT >= Build.VERSION_CODES.Q) {
      caps.hasCapability(NetworkCapabilities.NET_CAPABILITY_CAPTIVE_PORTAL)
    } else {
      false
    }
    Log.i(
      TAG,
      "onCapabilitiesChanged ssid=$ssid validated=$validated internet=$internet " +
        "captive_portal=$captive — см. NET_CAPABILITY_* в дампе: $caps",
    )
  }

  private fun logNetworkSuggestionsStatus(status: Int) {
    if (Build.VERSION.SDK_INT < Build.VERSION_CODES.Q) return
    val label = when (status) {
      WifiManager.STATUS_NETWORK_SUGGESTIONS_SUCCESS -> "SUCCESS"
      WifiManager.STATUS_NETWORK_SUGGESTIONS_ERROR_INTERNAL -> "ERROR_INTERNAL"
      WifiManager.STATUS_NETWORK_SUGGESTIONS_ERROR_APP_DISALLOWED -> "ERROR_APP_DISALLOWED"
      WifiManager.STATUS_NETWORK_SUGGESTIONS_ERROR_ADD_DUPLICATE -> "ERROR_ADD_DUPLICATE"
      WifiManager.STATUS_NETWORK_SUGGESTIONS_ERROR_ADD_EXCEEDS_MAX_PER_APP ->
        "ERROR_ADD_EXCEEDS_MAX_PER_APP"
      WifiManager.STATUS_NETWORK_SUGGESTIONS_ERROR_REMOVE_INVALID -> "ERROR_REMOVE_INVALID"
      WifiManager.STATUS_NETWORK_SUGGESTIONS_ERROR_ADD_NOT_ALLOWED -> "ERROR_ADD_NOT_ALLOWED"
      WifiManager.STATUS_NETWORK_SUGGESTIONS_ERROR_ADD_INVALID ->
        "ERROR_ADD_INVALID (часто нет LOCATION/NEARBY_WIFI или неверные поля suggestion)"
      else -> "UNKNOWN"
    }
    Log.i(TAG, "addNetworkSuggestions status=$status $label")
  }

  /**
   * @return true, если [WifiManager.addNetwork] вернул валидный netId и включение сети запланировано.
   */
  @Suppress("DEPRECATION")
  private fun connectViaWifiConfiguration(
    wifiManager: WifiManager,
    ssid: String,
    password: String,
    hiddenSsid: Boolean = false,
  ): Boolean {
    return try {
      val conf = WifiConfiguration().apply {
        SSID = "\"$ssid\""
        if (hiddenSsid) {
          hiddenSSID = true
        }
        if (password.isNotEmpty()) {
          preSharedKey = "\"$password\""
          allowedKeyManagement.set(WifiConfiguration.KeyMgmt.WPA_PSK)
        } else {
          allowedKeyManagement.set(WifiConfiguration.KeyMgmt.NONE)
        }
        @Suppress("DEPRECATION")
        status = WifiConfiguration.Status.ENABLED
      }
      val netId = wifiManager.addNetwork(conf)
      if (netId < 0) {
        Log.e(TAG, "addNetwork failed netId=$netId ssid=$ssid")
        false
      } else {
        wifiManager.disconnect()
        wifiManager.enableNetwork(netId, true)
        wifiManager.reconnect()
        Log.i(TAG, "WifiConfiguration: netId=$netId ssid=$ssid hidden=$hiddenSsid")
        true
      }
    } catch (e: Throwable) {
      Log.e(TAG, "connectViaWifiConfiguration: ${e.message}", e)
      false
    }
  }
}
