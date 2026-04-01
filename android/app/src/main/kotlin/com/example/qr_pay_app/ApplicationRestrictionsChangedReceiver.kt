package dd.qrPay

import android.content.BroadcastReceiver
import android.content.Context
import android.content.Intent
import android.util.Log

class ApplicationRestrictionsChangedReceiver : BroadcastReceiver() {
  override fun onReceive(context: Context, intent: Intent) {
    Log.i("RestrictionsReceiver", "APPLICATION_RESTRICTIONS_CHANGED received")
    MainActivity.notifyManagedConfigChanged()
  }
}
