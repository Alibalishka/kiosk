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

class AppUpdatedReceiver : BroadcastReceiver() {
  override fun onReceive(context: Context, intent: Intent) {

    // 1) DeviceOwner-логика (как у тебя)
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
    } catch (_: Throwable) {
      // не DO — ок, продолжим
    }

    // 2) Intent на запуск
    val launch = Intent(context, MainActivity::class.java).apply {
      addFlags(Intent.FLAG_ACTIVITY_NEW_TASK)
      addFlags(Intent.FLAG_ACTIVITY_CLEAR_TOP)
      addFlags(Intent.FLAG_ACTIVITY_SINGLE_TOP)
    }

    // 3) Попытка открыть сразу (иногда проходит)
    runCatching { context.startActivity(launch) }

    // 4) Фолбэк: отложенный запуск через PendingIntent + НЕ exact alarm
    val pi = PendingIntent.getActivity(
      context,
      3001,
      launch,
      PendingIntent.FLAG_UPDATE_CURRENT or PendingIntent.FLAG_IMMUTABLE
    )

    val am = context.getSystemService(Context.ALARM_SERVICE) as AlarmManager
    val triggerAt = SystemClock.elapsedRealtime() + 1200L

    // на всякий случай убираем старый
    runCatching { am.cancel(pi) }

    // НЕ требует SCHEDULE_EXACT_ALARM и не падает
    runCatching {
      am.setAndAllowWhileIdle(
        AlarmManager.ELAPSED_REALTIME_WAKEUP,
        triggerAt,
        pi
      )
    }.onFailure {
      // совсем крайний случай
      runCatching {
        am.set(
          AlarmManager.ELAPSED_REALTIME_WAKEUP,
          triggerAt,
          pi
        )
      }
    }
  }
}
