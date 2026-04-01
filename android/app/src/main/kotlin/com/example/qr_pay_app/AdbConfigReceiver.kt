package dd.qrPay

import android.app.admin.DevicePolicyManager
import android.content.BroadcastReceiver
import android.content.ComponentName
import android.content.Context
import android.content.Intent
import android.os.Bundle
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
    val config = Bundle().apply {
      val serverUrl = intent.getStringExtra("server_url")
      val kioskCode = intent.getStringExtra("kiosk_code")
      if (!serverUrl.isNullOrBlank()) putString("server_url", serverUrl)
      if (!kioskCode.isNullOrBlank()) putString("kiosk_code", kioskCode)

      if (intent.hasExtra("feature_enabled")) {
        putBoolean("feature_enabled", intent.getBooleanExtra("feature_enabled", false))
      }
    }

    dpm.setApplicationRestrictions(admin, packageName, config)
    MainActivity.notifyManagedConfigChanged()
    Log.i("AdbConfigReceiver", "Managed config applied from ADB: $config")

    val kioskDisable = parseBooleanFlag(intent, "kiosk_disable") == true
    if (kioskDisable) {
      Log.i("AdbConfigReceiver", "kiosk_disable=true, executing clearDeviceOwner flow")
      MainActivity.clearDeviceOwnerFromAnyContext(context.applicationContext)
    }
  }
}
