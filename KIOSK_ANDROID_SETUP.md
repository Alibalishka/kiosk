# Android Kiosk Mode — Полная инструкция подключения

> Документ основан на реальной реализации проекта `dd.qrPay`.  
> Замените `dd.qrPay` / `YOUR_APP_ID` на `applicationId` вашего проекта.

---

## Содержание

1. [Обзор архитектуры](#1-обзор-архитектуры)
2. [Требования](#2-требования)
3. [Структура файлов](#3-структура-файлов)
4. [Шаг 1 — DeviceAdminReceiver](#шаг-1--deviceadminreceiver)
5. [Шаг 2 — XML-ресурс device_admin_receiver.xml](#шаг-2--xml-ресурс-device_admin_receiverxml)
6. [Шаг 3 — AndroidManifest.xml](#шаг-3--androidmanifestxml)
7. [Шаг 4 — MainActivity (логика киоска)](#шаг-4--mainactivity-логика-киоска)
8. [Шаг 5 — BootReceiver (автозапуск)](#шаг-5--bootreceiver-автозапуск)
9. [Шаг 6 — AppUpdatedReceiver (восстановление после OTA)](#шаг-6--appupdatedreceiver-восстановление-после-ota)
10. [Шаг 7 — DeviceOwnerPermissionHelper](#шаг-7--deviceownerpermissionhelper)
11. [Шаг 8 — AdbConfigReceiver (удалённая конфигурация)](#шаг-8--adbconfigreceiver-удалённая-конфигурация)
12. [Шаг 9 — ProvisioningActivity и FinaliseActivity (Android 12+)](#шаг-9--provisioningactivity-и-finaliseactivity-android-12)
13. [Назначение Device Owner через ADB](#назначение-device-owner-через-adb)
14. [Makefile команды](#makefile-команды)
15. [Flutter-сторона: MethodChannel `dpc`](#flutter-сторона-methodchannel-dpc)
16. [Как отключить киоск (режим выхода)](#как-отключить-киоск-режим-выхода)
17. [Частые ошибки и их решения](#частые-ошибки-и-их-решения)
18. [Чеклист перед релизом](#чеклист-перед-релизом)

---

## 1. Обзор архитектуры

```
Android Device Owner (DPC)
├── DeviceAdminReceiver       — точка входа для DPM API
├── MainActivity              — основная активити + Lock Task + полноэкранный режим
├── BootReceiver              — автозапуск после перезагрузки
├── AppUpdatedReceiver        — восстановление киоска после обновления APK
├── DeviceOwnerPermissionHelper — автовыдача runtime-разрешений (Wi-Fi)
├── AdbConfigReceiver         — удалённая настройка через ADB broadcast
├── ProvisioningActivity      — выбор режима provisioning (Android 12+, QR)
└── FinaliseActivity          — финализация policy compliance (Android 12+, QR)
```

**Ключевые Android API:**
- `DevicePolicyManager` — управление политиками устройства
- `startLockTask()` / `stopLockTask()` — блокировка в одном приложении
- `addPersistentPreferredActivity()` — назначение приложения домашним лаунчером
- `setStatusBarDisabled()` / `setKeyguardDisabled()` — скрытие системных элементов

---

## 2. Требования

| Параметр | Требование |
|---|---|
| Android | API 21+ (минимум), API 29+ (рекомендуется) |
| Device Owner | Назначается **один раз** до установки сторонних аккаунтов |
| ADB | Обязателен для назначения Device Owner |
| applicationId | Ваш уникальный ID (пример: `com.example.myapp`) |
| Flutter | Используется MethodChannel с именем `"dpc"` |

> ⚠️ **Важно:** Device Owner нельзя назначить, если на устройстве уже есть Google-аккаунт или другие пользователи. Устройство должно быть **заводски сброшено**.

---

## 3. Структура файлов

```
android/
└── app/
    └── src/
        └── main/
            ├── AndroidManifest.xml
            ├── kotlin/
            │   └── YOUR_PACKAGE/
            │       ├── MainActivity.kt
            │       ├── DeviceAdminReceiver.kt
            │       ├── BootReceiver.kt
            │       ├── AppUpdatedReceiver.kt
            │       ├── DeviceOwnerPermissionHelper.kt
            │       ├── AdbConfigReceiver.kt
            │       ├── ProvisioningActivity.kt
            │       └── FinaliseActivity.kt
            └── res/
                └── xml/
                    └── device_admin_receiver.xml
```

---

## Шаг 1 — DeviceAdminReceiver

Самый простой класс — точка входа для политик Device Policy Manager.

**Файл:** `kotlin/YOUR_PACKAGE/DeviceAdminReceiver.kt`

```kotlin
package YOUR_APP_ID   // замените на свой applicationId

import android.app.admin.DeviceAdminReceiver

class DeviceAdminReceiver : DeviceAdminReceiver()
```

> Это минимальная реализация. Можно переопределить `onEnabled`, `onDisabled`, `onPasswordFailed` и т.д. если нужна доп. логика.

---

## Шаг 2 — XML-ресурс device_admin_receiver.xml

**Файл:** `res/xml/device_admin_receiver.xml`

```xml
<?xml version="1.0" encoding="utf-8"?>
<device-admin xmlns:android="http://schemas.android.com/apk/res/android">
    <uses-policies />
</device-admin>
```

> `<uses-policies />` можно расширить, если нужны специфические политики (например `<reset-password />`). Для базового киоска — оставьте пустым.

---

## Шаг 3 — AndroidManifest.xml

Добавьте следующие блоки в `AndroidManifest.xml`:

### 3.1 Разрешения

```xml
<uses-permission android:name="android.permission.RECEIVE_BOOT_COMPLETED"/>
<uses-permission android:name="android.permission.WAKE_LOCK"/>
<uses-permission android:name="android.permission.WRITE_SETTINGS"/>
<uses-permission android:name="android.permission.WRITE_SECURE_SETTINGS"/>
<uses-permission android:name="android.permission.INTERNET"/>
<uses-permission android:name="android.permission.ACCESS_NETWORK_STATE"/>
<uses-permission android:name="android.permission.POST_NOTIFICATIONS"/>
```

### 3.2 MainActivity — добавьте HOME intent-filter

```xml
<activity
    android:name=".MainActivity"
    android:exported="true"
    android:launchMode="singleTop"
    android:screenOrientation="portrait"
    android:configChanges="orientation|keyboardHidden|keyboard|screenSize|smallestScreenSize|locale|layoutDirection|fontScale|screenLayout|density|uiMode"
    android:hardwareAccelerated="true"
    android:windowSoftInputMode="adjustResize">

    <!-- Стандартный лаунчер -->
    <intent-filter>
        <action android:name="android.intent.action.MAIN"/>
        <category android:name="android.intent.category.LAUNCHER"/>
    </intent-filter>

    <!-- Киоск как домашний лаунчер (ОБЯЗАТЕЛЬНО для addPersistentPreferredActivity) -->
    <intent-filter>
        <action android:name="android.intent.action.MAIN"/>
        <category android:name="android.intent.category.HOME"/>
        <category android:name="android.intent.category.DEFAULT"/>
    </intent-filter>

</activity>
```

### 3.3 DeviceAdminReceiver

```xml
<!-- Device Admin Receiver (DPC) -->
<receiver
    android:name=".DeviceAdminReceiver"
    android:permission="android.permission.BIND_DEVICE_ADMIN"
    android:exported="true">
    <meta-data
        android:name="android.app.device_admin"
        android:resource="@xml/device_admin_receiver" />
    <intent-filter>
        <action android:name="android.app.action.DEVICE_ADMIN_ENABLED" />
    </intent-filter>
</receiver>
```

### 3.4 BootReceiver

```xml
<!-- Автозапуск после перезагрузки -->
<receiver
    android:name=".BootReceiver"
    android:enabled="true"
    android:exported="false"
    android:directBootAware="true">
    <intent-filter>
        <action android:name="android.intent.action.BOOT_COMPLETED"/>
        <action android:name="android.intent.action.LOCKED_BOOT_COMPLETED"/>
    </intent-filter>
</receiver>
```

### 3.5 AppUpdatedReceiver

```xml
<!-- Восстановление киоска после обновления пакета -->
<receiver
    android:name=".AppUpdatedReceiver"
    android:exported="true">
    <intent-filter>
        <action android:name="android.intent.action.MY_PACKAGE_REPLACED"/>
    </intent-filter>
</receiver>
```

### 3.6 AdbConfigReceiver (опционально — для удалённой настройки)

```xml
<!-- Удалённая настройка через ADB broadcast -->
<receiver
    android:name=".AdbConfigReceiver"
    android:exported="true">
    <intent-filter>
        <action android:name="YOUR_APP_ID.ACTION_CONFIG" />
    </intent-filter>
</receiver>
```

### 3.7 ProvisioningActivity и FinaliseActivity (Android 12+, только для QR provisioning)

```xml
<!-- Выбор режима provisioning -->
<activity
    android:name=".ProvisioningActivity"
    android:exported="true"
    android:permission="android.permission.BIND_DEVICE_ADMIN">
    <intent-filter>
        <action android:name="android.app.action.GET_PROVISIONING_MODE" />
        <category android:name="android.intent.category.DEFAULT" />
    </intent-filter>
</activity>

<!-- Финализация policy compliance -->
<activity
    android:name=".FinaliseActivity"
    android:exported="true"
    android:permission="android.permission.BIND_DEVICE_ADMIN">
    <intent-filter>
        <action android:name="android.app.action.ADMIN_POLICY_COMPLIANCE" />
        <category android:name="android.intent.category.DEFAULT" />
    </intent-filter>
</activity>
```

---

## Шаг 4 — MainActivity (логика киоска)

**Файл:** `kotlin/YOUR_PACKAGE/MainActivity.kt`

```kotlin
package YOUR_APP_ID

import android.app.admin.DevicePolicyManager
import android.content.ComponentName
import android.content.Context
import android.content.Intent
import android.content.IntentFilter
import android.os.Build
import android.os.Handler
import android.os.Looper
import android.provider.Settings
import android.view.KeyEvent
import android.view.WindowInsets
import android.view.WindowInsetsController
import android.view.WindowManager
import android.content.pm.ActivityInfo
import androidx.annotation.NonNull
import io.flutter.embedding.android.FlutterActivity
import io.flutter.embedding.engine.FlutterEngine
import io.flutter.plugin.common.MethodChannel

class MainActivity : FlutterActivity() {

    companion object {
        @Volatile private var instance: MainActivity? = null
        private const val PREFS = "kiosk_prefs"
        private const val KEY_KIOSK_DISABLED = "kiosk_disabled"

        fun notifyManagedConfigChanged() {
            instance?.pushManagedConfigChanged()
        }

        // Корректное снятие Device Owner и выход из киоска
        fun clearDeviceOwnerFromAnyContext(context: Context) {
            val dpm = context.getSystemService(Context.DEVICE_POLICY_SERVICE) as DevicePolicyManager
            val admin = ComponentName(context, DeviceAdminReceiver::class.java)
            val packageName = context.packageName

            // Флаг — отключить киоск при следующем onResume
            context.getSharedPreferences(PREFS, Context.MODE_PRIVATE)
                .edit().putBoolean(KEY_KIOSK_DISABLED, true).apply()

            // Снимаем все политики
            try { dpm.setStatusBarDisabled(admin, false) } catch (_: Throwable) {}
            try { dpm.setKeyguardDisabled(admin, false) } catch (_: Throwable) {}
            try { dpm.clearPackagePersistentPreferredActivities(admin, packageName) } catch (_: Throwable) {}
            try { dpm.setLockTaskPackages(admin, emptyArray()) } catch (_: Throwable) {}

            // Открываем системные настройки (выход из lock task)
            try {
                context.startActivity(
                    Intent(Settings.ACTION_HOME_SETTINGS).addFlags(Intent.FLAG_ACTIVITY_NEW_TASK)
                )
            } catch (_: Throwable) {}

            // Снимаем Device Owner с небольшой задержкой
            Handler(Looper.getMainLooper()).postDelayed({
                try { dpm.clearDeviceOwnerApp(packageName) } catch (_: Throwable) {}
            }, 800)
        }
    }

    private val DPC_CHANNEL = "dpc"

    private fun isKioskDisabled(): Boolean =
        getSharedPreferences(PREFS, MODE_PRIVATE).getBoolean(KEY_KIOSK_DISABLED, false)

    private fun setKioskDisabled(v: Boolean) {
        getSharedPreferences(PREFS, MODE_PRIVATE).edit().putBoolean(KEY_KIOSK_DISABLED, v).apply()
    }

    override fun onCreate(savedInstanceState: android.os.Bundle?) {
        super.onCreate(savedInstanceState)
        // Автовыдача runtime-разрешений (Wi-Fi) при наличии Device Owner
        DeviceOwnerPermissionHelper.grantWifiPermissionsIfDeviceOwner(applicationContext)
        instance = this
    }

    override fun onDestroy() {
        if (instance === this) instance = null
        super.onDestroy()
    }

    override fun configureFlutterEngine(@NonNull flutterEngine: FlutterEngine) {
        super.configureFlutterEngine(flutterEngine)

        MethodChannel(flutterEngine.dartExecutor.binaryMessenger, DPC_CHANNEL)
            .setMethodCallHandler { call, result ->
                when (call.method) {
                    // Выход из киоска (для администратора)
                    "clearDeviceOwner" -> {
                        try {
                            try { stopLockTask() } catch (_: Throwable) {}
                            clearDeviceOwnerFromAnyContext(this)
                            result.success(true)
                        } catch (e: Throwable) {
                            result.error("CLEAR_DO_FAILED", e.message, null)
                        }
                    }

                    // Открыть настройки Wi-Fi прямо из киоска
                    "openWifi" -> {
                        try {
                            val dpm = getSystemService(Context.DEVICE_POLICY_SERVICE) as DevicePolicyManager
                            val admin = ComponentName(this, DeviceAdminReceiver::class.java)
                            dpm.setLockTaskPackages(admin, arrayOf(packageName, "com.android.settings"))

                            val intent = if (Build.VERSION.SDK_INT >= Build.VERSION_CODES.Q) {
                                Intent(Settings.Panel.ACTION_WIFI)
                            } else {
                                Intent(Settings.ACTION_WIFI_SETTINGS)
                            }
                            intent.addFlags(Intent.FLAG_ACTIVITY_NEW_TASK)
                            startActivity(intent)
                            result.success(true)
                        } catch (e: Throwable) {
                            result.error("OPEN_WIFI_FAILED", e.message, null)
                        }
                    }

                    // Вернуть киоск-режим (без переустановки)
                    "enableKiosk" -> {
                        setKioskDisabled(false)
                        result.success(true)
                    }

                    else -> result.notImplemented()
                }
            }
    }

    override fun onResume() {
        // Принудительно портретная ориентация
        requestedOrientation = ActivityInfo.SCREEN_ORIENTATION_PORTRAIT
        super.onResume()

        // Максимальная яркость экрана
        runCatching {
            val lp = window.attributes
            lp.screenBrightness = 1.0f
            window.attributes = lp
        }

        // Если киоск отключён администратором — не возвращаем lock task
        if (isKioskDisabled()) {
            try { stopLockTask() } catch (_: Throwable) {}
            if (Build.VERSION.SDK_INT >= Build.VERSION_CODES.R) {
                window.insetsController?.show(
                    WindowInsets.Type.statusBars() or WindowInsets.Type.navigationBars()
                )
            }
            return
        }

        // Не гасить экран пока киоск активен
        window.addFlags(WindowManager.LayoutParams.FLAG_KEEP_SCREEN_ON)

        applyDpcPolicies()
        hideSystemBarsImmersive()
        enterLockTaskIfPermitted()
    }

    override fun onPause() {
        window.clearFlags(WindowManager.LayoutParams.FLAG_KEEP_SCREEN_ON)
        super.onPause()
    }

    // Блокируем кнопки громкости в киоске
    override fun dispatchKeyEvent(event: KeyEvent): Boolean {
        return when (event.keyCode) {
            KeyEvent.KEYCODE_VOLUME_UP,
            KeyEvent.KEYCODE_VOLUME_DOWN,
            KeyEvent.KEYCODE_VOLUME_MUTE -> true
            else -> super.dispatchKeyEvent(event)
        }
    }

    private fun applyDpcPolicies() {
        val dpm = getSystemService(Context.DEVICE_POLICY_SERVICE) as DevicePolicyManager
        val admin = ComponentName(this, DeviceAdminReceiver::class.java)

        // 1) Lock Task — только наш пакет
        dpm.setLockTaskPackages(admin, arrayOf(packageName))
        dpm.setLockTaskFeatures(admin, DevicePolicyManager.LOCK_TASK_FEATURE_NONE)

        // 2) Назначаем приложение домашним лаунчером через DPM
        val filter = IntentFilter(Intent.ACTION_MAIN).apply {
            addCategory(Intent.CATEGORY_HOME)
            addCategory(Intent.CATEGORY_DEFAULT)
        }
        dpm.addPersistentPreferredActivity(
            admin,
            filter,
            ComponentName(this, MainActivity::class.java)
        )

        // 3) Скрываем статус-бар и клавиатуру блокировки
        try { dpm.setStatusBarDisabled(admin, true) } catch (_: Throwable) {}
        try { dpm.setKeyguardDisabled(admin, true) } catch (_: Throwable) {}
    }

    private fun enterLockTaskIfPermitted() {
        val dpm = getSystemService(Context.DEVICE_POLICY_SERVICE) as DevicePolicyManager
        if (dpm.isLockTaskPermitted(packageName)) {
            try { startLockTask() } catch (_: Throwable) {}
        }
    }

    private fun hideSystemBarsImmersive() {
        if (Build.VERSION.SDK_INT >= Build.VERSION_CODES.R) {
            window.insetsController?.apply {
                hide(WindowInsets.Type.statusBars() or WindowInsets.Type.navigationBars())
                systemBarsBehavior = WindowInsetsController.BEHAVIOR_SHOW_TRANSIENT_BARS_BY_SWIPE
            }
        } else {
            @Suppress("DEPRECATION")
            window.decorView.systemUiVisibility = (
                android.view.View.SYSTEM_UI_FLAG_IMMERSIVE_STICKY
                or android.view.View.SYSTEM_UI_FLAG_FULLSCREEN
                or android.view.View.SYSTEM_UI_FLAG_HIDE_NAVIGATION
                or android.view.View.SYSTEM_UI_FLAG_LAYOUT_FULLSCREEN
                or android.view.View.SYSTEM_UI_FLAG_LAYOUT_HIDE_NAVIGATION
                or android.view.View.SYSTEM_UI_FLAG_LAYOUT_STABLE
            )
        }
    }

    private fun pushManagedConfigChanged() {
        runOnUiThread {
            val engine = flutterEngine ?: return@runOnUiThread
            MethodChannel(engine.dartExecutor.binaryMessenger, DPC_CHANNEL)
                .invokeMethod("managedConfigChanged", null)
        }
    }
}
```

---

## Шаг 5 — BootReceiver (автозапуск)

**Файл:** `kotlin/YOUR_PACKAGE/BootReceiver.kt`

```kotlin
package YOUR_APP_ID

import android.content.BroadcastReceiver
import android.content.Context
import android.content.Intent

class BootReceiver : BroadcastReceiver() {
    override fun onReceive(context: Context, intent: Intent) {
        val action = intent.action ?: return
        if (action != Intent.ACTION_BOOT_COMPLETED && action != Intent.ACTION_LOCKED_BOOT_COMPLETED) return

        val launch = Intent(context, MainActivity::class.java).apply {
            addFlags(Intent.FLAG_ACTIVITY_NEW_TASK)
            addFlags(Intent.FLAG_ACTIVITY_CLEAR_TOP)
            addFlags(Intent.FLAG_ACTIVITY_SINGLE_TOP)
        }
        context.startActivity(launch)
    }
}
```

> `android:directBootAware="true"` в манифесте позволяет получить broadcast `LOCKED_BOOT_COMPLETED` ещё до ввода PIN/пароля — это важно для автозапуска на устройствах с шифрованием.

---

## Шаг 6 — AppUpdatedReceiver (восстановление после OTA)

После тихой установки APK Lock Task сбрасывается. Этот receiver восстанавливает все политики.

**Файл:** `kotlin/YOUR_PACKAGE/AppUpdatedReceiver.kt`

```kotlin
package YOUR_APP_ID

import android.app.AlarmManager
import android.app.PendingIntent
import android.app.admin.DevicePolicyManager
import android.content.BroadcastReceiver
import android.content.ComponentName
import android.content.Context
import android.content.Intent
import android.content.IntentFilter
import android.os.SystemClock
import android.util.Log

class AppUpdatedReceiver : BroadcastReceiver() {
    override fun onReceive(context: Context, intent: Intent) {
        Log.i("AppUpdatedReceiver", "MY_PACKAGE_REPLACED — restoring kiosk...")

        // 1) Восстанавливаем DPC-политики
        try {
            val dpm = context.getSystemService(Context.DEVICE_POLICY_SERVICE) as DevicePolicyManager
            val admin = ComponentName(context, DeviceAdminReceiver::class.java)

            val filter = IntentFilter(Intent.ACTION_MAIN).apply {
                addCategory(Intent.CATEGORY_HOME)
                addCategory(Intent.CATEGORY_DEFAULT)
            }
            dpm.addPersistentPreferredActivity(admin, filter, ComponentName(context, MainActivity::class.java))
            dpm.setLockTaskPackages(admin, arrayOf(context.packageName))
            dpm.setLockTaskFeatures(admin, DevicePolicyManager.LOCK_TASK_FEATURE_NONE)
        } catch (e: Throwable) {
            Log.w("AppUpdatedReceiver", "DPC restore failed: ${e.message}")
        }

        // 2) Запускаем приложение
        val launch = Intent(context, MainActivity::class.java).apply {
            addFlags(Intent.FLAG_ACTIVITY_NEW_TASK)
            addFlags(Intent.FLAG_ACTIVITY_CLEAR_TOP)
            addFlags(Intent.FLAG_ACTIVITY_SINGLE_TOP)
        }
        runCatching { context.startActivity(launch) }

        // 3) Несколько fallback-ов через AlarmManager (1с, 3с, 6с) на случай если startActivity не успел
        val am = context.getSystemService(Context.ALARM_SERVICE) as AlarmManager
        for ((idx, delay) in longArrayOf(1000L, 3000L, 6000L).withIndex()) {
            val pi = PendingIntent.getActivity(
                context, 3001 + idx, launch,
                PendingIntent.FLAG_UPDATE_CURRENT or PendingIntent.FLAG_IMMUTABLE
            )
            runCatching {
                am.setAndAllowWhileIdle(AlarmManager.ELAPSED_REALTIME_WAKEUP,
                    SystemClock.elapsedRealtime() + delay, pi)
            }
        }
    }
}
```

---

## Шаг 7 — DeviceOwnerPermissionHelper

Автоматически выдаёт runtime-разрешения при наличии Device Owner (нет диалога у пользователя).

**Файл:** `kotlin/YOUR_PACKAGE/DeviceOwnerPermissionHelper.kt`

```kotlin
package YOUR_APP_ID

import android.Manifest
import android.app.admin.DevicePolicyManager
import android.content.ComponentName
import android.content.Context
import android.os.Build
import android.util.Log

object DeviceOwnerPermissionHelper {
    private const val TAG = "DeviceOwnerPerms"

    fun grantWifiPermissionsIfDeviceOwner(context: Context) {
        val appContext = context.applicationContext
        val dpm = appContext.getSystemService(Context.DEVICE_POLICY_SERVICE) as DevicePolicyManager
        val admin = ComponentName(appContext, DeviceAdminReceiver::class.java)
        val pkg = appContext.packageName

        // Если не DO — ничего не делаем
        if (!dpm.isDeviceOwnerApp(pkg)) return
        if (Build.VERSION.SDK_INT < Build.VERSION_CODES.M) return

        try {
            dpm.setPermissionGrantState(
                admin, pkg,
                Manifest.permission.ACCESS_FINE_LOCATION,
                DevicePolicyManager.PERMISSION_GRANT_STATE_GRANTED
            )
            if (Build.VERSION.SDK_INT >= Build.VERSION_CODES.TIRAMISU) {
                dpm.setPermissionGrantState(
                    admin, pkg,
                    Manifest.permission.NEARBY_WIFI_DEVICES,
                    DevicePolicyManager.PERMISSION_GRANT_STATE_GRANTED
                )
            }
            Log.i(TAG, "Wi-Fi runtime permissions granted as Device Owner")
        } catch (e: Throwable) {
            Log.e(TAG, "grantWifiPermissionsIfDeviceOwner failed", e)
        }
    }
}
```

---

## Шаг 8 — AdbConfigReceiver (удалённая конфигурация)

Позволяет через ADB передавать параметры (server_url, kiosk_code, wifi, и т.д.) без перекомпиляции.

**Файл:** `kotlin/YOUR_PACKAGE/AdbConfigReceiver.kt`

```kotlin
package YOUR_APP_ID

import android.app.admin.DevicePolicyManager
import android.content.BroadcastReceiver
import android.content.ComponentName
import android.content.Context
import android.content.Intent
import android.os.Bundle
import android.util.Log

class AdbConfigReceiver : BroadcastReceiver() {
    override fun onReceive(context: Context, intent: Intent) {
        if (intent.action != "YOUR_APP_ID.ACTION_CONFIG") return

        val dpm = context.getSystemService(Context.DEVICE_POLICY_SERVICE) as DevicePolicyManager
        val packageName = context.packageName

        if (!dpm.isDeviceOwnerApp(packageName)) {
            Log.w("AdbConfigReceiver", "Skip: app is not Device Owner")
            return
        }

        val admin = ComponentName(context, DeviceAdminReceiver::class.java)

        val config = Bundle().apply {
            intent.getStringExtra("server_url")?.let { putString("server_url", it) }
            intent.getStringExtra("kiosk_code")?.let { putString("kiosk_code", it) }
            if (intent.hasExtra("section_id")) putInt("section_id", intent.getIntExtra("section_id", -1))
        }

        // Сохраняем как Managed Configuration
        dpm.setApplicationRestrictions(admin, packageName, config)
        // Уведомляем Flutter о смене конфига
        MainActivity.notifyManagedConfigChanged()
        Log.i("AdbConfigReceiver", "Config applied: $config")
    }
}
```

**Пример отправки через ADB:**
```bash
adb shell am broadcast \
  -a YOUR_APP_ID.ACTION_CONFIG \
  --es server_url "https://api.example.com" \
  --es kiosk_code "TERMINAL_001" \
  --ei section_id 5
```

---

## Шаг 9 — ProvisioningActivity и FinaliseActivity (Android 12+)

Нужны только если планируете использовать QR-provisioning (разворачивание устройства через QR-код без ручного ADB).

**Файл:** `kotlin/YOUR_PACKAGE/ProvisioningActivity.kt`

```kotlin
package YOUR_APP_ID

import android.app.Activity
import android.app.admin.DevicePolicyManager
import android.content.Intent
import android.os.Bundle

class ProvisioningActivity : Activity() {
    override fun onCreate(savedInstanceState: Bundle?) {
        super.onCreate(savedInstanceState)

        // Указываем режим: полностью управляемое устройство (не Work Profile)
        val resultIntent = Intent().apply {
            putExtra(
                DevicePolicyManager.EXTRA_PROVISIONING_MODE,
                DevicePolicyManager.PROVISIONING_MODE_FULLY_MANAGED_DEVICE
            )
        }
        setResult(RESULT_OK, resultIntent)
        finish()
    }
}
```

**Файл:** `kotlin/YOUR_PACKAGE/FinaliseActivity.kt`

```kotlin
package YOUR_APP_ID

import android.app.Activity
import android.os.Bundle

class FinaliseActivity : Activity() {
    override fun onCreate(savedInstanceState: Bundle?) {
        super.onCreate(savedInstanceState)
        setResult(RESULT_OK)
        finish()
    }
}
```

---

## Назначение Device Owner через ADB

### Предварительные условия

1. На устройстве **нет Google-аккаунтов** (или устройство только что после factory reset)
2. Включена отладка по USB (`Параметры разработчика → Отладка USB`)
3. Приложение **уже установлено** на устройство (`flutter install` или `adb install app.apk`)

### Команда назначения

```bash
# Общий формат:
adb shell dpm set-device-owner "YOUR_APP_ID/.DeviceAdminReceiver"

# Для проекта dd.qrPay:
adb shell dpm set-device-owner "dd.qrPay/.DeviceAdminReceiver"
```

### Проверка

```bash
# Проверить, кто является Device Owner
adb shell dpm list-owners
```

**Ожидаемый вывод:**
```
Current Device Owner:
  Package: YOUR_APP_ID
  Component: YOUR_APP_ID/.DeviceAdminReceiver
```

### Makefile-команды (из проекта)

```bash
# Назначить Device Owner
make set-device-admin

# Проверить владельца
make list-device-admin
```

### Возможные ошибки при назначении

| Ошибка | Причина | Решение |
|---|---|---|
| `Not allowed to set the device owner because there are already several users on the device` | Есть другие пользователи | Factory reset |
| `Not allowed to set the device owner because there are already some accounts on the device` | Добавлен Google-аккаунт | Factory reset или удалить аккаунт |
| `java.lang.IllegalArgumentException: Unknown admin` | Неверный `applicationId` или компонент | Проверить `applicationId` в `build.gradle` |
| `java.lang.SecurityException: Admin ... is not installed` | Приложение не установлено | Установить APK перед командой |

---

## Makefile команды

```makefile
# Назначить Device Owner (из Makefile проекта)
set-device-admin:
	@echo "* Назначь Device Owner *"
	@adb shell dpm set-device-owner "dd.qrPay/.DeviceAdminReceiver"

# Список владельцев
list-device-admin:
	@echo "* Список Device Owner *"
	@adb shell dpm list-owners
```

Запуск:
```bash
make set-device-admin
make list-device-admin
```

---

## Flutter-сторона: MethodChannel `dpc`

Из Dart-кода вызывайте методы через канал `"dpc"`:

```dart
import 'package:flutter/services.dart';

class DpcChannel {
  static const _channel = MethodChannel('dpc');

  /// Выйти из режима киоска (снять Device Owner)
  static Future<void> clearDeviceOwner() async {
    await _channel.invokeMethod('clearDeviceOwner');
  }

  /// Открыть настройки Wi-Fi прямо из lock task
  static Future<void> openWifi() async {
    await _channel.invokeMethod('openWifi');
  }

  /// Вернуть режим киоска
  static Future<void> enableKiosk() async {
    await _channel.invokeMethod('enableKiosk');
  }
}
```

**Получение события смены конфига:**
```dart
MethodChannel('dpc').setMethodCallHandler((call) async {
  if (call.method == 'managedConfigChanged') {
    // перечитать managed config
  }
});
```

---

## Как отключить киоск (режим выхода)

### Через Flutter (администратор)

```dart
await DpcChannel.clearDeviceOwner();
```

Порядок действий внутри:
1. `stopLockTask()` — выходим из Lock Task
2. `setStatusBarDisabled(admin, false)` — возвращаем статус-бар
3. `setKeyguardDisabled(admin, false)` — возвращаем экран блокировки
4. `clearPackagePersistentPreferredActivities()` — снимаем назначение лаунчера
5. `setLockTaskPackages(admin, emptyArray())` — очищаем список разрешённых
6. `clearDeviceOwnerApp()` — снимаем Device Owner (с задержкой 800ms)

### Через ADB (аварийный выход)

```bash
# Аварийно снять Device Owner через ADB
adb shell dpm remove-active-admin "YOUR_APP_ID/.DeviceAdminReceiver"

# Или полностью через dpm:
adb shell dpm clear-device-owner
```

---

## Частые ошибки и их решения

### 1. Lock Task не запускается

**Симптом:** `startLockTask()` ничего не делает или выбрасывает исключение.

**Причина:** Приложение не является Device Owner или пакет не добавлен в `setLockTaskPackages`.

**Решение:**
```kotlin
// Проверить перед вызовом
val dpm = getSystemService(Context.DEVICE_POLICY_SERVICE) as DevicePolicyManager
if (dpm.isLockTaskPermitted(packageName)) {
    startLockTask()
}
```

---

### 2. Статус-бар возвращается при свайпе

**Причина:** Не вызван `setStatusBarDisabled()` или нет Device Owner.

**Решение:** `setStatusBarDisabled(admin, true)` работает только при наличии Device Owner. Без него — только `WindowInsetsController`.

---

### 3. Приложение не возвращается после перезагрузки

**Причина:** `BootReceiver` не зарегистрирован или нет разрешения `RECEIVE_BOOT_COMPLETED`.

**Проверка:**
```bash
adb shell dumpsys package YOUR_APP_ID | grep -A5 "Receivers"
```

---

### 4. HOME-кнопка выходит из приложения

**Причина:** Не настроен HOME intent-filter в ManifestActivity или не вызван `addPersistentPreferredActivity`.

**Решение:** Убедитесь что в ManifestActivity есть:
```xml
<intent-filter>
    <action android:name="android.intent.action.MAIN"/>
    <category android:name="android.intent.category.HOME"/>
    <category android:name="android.intent.category.DEFAULT"/>
</intent-filter>
```
И что `addPersistentPreferredActivity()` вызывается в `applyDpcPolicies()`.

---

### 5. `dpm set-device-owner` выдаёт ошибку аккаунта

```bash
# Удалить все аккаунты через ADB (если нет физического доступа)
adb shell pm clear com.google.android.gms
```
> После этого может потребоваться Factory Reset.

---

## Чеклист перед релизом

- [ ] `DeviceAdminReceiver` класс создан и указан в манифесте
- [ ] `res/xml/device_admin_receiver.xml` создан
- [ ] `AndroidManifest.xml` содержит HOME intent-filter у MainActivity
- [ ] `BootReceiver` зарегистрирован с `directBootAware="true"`
- [ ] `AppUpdatedReceiver` зарегистрирован с action `MY_PACKAGE_REPLACED`
- [ ] `applicationId` в `build.gradle` совпадает с пакетом в ADB-команде
- [ ] APK установлен на устройство **до** назначения Device Owner
- [ ] На устройстве нет Google-аккаунтов перед назначением DO
- [ ] Команда `make set-device-admin` выполнена успешно
- [ ] `make list-device-admin` подтверждает назначение
- [ ] После перезагрузки устройства приложение запускается автоматически
- [ ] HOME-кнопка не выводит из приложения
- [ ] Статус-бар и панель навигации скрыты
- [ ] Кнопки громкости не работают (если нужно)

---

## Дополнительные ресурсы

- [Android Device Policy Manager docs](https://developer.android.com/reference/android/app/admin/DevicePolicyManager)
- [Lock Task Mode](https://developer.android.com/work/dpc/dedicated-devices/lock-task-mode)
- [Device Owner Provisioning](https://developer.android.com/work/dpc/dedicated-devices)
- [Android Enterprise](https://developers.google.com/android/work/overview)
