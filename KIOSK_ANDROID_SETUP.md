# Android Kiosk Mode — Полная инструкция подключения

> Документ основан на реальной реализации проекта `dd.qrPay`.
> Замените `dd.qrPay` / `YOUR_APP_ID` на `applicationId` вашего проекта, если переносите в другой.
>
> Если тебе просто нужно **настроить конкретное физическое устройство** (без чтения кода) — сразу переходи в раздел [0. Быстрый старт для оператора](#0-быстрый-старт-для-оператора).
> Если нужно **реализовать киоск-режим в коде** — читай с раздела [1. Обзор архитектуры](#1-обзор-архитектуры).

---

## Содержание

0. [Быстрый старт для оператора](#0-быстрый-старт-для-оператора)
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
15. [Установка новой сборки по ссылке (тихое OTA-обновление)](#установка-новой-сборки-по-ссылке-тихое-ota-обновление)
16. [Flutter-сторона: MethodChannel `dpc`](#flutter-сторона-methodchannel-dpc)
17. [Как отключить киоск (режим выхода)](#как-отключить-киоск-режим-выхода)
18. [Частые ошибки и их решения](#частые-ошибки-и-их-решения)
19. [Чеклист перед релизом (для разработчика)](#чеклист-перед-релизом-для-разработчика)
20. [Чеклист сдачи устройства (для оператора)](#чеклист-сдачи-устройства-для-оператора)
21. [Дополнительные ресурсы](#дополнительные-ресурсы)

---

## 0. Быстрый старт для оператора

Этот раздел — для того, кто физически настраивает планшет/терминал под `dd.qrPay` и не пишет код. Всё нужное уже реализовано в проекте, здесь только последовательность действий.

### Что получится

После выполнения этих шагов устройство:

- при включении сразу открывает приложение и **не выходит** из него (кнопки "Домой"/"Назад"/недавние — не работают);
- не показывает шторку уведомлений и экран блокировки;
- само переживает перезагрузку — автозапуск;
- **само скачивает и тихо ставит новые сборки** по ссылке, без единого клика на устройстве.

Всё это работает благодаря статусу **Device Owner** — без него тихая установка обновлений невозможна: Android покажет системный диалог подтверждения, а на терминале без присмотра его некому нажать.

### Что понадобится

| Пункт | Зачем |
|---|---|
| Android-устройство, **сброшенное до заводских настроек** | Device Owner нельзя назначить, если на устройстве уже есть Google-аккаунт или другой пользователь |
| Компьютер с установленным `adb` (Android Platform Tools) | Для команды назначения Device Owner — без этого шага **никак** |
| USB-кабель | Первое подключение к компьютеру |
| Файл сборки `app-release.apk` **или** ссылка на него | Первичная установка приложения |
| Wi-Fi на устройстве | Чтобы приложение могло само скачивать будущие обновления |

> ⚠️ Порядок важен: сначала ставим APK и назначаем Device Owner — только потом можно спокойно логиниться в Google-аккаунты (если вообще нужно) и раздавать устройство. После назначения Device Owner аккаунты уже не мешают.

### Шаг 1 — Установка APK на устройство

Выбери один из двух способов.

**Вариант А — через кабель и `adb` (надёжнее, рекомендуется)**

```bash
adb devices                 # проверить, что устройство видно
adb install -r app-release.apk
```

**Вариант Б — установка по ссылке прямо на устройстве (без компьютера на этом шаге)**

Если прислали ссылку на APK (например OTA-адрес `https://kiosk.qrpay.kz/apk/app/prod`, либо ссылку на конкретную сборку):

1. На устройстве: **Настройки → Приложения → Особый доступ → Установка неизвестных приложений** → разреши для браузера, которым будешь скачивать файл.
2. Открой ссылку в браузере на устройстве, дождись скачивания `.apk`, открой файл из уведомления/загрузок и нажми **Установить**.
3. Компьютер с `adb` всё равно понадобится на следующем шаге — этот способ экономит только перенос файла.

> Это разовое ручное действие только для самой первой установки на чистое устройство. Все **следующие** обновления сборки устройство поставит само — см. [раздел 15](#установка-новой-сборки-по-ссылке-тихое-ota-обновление).

### Шаг 2 — Назначение Device Owner

Устройство подключено к компьютеру по USB, отладка по USB включена (**Настройки → Для разработчиков → Отладка по USB**; если пункта "Для разработчиков" нет — 7 раз тапнуть по "Номер сборки" в "О телефоне").

```bash
adb shell dpm set-device-owner "dd.qrPay/.DeviceAdminReceiver"
```

Проверка:

```bash
adb shell dpm list-owners
```

Ожидаемый вывод:

```
Current Device Owner:
  Package: dd.qrPay
  Component: dd.qrPay/.DeviceAdminReceiver
```

Или короче, через `Makefile` проекта:

```bash
make set-device-admin
make list-device-admin
```

Если команда выдаёт ошибку — таблица разборов в разделе [13. Назначение Device Owner через ADB](#назначение-device-owner-через-adb).

### Шаг 3 — Первый запуск и проверка

Открой приложение (или нажми "Домой" — устройство теперь само откроет киоск) и проверь:

- [ ] Статус-бар (шторка сверху) не выезжает
- [ ] Кнопка "Домой"/"Назад"/недавние приложения не сворачивают приложение
- [ ] После перезагрузки устройства приложение открывается само, без участия человека

На этом настройка конкретного устройства закончена — дальше обновления оно получает само (раздел 15). Если что-то не работает — раздел [18. Частые ошибки](#частые-ошибки-и-их-решения), а полный чеклист перед сдачей устройства — в разделе [20](#чеклист-сдачи-устройства-для-оператора).

---

## 1. Обзор архитектуры

```
Android Device Owner (DPC)
├── DeviceAdminReceiver         — точка входа для DPM API
├── MainActivity                — основная активити + Lock Task + полноэкранный режим + MethodChannel "dpc"
├── BootReceiver                — автозапуск после перезагрузки
├── AppUpdatedReceiver          — восстановление киоска после обновления APK
├── InstallResultReceiver       — результат тихой установки APK (PackageInstaller)
├── DeviceOwnerPermissionHelper — автовыдача runtime-разрешений (Wi-Fi)
├── AdbConfigReceiver           — удалённая настройка через ADB broadcast
├── ProvisioningActivity        — выбор режима provisioning (Android 12+, QR)
└── FinaliseActivity            — финализация policy compliance (Android 12+, QR)
```

**Ключевые Android API:**
- `DevicePolicyManager` — управление политиками устройства
- `startLockTask()` / `stopLockTask()` — блокировка в одном приложении
- `addPersistentPreferredActivity()` — назначение приложения домашним лаунчером
- `setStatusBarDisabled()` / `setKeyguardDisabled()` — скрытие системных элементов
- `PackageInstaller` (сессия, закоммиченная Device Owner-ом) — **тихая** установка APK без системного диалога подтверждения — именно это делает возможной установку новой сборки "по ссылке" без участия человека

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
            │       ├── InstallResultReceiver.kt      (нужен только для тихого OTA-обновления, раздел 15)
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

### 3.6 InstallResultReceiver (нужен для тихого OTA-обновления, раздел 15)

```xml
<!-- Результат PackageInstaller.commit() при тихой установке -->
<receiver
    android:name=".InstallResultReceiver"
    android:exported="false" />
```

### 3.7 AdbConfigReceiver (опционально — для удалённой настройки)

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

### 3.8 ProvisioningActivity и FinaliseActivity (Android 12+, только для QR provisioning)

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

> Это минимальный шаблон под ключевые операции (открыть Wi-Fi, выйти из киоска). Для **тихой установки новой сборки по ссылке** к нему нужно добавить ещё один метод канала `dpc` и функцию `installApkSilently` — она вынесена в отдельный раздел [15. Установка новой сборки по ссылке](#установка-новой-сборки-по-ссылке-тихое-ota-обновление), чтобы не перегружать базовый шаблон.

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

**Пример отправки через ADB (базовые параметры):**
```bash
adb shell am broadcast \
  -a YOUR_APP_ID.ACTION_CONFIG \
  --es server_url "https://api.example.com" \
  --es kiosk_code "TERMINAL_001" \
  --ei section_id 5
```

**Пример с настройкой Wi-Fi (если ресивер расширен полями `wifi_ssid`/`wifi_password`/`wifi_hidden`):**
```bash
adb shell am broadcast \
  -a YOUR_APP_ID.ACTION_CONFIG \
  --es wifi_ssid "MyWifi" \
  --es wifi_password "secret123" \
  --ez wifi_hidden false
```

> Работает только пока устройство остаётся Device Owner — приложение получит конфиг и применит его на лету, без переустановки.

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
3. Приложение **уже установлено** на устройство (`flutter install`, `adb install app.apk`, либо скачано и установлено вручную по ссылке — см. [раздел 0](#0-быстрый-старт-для-оператора))

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

### Возможные ошибки при назначении

| Ошибка | Причина | Решение |
|---|---|---|
| `Not allowed to set the device owner because there are already several users on the device` | Есть другие пользователи | Factory reset |
| `Not allowed to set the device owner because there are already some accounts on the device` | Добавлен Google-аккаунт | Factory reset или удалить аккаунт |
| `java.lang.IllegalArgumentException: Unknown admin` | Неверный `applicationId` или компонент | Проверить `applicationId` в `build.gradle` |
| `java.lang.SecurityException: Admin ... is not installed` | Приложение не установлено | Установить APK перед командой |
| Команда молча зависает / ничего не происходит | Отладка по USB не подтверждена для этого компьютера | На экране устройства подтвердить всплывающий запрос "Разрешить отладку по USB" |

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

## Установка новой сборки по ссылке (тихое OTA-обновление)

Device Owner даёт ещё одну важную возможность: `PackageInstaller`-сессия, закоммиченная приложением-владельцем устройства, ставится **без системного диалога подтверждения**. На этом построено автообновление киоска "по ссылке" — без физического доступа к устройству.

### Как это устроено в проекте

```
Сервер (фиксированный URL на канал)
        │  GET https://kiosk.qrpay.kz/apk/app/{prod|dev}
        ▼
Flutter: OtaUpdateService.downloadAndInstall()   (lib/src/features/kiosk/service/ota_update.dart)
        │  1. скачивает APK через Dio во временную директорию
        │  2. зовёт MethodChannel "dpc" → installApk(path)
        ▼
Kotlin: MainActivity.installApkSilently()        (android/.../MainActivity.kt)
        │  3. создаёт PackageInstaller.Session, пишет APK, session.commit()
        │  4. коммит проходит БЕЗ диалога — потому что приложение Device Owner
        ▼
InstallResultReceiver                            (android/.../InstallResultReceiver.kt)
        │  5. получает статус установки, сохраняет в SharedPreferences
        ▼
AppUpdatedReceiver (MY_PACKAGE_REPLACED)
        │  6. после self-update процесс перезапускается — политики киоска восстанавливаются
        ▼
Flutter снова опрашивает getInstallResult() → показывает результат
```

### 1. Где брать URL сборки

`AppUrls.otaApkUrl` — фиксированный адрес на канал, не версионированный (`lib/src/core/constants/app_url.dart`):

```dart
static String get otaApkUrl => 'https://kiosk.qrpay.kz/apk/app/$_otaChannel';
// prod -> https://kiosk.qrpay.kz/apk/app/prod
// dev  -> https://kiosk.qrpay.kz/apk/app/dev
```

Каждая новая сборка заливается **на этот же URL**, заменяя предыдущий файл — отдельных ссылок на версии нет, приложение всегда скачивает "текущий файл по адресу".

> ⚠️ Обязательно увеличивайте `version` в `pubspec.yaml` перед заливкой новой сборки на сервер — сравнение версий идёт по семверу (см. п. 2), без этого автообновление не запустится.

### 2. Когда запускается проверка обновления

`checkAndUpdateIfNeeded()` (`lib/src/features/home/vm/qr_menu_vm.dart`) вызывается при заходе на главный экран, сравнивает текущую версию приложения (`PackageInfo.fromPlatform()`) с версией, которую отдаёт сервер:

```dart
Future<void> checkAndUpdateIfNeeded(String? serverVersion) async {
  if (serverVersion == null || serverVersion.trim().isEmpty) return;
  if (otaChecking) return;
  if (lastServerVersionTried == serverVersion) return; // анти-спам

  otaChecking = true;
  try {
    final current = (await PackageInfo.fromPlatform()).version;
    if (compareSemver(current, serverVersion) < 0) {
      await sl<OtaUpdateService>().downloadAndInstall();
      lastServerVersionTried = serverVersion;
    }
  } finally {
    otaChecking = false;
  }
}
```

Плюс есть ручная кнопка "Обновить" в киоск-настройках, которая напрямую вызывает `downloadAndInstall()` — полезно, если нужно обновить прямо сейчас, не дожидаясь автопроверки.

### 3. Dart-сторона: скачивание и запуск установки

**Файл:** `lib/src/features/kiosk/service/ota_update.dart`

```dart
const _dpc = MethodChannel('dpc');

class OtaUpdateService {
  final ValueNotifier<OtaStatus> status = ValueNotifier(const OtaStatus.idle());
  bool _busy = false;

  Future<void> downloadAndInstall() async {
    if (_busy) return;
    _busy = true;
    status.value = const OtaStatus.downloading(0);

    final url = AppUrls.otaApkUrl;
    final dir = await getTemporaryDirectory();
    final filePath = p.join(dir.path, 'ota.apk');
    final dio = Dio();

    try {
      await _dpc.invokeMethod('clearInstallResult'); // сбросить "хвост" прошлой попытки

      await dio.download(url, filePath, onReceiveProgress: (received, total) {
        if (total > 0) status.value = OtaStatus.downloading(received / total);
      });

      status.value = const OtaStatus.installing();
      await _dpc.invokeMethod('installApk', {'path': filePath});

      // installApk возвращается сразу после session.commit() —
      // реальная установка асинхронна, поэтому опрашиваем результат.
      await _pollInstallResult();
    } finally {
      status.value = const OtaStatus.idle();
      _busy = false;
    }
  }

  Future<void> _pollInstallResult() async {
    for (var i = 0; i < 30; i++) { // 30 * 2с = 60с таймаут
      await Future.delayed(const Duration(seconds: 2));
      final result = await _dpc.invokeMethod<Map>('getInstallResult');
      if (result != null) {
        final status = result['status'] as int? ?? -1;
        if (status == 0) { // PackageInstaller.STATUS_SUCCESS
          await Future.delayed(const Duration(seconds: 10)); // ждём self-update kill
          return;
        }
        throw PlatformException(code: 'INSTALL_FAILED', message: result['message'] as String?);
      }
    }
    throw PlatformException(code: 'INSTALL_TIMEOUT', message: 'Превышено время ожидания установки');
  }
}
```

### 4. Kotlin-сторона: тихая установка через PackageInstaller

Добавьте в `MainActivity.kt` (см. [Шаг 4](#шаг-4--mainactivity-логика-киоска)) обработку метода `installApk` и вспомогательную функцию:

```kotlin
"installApk" -> {
    val path = call.argument<String>("path")
    if (path.isNullOrBlank()) {
        result.error("NO_PATH", "path is required", null)
        return@setMethodCallHandler
    }
    try {
        installApkSilently(path)
        result.success(true)
    } catch (e: Throwable) {
        result.error("INSTALL_FAILED", e.message, null)
    }
}

"getInstallResult" -> {
    val prefs = getSharedPreferences("ota_prefs", MODE_PRIVATE)
    val ts = prefs.getLong("install_timestamp", 0)
    if (ts > 0 && System.currentTimeMillis() - ts < 120_000) {
        val map = hashMapOf<String, Any?>(
            "status" to prefs.getInt("install_status", -1),
            "message" to (prefs.getString("install_message", "") ?: "")
        )
        prefs.edit().remove("install_timestamp").remove("install_status").remove("install_message").apply()
        result.success(map)
    } else {
        result.success(null)
    }
}

"clearInstallResult" -> {
    getSharedPreferences("ota_prefs", MODE_PRIVATE).edit()
        .remove("install_timestamp").remove("install_status").remove("install_message").apply()
    result.success(true)
}
```

```kotlin
// Тихая установка APK через PackageInstaller session (только для Device Owner)
private fun installApkSilently(apkPath: String) {
    val apkFile = File(apkPath)
    require(apkFile.exists()) { "APK not found: $apkPath" }

    val installer = packageManager.packageInstaller
    val params = PackageInstaller.SessionParams(PackageInstaller.SessionParams.MODE_FULL_INSTALL)
    val sessionId = installer.createSession(params)
    val session = installer.openSession(sessionId)

    apkFile.inputStream().use { input ->
        session.openWrite("ota.apk", 0, apkFile.length()).use { out ->
            input.copyTo(out)
            session.fsync(out)
        }
    }

    val intent = Intent(this, InstallResultReceiver::class.java)
    val pending = PendingIntent.getBroadcast(
        this, sessionId, intent,
        PendingIntent.FLAG_UPDATE_CURRENT or PendingIntent.FLAG_MUTABLE
    )

    // Выходим из lock task перед установкой, чтобы PackageInstaller не был заблокирован.
    // AppUpdatedReceiver вернёт lock task после обновления.
    try { stopLockTask() } catch (_: Throwable) {}

    session.commit(pending.intentSender)
    session.close()
}
```

### 5. InstallResultReceiver — получаем результат установки

**Файл:** `kotlin/YOUR_PACKAGE/InstallResultReceiver.kt`

```kotlin
package YOUR_APP_ID

import android.content.BroadcastReceiver
import android.content.Context
import android.content.Intent
import android.content.pm.PackageInstaller

class InstallResultReceiver : BroadcastReceiver() {
    override fun onReceive(context: Context, intent: Intent) {
        val status = intent.getIntExtra(PackageInstaller.EXTRA_STATUS, PackageInstaller.STATUS_FAILURE)
        val msg = intent.getStringExtra(PackageInstaller.EXTRA_STATUS_MESSAGE) ?: ""

        // Сохраняем результат, чтобы Flutter мог прочитать его через getInstallResult()
        context.getSharedPreferences("ota_prefs", Context.MODE_PRIVATE)
            .edit()
            .putInt("install_status", status)
            .putString("install_message", msg)
            .putLong("install_timestamp", System.currentTimeMillis())
            .apply()

        // Возвращаемся в приложение и при успехе, и при ошибке —
        // устройство не должно оставаться "в системе" без присмотра.
        val launch = Intent(context, MainActivity::class.java).apply {
            addFlags(Intent.FLAG_ACTIVITY_NEW_TASK)
            addFlags(Intent.FLAG_ACTIVITY_CLEAR_TOP)
            addFlags(Intent.FLAG_ACTIVITY_SINGLE_TOP)
        }
        runCatching { context.startActivity(launch) }
    }
}
```

Не забудьте зарегистрировать его в манифесте — см. [3.6](#36-installresultreceiver-нужен-для-тихого-ota-обновления-раздел-15).

> `STATUS_FAILURE_CONFLICT` в логе почти всегда означает **несовпадение подписи** — новая сборка подписана другим ключом, чем установленная. Тихое обновление (как и обычное `adb install -r`) работает только если ключ подписи не меняется между сборками.

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

Полный набор методов, реализованных в проекте `dd.qrPay` на канале `dpc`:

| Метод | Назначение |
|---|---|
| `clearDeviceOwner` | Снять Device Owner и выйти из киоска |
| `openWifi` | Открыть системный экран/панель Wi-Fi поверх lock task |
| `enableKiosk` | Вернуть киоск-режим без переустановки (снять флаг "отключено") |
| `lockDevice` | Заблокировать экран через `dpm.lockNow()` |
| `installApk` | Тихо установить APK по локальному пути — см. [раздел 15](#установка-новой-сборки-по-ссылке-тихое-ota-обновление) |
| `getInstallResult` / `clearInstallResult` | Прочитать/сбросить результат последней тихой установки |
| `getManagedConfig` | Прочитать managed configuration, выставленную через `AdbConfigReceiver` |
| `getDeviceDisplayName` | Имя устройства из `Settings.Global.DEVICE_NAME` |
| `getPackageVersion` | Версия установленного пакета по имени |
| `getDeviceMetrics` | Температура батареи, память, аптайм — для диагностики терминала |

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

После этого устройство снова обычный планшет — Device Owner можно назначить заново с нуля, если аккаунтов на устройстве по-прежнему нет.

---

## Частые ошибки и их решения

### 1. Lock Task не запускается

**Симптом:** `startLockTask()` ничего не делает или выбрасывает исключение.

**Причина:** Приложение не является Device Owner или пакет не добавлен в `setLockTaskPackages`.

**Решение:**
```kotlin
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

Если устройство зашифровано и требует PIN при загрузке — до ввода PIN на экране блокировки приложение не запустится, это ограничение Android, а не баг.

---

### 4. HOME-кнопка выходит из приложения

**Причина:** Не настроен HOME intent-filter в AndroidManifest или не вызван `addPersistentPreferredActivity`.

**Решение:** Убедитесь что в манифесте у `MainActivity` есть:
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

### 6. OTA-обновление скачивается, но не ставится / зависает

**Причины и решения:**
- Версия новой сборки в `pubspec.yaml` не больше версии на устройстве — сравнение по семверу не даст добро на установку, увеличьте `version`.
- В логе `STATUS_FAILURE_CONFLICT` — новая сборка подписана другим ключом, чем текущая установка. Подписывайте все сборки одним и тем же keystore.
- Нет интернета на устройстве в момент скачивания — проверьте Wi-Fi (кнопка `openWifi`/`_openWifi` в UI).

---

## Чеклист перед релизом (для разработчика)

- [ ] `DeviceAdminReceiver` класс создан и указан в манифесте
- [ ] `res/xml/device_admin_receiver.xml` создан
- [ ] `AndroidManifest.xml` содержит HOME intent-filter у MainActivity
- [ ] `BootReceiver` зарегистрирован с `directBootAware="true"`
- [ ] `AppUpdatedReceiver` зарегистрирован с action `MY_PACKAGE_REPLACED`
- [ ] `InstallResultReceiver` зарегистрирован (если используется тихое OTA)
- [ ] `applicationId` в `build.gradle` совпадает с пакетом в ADB-команде
- [ ] APK установлен на устройство **до** назначения Device Owner
- [ ] На устройстве нет Google-аккаунтов перед назначением DO
- [ ] Команда `make set-device-admin` выполнена успешно
- [ ] `make list-device-admin` подтверждает назначение
- [ ] После перезагрузки устройства приложение запускается автоматически
- [ ] HOME-кнопка не выводит из приложения
- [ ] Статус-бар и панель навигации скрыты
- [ ] Кнопки громкости не работают (если нужно)
- [ ] Новая сборка на OTA-URL (`otaApkUrl`) подписана тем же ключом, что предыдущая
- [ ] Версия в `pubspec.yaml` увеличена перед заливкой сборки на OTA-URL

---

## Чеклист сдачи устройства (для оператора)

Проверка на конкретном физическом устройстве после настройки по [разделу 0](#0-быстрый-старт-для-оператора):

- [ ] APK установлен
- [ ] `adb shell dpm list-owners` показывает `dd.qrPay/.DeviceAdminReceiver`
- [ ] Статус-бар и навигация скрыты
- [ ] Кнопка "Домой"/"Назад" не выходит из приложения
- [ ] После перезагрузки приложение открывается само
- [ ] Wi-Fi подключен, есть интернет
- [ ] Проверено ручное обновление (кнопка "Обновить" в киоск-настройках) — не падает с ошибкой

---

## Дополнительные ресурсы

- [Android Device Policy Manager docs](https://developer.android.com/reference/android/app/admin/DevicePolicyManager)
- [Lock Task Mode](https://developer.android.com/work/dpc/dedicated-devices/lock-task-mode)
- [Device Owner Provisioning](https://developer.android.com/work/dpc/dedicated-devices)
- [Android Enterprise](https://developers.google.com/android/work/overview)
