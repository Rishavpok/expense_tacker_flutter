import 'package:firebase_core/firebase_core.dart';
import 'package:firebase_messaging/firebase_messaging.dart';
import 'package:flutter_local_notifications/flutter_local_notifications.dart';

class NotificationService {
  static final FirebaseMessaging _messaging = FirebaseMessaging.instance;
  static final FlutterLocalNotificationsPlugin _localNotifications =
      FlutterLocalNotificationsPlugin();

  static Future<void> initializeFirebase() async {
    await Firebase.initializeApp();
    FirebaseMessaging.onBackgroundMessage(_backgroundHandler);
    _requestPermission();
    _getToken();
    _listenToMessages();
  }

  static Future<void> initializeLocalNotifications() async {
    const androidSettings = AndroidInitializationSettings('@mipmap/ic_launcher');
    final initSettings = InitializationSettings(
      android: androidSettings,
      iOS: DarwinInitializationSettings(),
    );
    await _localNotifications.initialize(initSettings);
  }

  static Future<void> _backgroundHandler(RemoteMessage message) async {
    await Firebase.initializeApp();
    print('🔵 Background message: ${message.messageId}');
  }

  static void _requestPermission() {
    _messaging.requestPermission();
  }

  static void _getToken() async {
    final token = await _messaging.getToken();
    print('🔥 FCM Token: $token');
  }

  static void _listenToMessages() {
    FirebaseMessaging.onMessage.listen((message) {
      print('💬 Foreground message: ${message.notification?.title} - ${message.notification?.body}');
      _showLocalNotification(message.notification?.title, message.notification?.body);
    });

    FirebaseMessaging.onMessageOpenedApp.listen((message) {
      print('📲 App opened from notification: ${message.messageId}');
    });
  }

  static Future<void> _showLocalNotification(String? title, String? body) async {
    const androidDetails = AndroidNotificationDetails(
      'channel_id',
      'channel_name',
      channelDescription: 'channel description',
      importance: Importance.max,
      priority: Priority.high,
    );

    const notificationDetails = NotificationDetails(android: androidDetails);

    await _localNotifications.show(0, title, body, notificationDetails);
  }
}
