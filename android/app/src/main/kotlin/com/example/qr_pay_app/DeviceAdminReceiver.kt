package dd.qrPay

import android.app.admin.DeviceAdminReceiver
import android.app.admin.DevicePolicyManager
import android.content.ComponentName
import android.content.Context
import android.content.Intent
import android.content.IntentFilter
import android.util.Log

class DeviceAdminReceiver : DeviceAdminReceiver() {

    override fun onProfileProvisioningComplete(context: Context, intent: Intent) {
        Log.i(TAG, "onProfileProvisioningComplete")
        setupKiosk(context)
    }

    override fun onEnabled(context: Context, intent: Intent) {
        Log.i(TAG, "onEnabled — device admin activated")
    }

    private fun setupKiosk(context: Context) {
        val dpm = context.getSystemService(Context.DEVICE_POLICY_SERVICE) as DevicePolicyManager
        val admin = ComponentName(context, DeviceAdminReceiver::class.java)
        val pkg = context.packageName

        runCatching {
            dpm.setLockTaskPackages(admin, arrayOf(pkg))
            dpm.setLockTaskFeatures(admin, DevicePolicyManager.LOCK_TASK_FEATURE_NONE)
            Log.i(TAG, "Lock task set for $pkg")
        }.onFailure { Log.w(TAG, "setLockTaskPackages failed: ${it.message}") }

        runCatching {
            val filter = IntentFilter(Intent.ACTION_MAIN).apply {
                addCategory(Intent.CATEGORY_HOME)
                addCategory(Intent.CATEGORY_DEFAULT)
            }
            dpm.addPersistentPreferredActivity(
                admin,
                filter,
                ComponentName(context, MainActivity::class.java)
            )
            Log.i(TAG, "Persistent preferred activity set")
        }.onFailure { Log.w(TAG, "addPersistentPreferredActivity failed: ${it.message}") }
    }

    companion object {
        private const val TAG = "DeviceAdminReceiver"
    }
}
