package dd.qrPay

import android.app.admin.DevicePolicyManager
import android.content.ComponentName
import android.content.Context
import android.content.Intent
import android.content.IntentFilter
import android.util.Log

/**
 * Как ресиверы (загрузка, OTA) поднимают приложение.
 *
 * MainActivity — одновременно HOME и обычная активити. HOME-экземпляр система
 * держит в отдельной home-задаче, и явный Intent на MainActivity её не находит:
 * рядом создаётся вторая MainActivity со своим FlutterEngine. В одном процессе
 * оказываются два приложения — двойная память, двойные таймеры и запросы.
 * Поэтому в киоске (Device Owner) поднимаем приложение HOME-интентом: он
 * попадает в уже живущий home-экземпляр.
 */
object KioskLauncher {
  private const val TAG = "KioskLauncher"

  fun isKioskOwner(context: Context): Boolean = runCatching {
    val dpm = context.getSystemService(Context.DEVICE_POLICY_SERVICE) as DevicePolicyManager
    dpm.isDeviceOwnerApp(context.packageName) && !MainActivity.isKioskDisabled(context)
  }.getOrDefault(false)

  fun launchIntent(context: Context): Intent {
    val intent = if (isKioskOwner(context)) {
      ensureHomeActivity(context)
      Intent(Intent.ACTION_MAIN).addCategory(Intent.CATEGORY_HOME)
    } else {
      Intent(context, MainActivity::class.java)
        .addFlags(Intent.FLAG_ACTIVITY_CLEAR_TOP or Intent.FLAG_ACTIVITY_SINGLE_TOP)
    }
    return intent.addFlags(Intent.FLAG_ACTIVITY_NEW_TASK)
  }

  /** Поднимает приложение. Не бросает: падение ресивера убивает весь процесс. */
  fun launch(context: Context, source: String) {
    try {
      context.startActivity(launchIntent(context))
      Log.i(TAG, "$source: startActivity OK")
    } catch (e: Throwable) {
      Log.w(TAG, "$source: startActivity failed: ${e.message}")
    }
  }

  /** Без этой политики HOME-интент открыл бы системный лаунчер или выбор. */
  private fun ensureHomeActivity(context: Context) {
    try {
      val dpm = context.getSystemService(Context.DEVICE_POLICY_SERVICE) as DevicePolicyManager
      val filter = IntentFilter(Intent.ACTION_MAIN).apply {
        addCategory(Intent.CATEGORY_HOME)
        addCategory(Intent.CATEGORY_DEFAULT)
      }
      dpm.addPersistentPreferredActivity(
        ComponentName(context, DeviceAdminReceiver::class.java),
        filter,
        ComponentName(context, MainActivity::class.java)
      )
    } catch (e: Throwable) {
      Log.w(TAG, "addPersistentPreferredActivity failed: ${e.message}")
    }
  }
}
