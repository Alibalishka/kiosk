// BootReceiver.kt — после перезагрузки сразу вернуться в киоск
package dd.qrPay

import android.content.BroadcastReceiver
import android.content.Context
import android.content.Intent

class BootReceiver : BroadcastReceiver() {
  // Только BOOT_COMPLETED. LOCKED_BOOT_COMPLETED приходит до разблокировки
  // хранилища: MainActivity не directBootAware, startActivity в этот момент
  // бросал ActivityNotFoundException и ронял процесс сразу после загрузки.
  override fun onReceive(context: Context, intent: Intent) {
    if (intent.action != Intent.ACTION_BOOT_COMPLETED) return
    KioskLauncher.launch(context, "BootReceiver")
  }
}
