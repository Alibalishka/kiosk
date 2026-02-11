package dd.qrPay

import android.app.AlarmManager
import android.app.PendingIntent
import android.content.BroadcastReceiver
import android.content.Context
import android.content.Intent
import android.content.pm.PackageInstaller
import android.util.Log

class InstallResultReceiver : BroadcastReceiver() {

  override fun onReceive(context: Context, intent: Intent) {
    val status = intent.getIntExtra(
      PackageInstaller.EXTRA_STATUS,
      PackageInstaller.STATUS_FAILURE
    )

    val msg = intent.getStringExtra(PackageInstaller.EXTRA_STATUS_MESSAGE) ?: ""

    val extra = intent.extras?.keySet()?.joinToString() ?: ""
    Log.d("InstallResultReceiver", "status=$status msg=$msg extras=[$extra]")

    // ✅ Всегда возвращаемся в MainActivity (и при успехе, и при ошибке),
    // чтобы устройство не оставалось “в системе”.
    scheduleOpenApp(context, 900L)
  }

  private fun scheduleOpenApp(context: Context, delayMs: Long) {
    val launch = Intent(context, MainActivity::class.java).apply {
      addFlags(Intent.FLAG_ACTIVITY_NEW_TASK)
      addFlags(Intent.FLAG_ACTIVITY_CLEAR_TOP)
      addFlags(Intent.FLAG_ACTIVITY_SINGLE_TOP)
    }

    val pi = PendingIntent.getActivity(
      context,
      4001,
      launch,
      PendingIntent.FLAG_UPDATE_CURRENT or PendingIntent.FLAG_IMMUTABLE
    )

    val am = context.getSystemService(Context.ALARM_SERVICE) as AlarmManager
    am.setExactAndAllowWhileIdle(
      AlarmManager.RTC_WAKEUP,
      System.currentTimeMillis() + delayMs,
      pi
    )
  }
}
