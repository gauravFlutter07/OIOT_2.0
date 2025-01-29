import 'dart:developer';
import 'package:firebase_messaging/firebase_messaging.dart';
import 'package:flutter_local_notifications/flutter_local_notifications.dart';
import 'package:oiot/main.dart';
import '../imports.dart';

Future<void> handleBackgroundMessage(RemoteMessage message) async {
  log('Title : ${message.notification?.title}');
  log('Body : ${message.notification?.body}');
  log('Playload : ${message.data}');
}

class FirebaseApi {
  final FirebaseMessaging _firebaseMessaging = FirebaseMessaging.instance;

  final _androidChannel = const AndroidNotificationChannel(
    'high_importance_channel',
    'High Importance Notifications',
    description: 'This is used for important notifications',
    importance: Importance.high,
  );

  final _localNotifications = FlutterLocalNotificationsPlugin();

  // Function to initialize notifications
  Future<void> initNotification() async {
    // Request permission from the user
    await _firebaseMessaging.requestPermission();

    // Fetch the FCM token for this device
    final fcmToken = await _firebaseMessaging.getToken();
    log('FCM Token: $fcmToken');

    // Initialize further settings for push notifications
    initPushNotifications();
    initLocalNotifications();
  }

  // Function to handle received messages
  void handleMessage(RemoteMessage? message) {
    if (message == null) return;
    // Navigate to new screen when message is received and user taps on the notification
    navigatorKey.currentState
        ?.pushNamed(NotificationScreen.route, arguments: message);
  }

  Future initLocalNotifications() async {
    const android = AndroidInitializationSettings('@drawable/launcher_icon');
    const iOS =
        DarwinInitializationSettings(); // Updated from IOSInitializationSettings
    const settings = InitializationSettings(
      android: android,
      iOS: iOS,
    );

    await _localNotifications.initialize(
      settings,
      onDidReceiveNotificationResponse: (NotificationResponse response) {
        final message = RemoteMessage.fromMap(
          jsonDecode(response.payload!),
        );
        handleMessage(message);
      },
    );
    final platform = _localNotifications.resolvePlatformSpecificImplementation<
        AndroidFlutterLocalNotificationsPlugin>();
    await platform?.createNotificationChannel(_androidChannel);
  }

  // Function to initialize foreground and background settings
  void initPushNotifications() async {
    await FirebaseMessaging.instance
        .setForegroundNotificationPresentationOptions(
      alert: true,
      badge: true,
      sound: true,
    );

    // Handle notification if the app was terminated and now opened
    FirebaseMessaging.instance.getInitialMessage().then(handleMessage);

    // Attach event listeners for when a notification opens the app from the background
    FirebaseMessaging.onMessageOpenedApp.listen(handleMessage);

    FirebaseMessaging.onBackgroundMessage(handleBackgroundMessage);

    // Handle messages when the app is in the foreground
    FirebaseMessaging.onMessage.listen(
      (RemoteMessage message) {
        final notification = message.notification;
        if (notification == null) return;

        _localNotifications.show(
          notification.hashCode,
          notification.title,
          notification.body,
          NotificationDetails(
            android: AndroidNotificationDetails(
              _androidChannel.id,
              _androidChannel.name,
              channelDescription: _androidChannel.description,
              icon: "@drawable/launcher_icon",
            ),
          ),
          payload: jsonEncode(message.toMap()),
        );
        log('Got a message whilst in the foreground!');
        handleMessage(message);
      },
    );
  }
}
