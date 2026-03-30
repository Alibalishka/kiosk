package dd.qrPay

import android.app.Activity
import android.app.admin.DevicePolicyManager
import android.content.Intent
import android.os.Bundle
import android.os.PersistableBundle

class ProvisioningActivity : Activity() {
    override fun onCreate(savedInstanceState: Bundle?) {
        super.onCreate(savedInstanceState)

        val incomingIntent = intent
        val allowedProvisioningModes =
            incomingIntent.getIntegerArrayListExtra(
                DevicePolicyManager.EXTRA_PROVISIONING_ALLOWED_PROVISIONING_MODES
            )

        val provisioningMode = when {
            allowedProvisioningModes?.contains(DevicePolicyManager.PROVISIONING_MODE_FULLY_MANAGED_DEVICE) == true ->
                DevicePolicyManager.PROVISIONING_MODE_FULLY_MANAGED_DEVICE
            allowedProvisioningModes?.contains(DevicePolicyManager.PROVISIONING_MODE_MANAGED_PROFILE) == true ->
                DevicePolicyManager.PROVISIONING_MODE_MANAGED_PROFILE
            else -> DevicePolicyManager.PROVISIONING_MODE_FULLY_MANAGED_DEVICE
        }

        val resultIntent = incomingIntent
        val adminExtras = incomingIntent.getParcelableExtra<PersistableBundle>(
            DevicePolicyManager.EXTRA_PROVISIONING_ADMIN_EXTRAS_BUNDLE
        )
        if (adminExtras != null) {
            resultIntent.putExtra(DevicePolicyManager.EXTRA_PROVISIONING_ADMIN_EXTRAS_BUNDLE, adminExtras)
        }
        resultIntent.putExtra(DevicePolicyManager.EXTRA_PROVISIONING_MODE, provisioningMode)

        setResult(RESULT_OK, resultIntent)
        finish()
    }
}
