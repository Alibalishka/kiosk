package dd.qrPay

import android.app.admin.DevicePolicyManager
import android.content.BroadcastReceiver
import android.content.ComponentName
import android.content.Context
import android.content.Intent
import android.os.Bundle
import android.os.Handler
import android.os.Looper
import android.util.Log

class AdbConfigReceiver : BroadcastReceiver() {
  private fun parseBooleanFlag(intent: Intent, key: String): Boolean? {
    if (!intent.hasExtra(key)) return null
    val raw = intent.extras?.get(key)
    return when (raw) {
      is Boolean -> raw
      is String -> raw.equals("true", ignoreCase = true)
      else -> null
    }
  }

  override fun onReceive(context: Context, intent: Intent) {
    if (intent.action != "dd.qrPay.ACTION_CONFIG") return

    val dpm = context.getSystemService(Context.DEVICE_POLICY_SERVICE) as DevicePolicyManager
    val packageName = context.packageName
    if (!dpm.isDeviceOwnerApp(packageName)) {
      Log.w("AdbConfigReceiver", "Skip: app is not Device Owner")
      return
    }

    val admin = ComponentName(context, DeviceAdminReceiver::class.java)
    val wifiSsid = intent.getStringExtra("wifi_ssid")?.trim()
    val wifiPassword = intent.getStringExtra("wifi_password") ?: ""
    val wifiHidden = parseBooleanFlag(intent, "wifi_hidden") == true

    val config = Bundle().apply {
      val serverUrl = intent.getStringExtra("server_url")
      val kioskCode = intent.getStringExtra("kiosk_code")
      if (!serverUrl.isNullOrBlank()) putString("server_url", serverUrl)
      if (!kioskCode.isNullOrBlank()) putString("kiosk_code", kioskCode)
      if (!wifiSsid.isNullOrBlank()) putString("wifi_ssid", wifiSsid)

      if (intent.hasExtra("feature_enabled")) {
        putBoolean("feature_enabled", intent.getBooleanExtra("feature_enabled", false))
      }
    }

    dpm.setApplicationRestrictions(admin, packageName, config)
    MainActivity.notifyManagedConfigChanged()
    Log.i("AdbConfigReceiver", "Managed config applied from ADB: $config")

    if (!wifiSsid.isNullOrBlank()) {
      // requestNetwork асинхронный; goAsync удерживает процесс, иначе receiver режется до подключения.
      val pendingResult = goAsync()
      val appCtx = context.applicationContext
      Handler(Looper.getMainLooper()).post {
        try {
          WifiConnectHelper.apply(appCtx, wifiSsid, wifiPassword, wifiHidden)
          Log.i("AdbConfigReceiver", "WiFi provisioning started for ssid=$wifiSsid hidden=$wifiHidden")
        } catch (e: Throwable) {
          Log.e("AdbConfigReceiver", "WiFi provisioning failed", e)
        } finally {
          // Дольше таймаута requestNetwork + запас: иначе goAsync завершится раньше async-подключения.
          Handler(Looper.getMainLooper()).postDelayed({
            pendingResult.finish()
          }, 45_000)
        }
      }
    }

    val kioskDisable = parseBooleanFlag(intent, "kiosk_disable") == true
    if (kioskDisable) {
      Log.i("AdbConfigReceiver", "kiosk_disable=true, executing clearDeviceOwner flow")
      MainActivity.clearDeviceOwnerFromAnyContext(context.applicationContext)
    }
  }
}
