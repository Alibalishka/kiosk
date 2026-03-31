package dd.qrPay

import android.app.Activity
import android.app.admin.DevicePolicyManager
import android.content.Intent
import android.os.Build
import android.os.Bundle
import android.os.PersistableBundle

class ProvisioningActivity : Activity() {
    override fun onCreate(savedInstanceState: Bundle?) {
        super.onCreate(savedInstanceState)

        val allowedModes: ArrayList<Int>? =
            intent.getIntegerArrayListExtra(
                "android.app.extra.PROVISIONING_ALLOWED_PROVISIONING_MODES"
            )

        val mode: Int = when {
            allowedModes == null -> 1 // PROVISIONING_MODE_FULLY_MANAGED_DEVICE
            allowedModes.contains(1) -> 1 // fully managed
            allowedModes.contains(2) -> 2 // managed profile
            allowedModes.isNotEmpty() -> allowedModes[0]
            else -> 1
        }

        val result = Intent()

        if (Build.VERSION.SDK_INT >= Build.VERSION_CODES.LOLLIPOP) {
            @Suppress("DEPRECATION")
            val extras: PersistableBundle? =
                intent.getParcelableExtra("android.app.extra.PROVISIONING_ADMIN_EXTRAS_BUNDLE")
            if (extras != null) {
                result.putExtra("android.app.extra.PROVISIONING_ADMIN_EXTRAS_BUNDLE", extras)
            }
        }

        result.putExtra("android.app.extra.PROVISIONING_MODE", mode)
        setResult(RESULT_OK, result)
        finish()
    }
}
