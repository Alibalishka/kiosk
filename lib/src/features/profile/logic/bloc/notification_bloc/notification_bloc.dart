// import 'dart:developer';
// import 'dart:io';

// import 'package:auto_route/auto_route.dart';
// import 'package:bloc/bloc.dart';
// import 'package:device_info_plus/device_info_plus.dart';
// import 'package:firebase_messaging/firebase_messaging.dart';
// import 'package:flutter/foundation.dart';
// import 'package:flutter/material.dart';
// import 'package:flutter_local_notifications/flutter_local_notifications.dart';
// import 'package:freezed_annotation/freezed_annotation.dart';
// import 'package:qr_pay_app/src/core/dependencies/injection_container.dart';
// import 'package:qr_pay_app/src/core/logic/token_storage.dart';
// import 'package:qr_pay_app/src/features/app/router/app_router.dart';
// import 'package:qr_pay_app/src/features/profile/logic/model/requests/send_fcm_request.dart';
// import 'package:qr_pay_app/src/features/profile/logic/model/responses/notification_response.dart';
// import 'package:qr_pay_app/src/features/profile/logic/model/responses/unread_response.dart';
// import 'package:qr_pay_app/src/features/profile/logic/repository/auth_repository.dart';

// part 'notification_event.dart';
// part 'notification_state.dart';
// part 'notification_bloc.freezed.dart';

// class NotificationBloc extends Bloc<NotificationEvent, NotificationState> {
//   final AuthRepository _authRepository;
//   NotificationBloc({
//     required final AuthRepository authRepository,
//   })  : _authRepository = authRepository,
//         super(const _Initial()) {
//     on<NotificationEvent>(
//       (event, emit) => event.map(
//         sendFcmToken: (event) => _sendFcmToken(event, emit),
//         deleteFcmToken: (event) => _deleteFcmToken(event, emit),
//         fetchNotification: (event) => _fetchNotification(event, emit),
//         fetchUnread: (event) => _fetchUnread(event, emit),
//         readNotification: (event) => _readNotification(event, emit),
//       ),
//     );
//   }

//   Future<void> _readNotification(
//     _ReadNotification event,
//     Emitter<NotificationState> emit,
//   ) async =>
//       await _authRepository.readNotification();

//   Future<void> _fetchUnread(
//     _FetchUnread event,
//     Emitter<NotificationState> emit,
//   ) async {
//     try {
//       final result = await _authRepository.fetchUnread();
//       result.when(
//         success: (response) =>
//             emit(NotificationState.successUread(response: response)),
//         failure: (error) => emit(NotificationState.failed(
//             message: error.msg ?? 'Ошибка загрузки данных')),
//       );
//     } on Object {
//       emit(const NotificationState.failed());
//     }
//   }

//   Future<void> _fetchNotification(
//     _FetchNotification event,
//     Emitter<NotificationState> emit,
//   ) async {
//     try {
//       final result = await _authRepository.fetchNotification();
//       result.when(
//         success: (response) =>
//             emit(NotificationState.successFetch(response: response)),
//         failure: (error) => emit(NotificationState.failed(
//             message: error.msg ?? 'Ошибка загурзки данных')),
//       );
//     } on Object {
//       emit(const NotificationState.failed());
//     }
//   }

//   Future<void> _deleteFcmToken(
//     _DeleteFcmToken event,
//     Emitter<NotificationState> emit,
//   ) async {
//     try {
//       final result = await _authRepository.deleteFcmToken(
//           platform: Platform.isIOS ? 'ios' : 'android');
//       result.when(
//         success: (_) => emit(const NotificationState.success()),
//         failure: (error) => emit(NotificationState.failed(
//             message: error.msg ?? 'Ошибка загурзки данных')),
//       );
//     } on Object {
//       emit(const NotificationState.failed());
//     }
//   }

//   Future<void> _sendFcmToken(
//     _SendFcmToken event,
//     Emitter<NotificationState> emit,
//   ) async {
//     try {
//       final result = await _authRepository.sendFcmToken(body: event.body);
//       result.when(
//         success: (_) => emit(const NotificationState.success()),
//         failure: (error) => emit(NotificationState.failed(
//             message: error.msg ?? 'Ошибка загурзки данных')),
//       );
//     } on Object {
//       emit(const NotificationState.failed());
//     }
//   }
// }

// @pragma('vm:entry-point')
// Future<void> firebaseMessagingBackgroundHandler(RemoteMessage message) async {
//   await NotificationService.instance.setupNotification();
//   await NotificationService.instance.showNotification(message);
// }

// class NotificationService {
//   NotificationService._();
//   static final NotificationService instance = NotificationService._();

//   final message = FirebaseMessaging.instance;
//   final localNotifications = FlutterLocalNotificationsPlugin();
//   bool isLocalNotificationInitialized = false;
//   late BuildContext context;

//   Future<void> initilize(BuildContext context) async {
//     FirebaseMessaging.onBackgroundMessage(firebaseMessagingBackgroundHandler);
//     await requestPermission();
//     await setupMessageHandlers();
//     // await initializeFcmToken();
//     sl<ITokenStorage>().getToken()?.isEmpty ?? true
//         ? null
//         : await initializeFcmToken();
//     this.context = context;
//   }

//   // Future<void> initializeFcmToken() async {
//   //   debugPrint("FCM Token");
//   //   // Get FCM Token
//   //   final token = await message.getToken();
//   //   debugPrint("FCM Token: $token");

//   //   sl<NotificationBloc>().add(
//   //     NotificationEvent.sendFcmToken(
//   //         body: SendFcmRequest(
//   //             token: token!, platform: Platform.isIOS ? 'ios' : 'android')),
//   //   );
//   // }

//   Future<void> initializeFcmToken() async {
//     try {
//       debugPrint("Initializing FCM Token...");

//       if (Platform.isIOS) {
//         // Ждём APNs токен
//         String? apnsToken;
//         int retries = 0;
//         while (apnsToken == null && retries < 5) {
//           apnsToken = await message.getAPNSToken();
//           if (apnsToken == null) {
//             debugPrint("⏳ Waiting for APNs token...");
//             await Future.delayed(const Duration(seconds: 1));
//             retries++;
//           }
//         }

//         if (apnsToken == null) {
//           debugPrint("❌ APNs токен не получен. Отмена FCM инициализации.");
//           return;
//         }

//         debugPrint("✅ APNs Token: $apnsToken");
//       }

//       // Теперь можно безопасно запрашивать FCM токен
//       final token = await message.getToken();
//       if (token == null) {
//         debugPrint("❌ FCM токен не получен.");
//         return;
//       }

//       debugPrint("✅ FCM Token: $token");

//       // Отправляем токен в Bloc / на сервер
//       sl<NotificationBloc>().add(
//         NotificationEvent.sendFcmToken(
//           body: SendFcmRequest(
//             token: token,
//             platform: Platform.isIOS ? 'ios' : 'android',
//             deviceName: await getDeviceName(),
//           ),
//         ),
//       );
//     } catch (e, stack) {
//       debugPrint("🔥 Ошибка при получении FCM токена: $e");
//       debugPrint("📍 Stack trace: $stack");
//     }
//   }

//   Future<void> requestPermission() async {
//     final settings = await message.requestPermission(
//       alert: true,
//       badge: true,
//       sound: true,
//       provisional: false,
//       announcement: false,
//       carPlay: false,
//       criticalAlert: true,
//     );

//     message.setForegroundNotificationPresentationOptions(
//       alert: true,
//       sound: true,
//     );

//     debugPrint("Permission status: ${settings.authorizationStatus}");
//   }

//   Future<void> setupNotification() async {
//     if (isLocalNotificationInitialized) {
//       return;
//     }

//     // Android Setup
//     const AndroidNotificationChannel channel = AndroidNotificationChannel(
//       'high_importance_channel', // id
//       'High Importance Notifications', // title
//       description:
//           'This channel is used for important notifications.', // description
//       importance: Importance.high,
//     );

//     await localNotifications
//         .resolvePlatformSpecificImplementation<
//             AndroidFlutterLocalNotificationsPlugin>()
//         ?.createNotificationChannel(channel);

//     const initializationSettingsAndroid =
//         AndroidInitializationSettings('@mipmap/ic_launcher');

//     // iOS Setup
//     const initializationSettingsDarwin = DarwinInitializationSettings();

//     const initializationSettings = InitializationSettings(
//       android: initializationSettingsAndroid,
//       iOS: initializationSettingsDarwin,
//     );

//     // Notification Setup
//     await localNotifications.initialize(initializationSettings);

//     isLocalNotificationInitialized = true;
//   }

//   Future<void> showNotification(RemoteMessage message) async {
//     RemoteNotification? notification = message.notification;
//     AndroidNotification? android = message.notification?.android;
//     if (notification != null && android != null) {
//       await localNotifications.show(
//         notification.hashCode,
//         notification.title,
//         notification.body,
//         const NotificationDetails(
//           android: AndroidNotificationDetails(
//             'high_importance_channel',
//             'High Importance Notifications',
//             channelDescription:
//                 'This channel is used for important notifications.',
//             importance: Importance.high,
//             priority: Priority.high,
//             playSound: true,
//             icon: '@mipmap/ic_launcher',
//           ),
//           iOS: DarwinNotificationDetails(
//             presentAlert: true,
//             presentBadge: true,
//             presentSound: true,
//           ),
//         ),
//         payload: message.data.toString(),
//       );
//     }
//   }

//   void handleBackgroundMessage(RemoteMessage message) {
//     log('onMessageOpenedApp: ${message.data}');
//     if (message.data['type'] == 'chat') {
//       // Navigate to chat screen
//     } else {
//       log('Unhandled message type: ${message.data['type']}');
//     }
//   }

//   Future<void> setupMessageHandlers() async {
//     // Foreground message
//     FirebaseMessaging.onMessage.listen((RemoteMessage message) async {
//       log('onMessage: $message');
//       if (message.notification != null) {
//         showNotification(message);
//       }
//     });

//     FirebaseMessaging.onMessageOpenedApp.listen((event) async {
//       context.router.push(const MyNotificationsPageRoute());
//     });

//     // Background message
//     FirebaseMessaging.onMessageOpenedApp.listen(handleBackgroundMessage);

//     // Opened app
//     final initialMessage = await message.getInitialMessage();
//     if (initialMessage != null) {
//       handleBackgroundMessage(initialMessage);
//     }
//   }
// }

// Future<String> getDeviceName() async {
//   final deviceInfo = DeviceInfoPlugin();

//   if (Platform.isAndroid) {
//     final androidInfo = await deviceInfo.androidInfo;
//     return "${androidInfo.manufacturer} ${androidInfo.model}";
//   } else if (Platform.isIOS) {
//     final iosInfo = await deviceInfo.iosInfo;
//     return iosInfo.utsname.machine;
//   } else {
//     return "Unsupported platform";
//   }
// }
