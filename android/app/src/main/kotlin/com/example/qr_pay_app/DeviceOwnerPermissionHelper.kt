package dd.qrPay

import android.Manifest
import android.app.admin.DevicePolicyManager
import android.content.ComponentName
import android.content.Context
import android.os.Build
import android.util.Log

/**
 * Для **Device Owner** выставляет runtime‑разрешения, нужные Wi‑Fi (скан/подключение на 10+).
 * Обычным установкам не помогает — тогда по‑прежнему нужен `pm grant`.
 */
object DeviceOwnerPermissionHelper {
  private const val TAG = "DeviceOwnerPerms"

  fun grantWifiPermissionsIfDeviceOwner(context: Context) {
    val appContext = context.applicationContext
    val dpm = appContext.getSystemService(Context.DEVICE_POLICY_SERVICE) as DevicePolicyManager
    val admin = ComponentName(appContext, DeviceAdminReceiver::class.java)
    val pkg = appContext.packageName
    if (!dpm.isDeviceOwnerApp(pkg)) {
      return
    }
    if (Build.VERSION.SDK_INT < Build.VERSION_CODES.M) {
      return
    }
    try {
      val fine = dpm.setPermissionGrantState(
        admin,
        pkg,
        Manifest.permission.ACCESS_FINE_LOCATION,
        DevicePolicyManager.PERMISSION_GRANT_STATE_GRANTED,
      )
      if (!fine) {
        Log.w(TAG, "ACCESS_FINE_LOCATION: setPermissionGrantState returned false")
      }
      if (Build.VERSION.SDK_INT >= Build.VERSION_CODES.TIRAMISU) {
        val nwd = dpm.setPermissionGrantState(
          admin,
          pkg,
          Manifest.permission.NEARBY_WIFI_DEVICES,
          DevicePolicyManager.PERMISSION_GRANT_STATE_GRANTED,
        )
        if (!nwd) {
          Log.w(TAG, "NEARBY_WIFI_DEVICES: setPermissionGrantState returned false")
        }
      }
      Log.i(TAG, "Wi‑Fi runtime permissions granted as Device Owner (fine=$fine)")
    } catch (e: Throwable) {
      Log.e(TAG, "grantWifiPermissionsIfDeviceOwner failed", e)
    }
  }
}
