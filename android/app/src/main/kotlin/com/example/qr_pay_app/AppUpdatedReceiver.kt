package dd.qrPay

import android.app.AlarmManager
import android.app.PendingIntent
import android.app.admin.DevicePolicyManager
import android.content.BroadcastReceiver
import android.content.ComponentName
import android.content.Context
import android.content.Intent
import android.content.IntentFilter
import android.os.SystemClock
import android.util.Log

class AppUpdatedReceiver : BroadcastReceiver() {
  override fun onReceive(context: Context, intent: Intent) {
    Log.i("AppUpdatedReceiver", "MY_PACKAGE_REPLACED received, restoring kiosk...")

    // 1) Восстанавливаем DPC-политики (Device Owner)
    try {
      val dpm = context.getSystemService(Context.DEVICE_POLICY_SERVICE) as DevicePolicyManager
      val admin = ComponentName(context, DeviceAdminReceiver::class.java)

      val filter = IntentFilter(Intent.ACTION_MAIN).apply {
        addCategory(Intent.CATEGORY_HOME)
        addCategory(Intent.CATEGORY_DEFAULT)
      }
      dpm.addPersistentPreferredActivity(
        admin,
        filter,
        ComponentName(context, MainActivity::class.java)
      )

      dpm.setLockTaskPackages(admin, arrayOf(context.packageName))
      dpm.setLockTaskFeatures(admin, DevicePolicyManager.LOCK_TASK_FEATURE_NONE)
    } catch (e: Throwable) {
      Log.w("AppUpdatedReceiver", "DPC restore failed: ${e.message}")
    }

    // 2) Intent на запуск
    val launch = Intent(context, MainActivity::class.java).apply {
      addFlags(Intent.FLAG_ACTIVITY_NEW_TASK)
      addFlags(Intent.FLAG_ACTIVITY_CLEAR_TOP)
      addFlags(Intent.FLAG_ACTIVITY_SINGLE_TOP)
    }

    // 3) Попытка открыть сразу
    runCatching {
      context.startActivity(launch)
      Log.i("AppUpdatedReceiver", "Immediate startActivity OK")
    }.onFailure {
      Log.w("AppUpdatedReceiver", "Immediate startActivity failed: ${it.message}")
    }

    // 4) Несколько отложенных fallback-ов через AlarmManager (1с, 3с, 6с)
    //    Разные requestCode чтобы не перезаписывать друг друга.
    val am = context.getSystemService(Context.ALARM_SERVICE) as AlarmManager
    val delays = longArrayOf(1000L, 3000L, 6000L)

    for ((idx, delay) in delays.withIndex()) {
      val pi = PendingIntent.getActivity(
        context,
        3001 + idx,
        launch,
        PendingIntent.FLAG_UPDATE_CURRENT or PendingIntent.FLAG_IMMUTABLE
      )

      runCatching {
        am.setAndAllowWhileIdle(
          AlarmManager.ELAPSED_REALTIME_WAKEUP,
          SystemClock.elapsedRealtime() + delay,
          pi
        )
      }.onFailure {
        // совсем крайний случай
        runCatching {
          am.set(
            AlarmManager.ELAPSED_REALTIME_WAKEUP,
            SystemClock.elapsedRealtime() + delay,
            pi
          )
        }
      }
    }

    Log.i("AppUpdatedReceiver", "Scheduled ${delays.size} fallback alarms")
  }
}
