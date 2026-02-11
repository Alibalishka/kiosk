package dd.qrPay

import android.app.PendingIntent
import android.app.admin.DevicePolicyManager
import android.content.ComponentName
import android.content.Context
import android.content.Intent
import android.content.IntentFilter
import android.content.pm.PackageInstaller
import android.os.Build
import android.os.Handler
import android.os.Looper
import android.provider.Settings
import android.view.KeyEvent
import android.view.View
import android.view.WindowInsets
import android.view.WindowInsetsController
import android.view.WindowManager
import androidx.annotation.NonNull
import io.flutter.embedding.android.FlutterActivity
import io.flutter.embedding.engine.FlutterEngine
import io.flutter.plugin.common.MethodChannel
import com.yandex.mapkit.MapKitFactory
import java.io.File
import android.content.pm.ActivityInfo

class MainActivity : FlutterActivity() {

  private val DPC_CHANNEL = "dpc"

  // Чтобы “CLEAR” не включал киоск снова (onResume), пока мы снимаем DO
  private val PREFS = "kiosk_prefs"
  private val KEY_KIOSK_DISABLED = "kiosk_disabled"

  private fun isKioskDisabled(): Boolean =
    getSharedPreferences(PREFS, MODE_PRIVATE).getBoolean(KEY_KIOSK_DISABLED, false)

  private fun setKioskDisabled(v: Boolean) {
    getSharedPreferences(PREFS, MODE_PRIVATE).edit().putBoolean(KEY_KIOSK_DISABLED, v).apply()
  }

  override fun configureFlutterEngine(@NonNull flutterEngine: FlutterEngine) {
    MapKitFactory.setApiKey("68428e34-3d85-439d-bc8b-d5f8f85b89b6")
    super.configureFlutterEngine(flutterEngine)

    MethodChannel(flutterEngine.dartExecutor.binaryMessenger, DPC_CHANNEL)
      .setMethodCallHandler { call, result ->
        when (call.method) {

          "installApk" -> {
            val path = call.argument<String>("path")
            if (path.isNullOrBlank()) {
              result.error("NO_PATH", "path is required", null)
              return@setMethodCallHandler
            }
            try {
              installApkSilently(path)
              result.success(true)
            } catch (e: Throwable) {
              result.error("INSTALL_FAILED", e.message, null)
            }
          }

          // ✅ Админ-выход: корректно снимаем киоск и DO
          "clearDeviceOwner" -> {
            try {
              val dpm = getSystemService(Context.DEVICE_POLICY_SERVICE) as DevicePolicyManager
              val admin = ComponentName(this, DeviceAdminReceiver::class.java)

              // 0) Фиксируем “режим выхода”, чтобы onResume больше не включал киоск
              setKioskDisabled(true)

              // 1) выходим из lock task
              try { stopLockTask() } catch (_: Throwable) {}

              // 2) возвращаем статус-бар / keyguard (если было отключено)
              try { dpm.setStatusBarDisabled(admin, false) } catch (_: Throwable) {}
              try { dpm.setKeyguardDisabled(admin, false) } catch (_: Throwable) {}

              // 3) снимаем все DPC-настройки, чтобы приложение перестало быть “домом”
              try { dpm.clearPackagePersistentPreferredActivities(admin, packageName) } catch (_: Throwable) {}
              try { dpm.setLockTaskPackages(admin, emptyArray()) } catch (_: Throwable) {}

              // 4) открываем настройки выбора Home (иначе после снятия DO устройство может
              //    продолжить возвращаться в твой “дом”, особенно если ты добавил HOME-filter)
              try {
                startActivity(
                  Intent(Settings.ACTION_HOME_SETTINGS)
                    .addFlags(Intent.FLAG_ACTIVITY_NEW_TASK)
                )
              } catch (_: Throwable) {
                // fallback, если HOME_SETTINGS нет на прошивке
                try {
                  startActivity(
                    Intent(Settings.ACTION_SETTINGS)
                      .addFlags(Intent.FLAG_ACTIVITY_NEW_TASK)
                  )
                } catch (_: Throwable) {}
              }

              // 5) снимаем Device Owner чуть позже (после открытия настроек)
              Handler(Looper.getMainLooper()).postDelayed({
                try {
                  dpm.clearDeviceOwnerApp(packageName)
                } catch (_: Throwable) {}
              }, 800)

              result.success(true)
            } catch (e: Throwable) {
              result.error("CLEAR_DO_FAILED", e.message, null)
            }
          }

          "openWifi" -> {
            try {
              val dpm = getSystemService(Context.DEVICE_POLICY_SERVICE) as DevicePolicyManager
              val admin = ComponentName(this, DeviceAdminReceiver::class.java)

              // ✅ Временно разрешаем Settings в lock task, чтобы открыть Wi-Fi
              val settingsPkg = "com.android.settings"
              dpm.setLockTaskPackages(admin, arrayOf(packageName, settingsPkg))

              // на всякий случай включим lock task
              try {
                if (dpm.isLockTaskPermitted(packageName)) startLockTask()
              } catch (_: Throwable) {}

              val intent =
                if (Build.VERSION.SDK_INT >= Build.VERSION_CODES.Q) {
                  Intent(Settings.Panel.ACTION_WIFI)
                } else {
                  Intent(Settings.ACTION_WIFI_SETTINGS)
                }

              intent.addFlags(Intent.FLAG_ACTIVITY_NEW_TASK)
              startActivity(intent)

              result.success(true)
            } catch (e: Throwable) {
              result.error("OPEN_WIFI_FAILED", e.message, null)
            }
          }

          // ✅ Если админ захотел вернуть киоск без переустановки (опционально)
          "enableKiosk" -> {
            setKioskDisabled(false)
            result.success(true)
          }

          else -> result.notImplemented()
        }
      }
  }

  override fun onResume() {
    requestedOrientation = ActivityInfo.SCREEN_ORIENTATION_PORTRAIT
    super.onResume()

    // ✅ Если включили “режим выхода” — не включаем киоск обратно
    if (isKioskDisabled()) {
      try { stopLockTask() } catch (_: Throwable) {}
      // можно вернуть системные бары (на всякий случай)
      if (Build.VERSION.SDK_INT >= Build.VERSION_CODES.R) {
        window.insetsController?.apply {
          show(WindowInsets.Type.statusBars() or WindowInsets.Type.navigationBars())
        }
      }
      return
    }

    // ✅ Не уходим в sleep пока активен киоск
    window.addFlags(WindowManager.LayoutParams.FLAG_KEEP_SCREEN_ON)

    applyDpcPolicies()
    hideSystemBarsImmersive()
    enterLockTaskIfPermitted()
  }

  override fun onPause() {
    window.clearFlags(WindowManager.LayoutParams.FLAG_KEEP_SCREEN_ON)
    super.onPause()
  }

  // ✅ (опционально) блокируем громкость в киоске
  override fun dispatchKeyEvent(event: KeyEvent): Boolean {
    return when (event.keyCode) {
      KeyEvent.KEYCODE_VOLUME_UP,
      KeyEvent.KEYCODE_VOLUME_DOWN,
      KeyEvent.KEYCODE_VOLUME_MUTE -> true
      else -> super.dispatchKeyEvent(event)
    }
  }

  private fun applyDpcPolicies() {
    val dpm = getSystemService(Context.DEVICE_POLICY_SERVICE) as DevicePolicyManager
    val admin = ComponentName(this, DeviceAdminReceiver::class.java)

    // 1) lock task только наш пакет (в обычном режиме)
    dpm.setLockTaskPackages(admin, arrayOf(packageName))
    dpm.setLockTaskFeatures(admin, DevicePolicyManager.LOCK_TASK_FEATURE_NONE)

    // 2) делаем приложение “домом” на уровне DPC (чтобы HOME возвращал сюда)
    //    Важно: в Manifest у MainActivity должен быть HOME intent-filter.
    val filter = IntentFilter(Intent.ACTION_MAIN).apply {
      addCategory(Intent.CATEGORY_HOME)
      addCategory(Intent.CATEGORY_DEFAULT)
    }
    dpm.addPersistentPreferredActivity(
      admin,
      filter,
      ComponentName(this, MainActivity::class.java)
    )

    // 3) убираем системные элементы
    try { dpm.setStatusBarDisabled(admin, true) } catch (_: Throwable) {}
    try { dpm.setKeyguardDisabled(admin, true) } catch (_: Throwable) {}
  }

  private fun enterLockTaskIfPermitted() {
    val dpm = getSystemService(Context.DEVICE_POLICY_SERVICE) as DevicePolicyManager
    if (dpm.isLockTaskPermitted(packageName)) {
      try { startLockTask() } catch (_: Throwable) {}
    }
  }

  private fun hideSystemBarsImmersive() {
    if (Build.VERSION.SDK_INT >= Build.VERSION_CODES.R) {
      window.insetsController?.apply {
        hide(WindowInsets.Type.statusBars() or WindowInsets.Type.navigationBars())
        systemBarsBehavior = WindowInsetsController.BEHAVIOR_SHOW_TRANSIENT_BARS_BY_SWIPE
      }
    } else {
      @Suppress("DEPRECATION")
      window.decorView.systemUiVisibility =
        (View.SYSTEM_UI_FLAG_IMMERSIVE_STICKY
          or View.SYSTEM_UI_FLAG_FULLSCREEN
          or View.SYSTEM_UI_FLAG_HIDE_NAVIGATION
          or View.SYSTEM_UI_FLAG_LAYOUT_FULLSCREEN
          or View.SYSTEM_UI_FLAG_LAYOUT_HIDE_NAVIGATION
          or View.SYSTEM_UI_FLAG_LAYOUT_STABLE)
    }
  }

  // ✅ Тихая установка APK через PackageInstaller session (Device Owner)
  private fun installApkSilently(apkPath: String) {
    val apkFile = File(apkPath)
    require(apkFile.exists()) { "APK not found: $apkPath" }

    val installer = packageManager.packageInstaller
    val params = PackageInstaller.SessionParams(PackageInstaller.SessionParams.MODE_FULL_INSTALL)

    val sessionId = installer.createSession(params)
    val session = installer.openSession(sessionId)

    apkFile.inputStream().use { input ->
      session.openWrite("ota.apk", 0, apkFile.length()).use { out ->
        input.copyTo(out)
        session.fsync(out)
      }
    }

    // Важно: InstallResultReceiver должен быть зарегистрирован в Manifest:
    // <receiver android:name=".InstallResultReceiver" android:exported="false" />
    val intent = Intent(this, InstallResultReceiver::class.java)
    val pending = PendingIntent.getBroadcast(
      this,
      sessionId,
      intent,
      PendingIntent.FLAG_UPDATE_CURRENT or PendingIntent.FLAG_IMMUTABLE
    )

    session.commit(pending.intentSender)
    session.close()
  }
}
