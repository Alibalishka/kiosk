package dd.qrPay

import android.app.AlarmManager
import android.app.PendingIntent
import android.content.BroadcastReceiver
import android.content.Context
import android.content.Intent
import android.content.pm.PackageInstaller
import android.os.SystemClock
import android.util.Log

class InstallResultReceiver : BroadcastReceiver() {

  override fun onReceive(context: Context, intent: Intent) {
    val status = intent.getIntExtra(
      PackageInstaller.EXTRA_STATUS,
      PackageInstaller.STATUS_FAILURE
    )

    val msg = intent.getStringExtra(PackageInstaller.EXTRA_STATUS_MESSAGE) ?: ""

    val extra = intent.extras?.keySet()?.joinToString() ?: ""
    val tag = "InstallResultReceiver"
    when (status) {
      PackageInstaller.STATUS_SUCCESS ->
        Log.i(tag, "OTA install SUCCESS")
      PackageInstaller.STATUS_FAILURE ->
        Log.e(tag, "OTA install FAILURE: $msg")
      PackageInstaller.STATUS_FAILURE_ABORTED ->
        Log.e(tag, "OTA install ABORTED: $msg")
      PackageInstaller.STATUS_FAILURE_BLOCKED ->
        Log.e(tag, "OTA install BLOCKED: $msg")
      PackageInstaller.STATUS_FAILURE_CONFLICT ->
        Log.e(tag, "OTA install CONFLICT (signature mismatch?): $msg")
      PackageInstaller.STATUS_FAILURE_INCOMPATIBLE ->
        Log.e(tag, "OTA install INCOMPATIBLE: $msg")
      PackageInstaller.STATUS_FAILURE_INVALID ->
        Log.e(tag, "OTA install INVALID APK: $msg")
      PackageInstaller.STATUS_FAILURE_STORAGE ->
        Log.e(tag, "OTA install STORAGE error: $msg")
      else ->
        Log.w(tag, "OTA install unknown status=$status msg=$msg")
    }
    Log.d(tag, "extras=[$extra]")

    // Сохраняем результат в SharedPreferences, чтобы Flutter мог прочитать
    context.getSharedPreferences("ota_prefs", Context.MODE_PRIVATE)
      .edit()
      .putInt("install_status", status)
      .putString("install_message", msg)
      .putLong("install_timestamp", System.currentTimeMillis())
      .apply()

    // Всегда возвращаемся в MainActivity (и при успехе, и при ошибке),
    // чтобы устройство не оставалось "в системе".
    scheduleOpenApp(context)
  }

  private fun scheduleOpenApp(context: Context) {
    val launch = Intent(context, MainActivity::class.java).apply {
      addFlags(Intent.FLAG_ACTIVITY_NEW_TASK)
      addFlags(Intent.FLAG_ACTIVITY_CLEAR_TOP)
      addFlags(Intent.FLAG_ACTIVITY_SINGLE_TOP)
    }

    // Попытка открыть сразу
    runCatching {
      context.startActivity(launch)
      Log.i("InstallResultReceiver", "Immediate startActivity OK")
    }.onFailure {
      Log.w("InstallResultReceiver", "Immediate startActivity failed: ${it.message}")
    }

    // Несколько fallback-алармов (1с, 3с, 6с)
    val am = context.getSystemService(Context.ALARM_SERVICE) as AlarmManager
    val delays = longArrayOf(1000L, 3000L, 6000L)

    for ((idx, delay) in delays.withIndex()) {
      val pi = PendingIntent.getActivity(
        context,
        4001 + idx,
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
        runCatching {
          am.set(
            AlarmManager.ELAPSED_REALTIME_WAKEUP,
            SystemClock.elapsedRealtime() + delay,
            pi
          )
        }
      }
    }

    Log.i("InstallResultReceiver", "Scheduled ${delays.size} fallback alarms")
  }
}
