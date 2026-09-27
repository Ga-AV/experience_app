import 'dart:developer';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_messaging/firebase_messaging.dart';
import 'package:flutter_local_notifications/flutter_local_notifications.dart';

class FirebaseMessagingService {
  FirebaseMessagingService._();

  static final FirebaseMessaging _messaging = FirebaseMessaging.instance;

  static final FlutterLocalNotificationsPlugin _localNotifications =
      FlutterLocalNotificationsPlugin();

  static const AndroidNotificationChannel _channel = AndroidNotificationChannel(
    'high_importance_channel',
    'High Importance Notifications',
    description: 'Channel for important notifications.',
    importance: Importance.max,
  );

  static Future<void> initialize() async {
    await _initializeLocalNotifications();

    await _requestPermission();

    await _subscribeToTopic();

    await _configureForegroundMessages();

    await _configureNotificationTap();

    _listenToAuthenticationChanges();

    _listenToTokenRefresh();
  }

  static Future<void> _initializeLocalNotifications() async {
    const AndroidInitializationSettings androidSettings =
        AndroidInitializationSettings('@mipmap/ic_launcher');

    const InitializationSettings settings = InitializationSettings(
      android: androidSettings,
    );

    await _localNotifications.initialize(
      settings: settings,
      onDidReceiveNotificationResponse: (NotificationResponse response) {
        log('Local notification tapped');
        log('Payload: ${response.payload}');
      },
    );

    await _localNotifications
        .resolvePlatformSpecificImplementation<
          AndroidFlutterLocalNotificationsPlugin
        >()
        ?.createNotificationChannel(_channel);
  }

  static Future<void> _requestPermission() async {
    final NotificationSettings settings = await _messaging.requestPermission(
      alert: true,
      badge: true,
      sound: true,
      provisional: false,
    );

    log(
      'Notification permission: '
      '${settings.authorizationStatus}',
    );
  }

  static void _listenToAuthenticationChanges() {
    FirebaseAuth.instance.authStateChanges().listen((User? user) async {
      if (user == null) {
        log('No authenticated user.');
        return;
      }

      log('Authenticated user detected: ${user.uid}');

      await _saveCurrentTokenForUser();
    });
  }

  static Future<void> _saveCurrentTokenForUser() async {
    try {
      final String? token = await _messaging.getToken();

      log('====================================');
      log('FCM TOKEN');
      log('$token');
      log('====================================');

      if (token == null) {
        log('FCM token is null.');
        return;
      }

      await _saveTokenToFirestore(token);
    } catch (error, stackTrace) {
      log('Error obtaining FCM token', error: error, stackTrace: stackTrace);
    }
  }

  static Future<void> _saveTokenToFirestore(String token) async {
    final User? user = FirebaseAuth.instance.currentUser;

    if (user == null) {
      log('Cannot save FCM token: no authenticated user.');
      return;
    }

    final document = FirebaseFirestore.instance
        .collection('users')
        .doc(user.uid);

    await document.set({
      'token': token,
      'uid': user.uid,
    }, SetOptions(merge: true));

    final snapshot = await document.get();

    log('====================================');
    log('FIRESTORE USER DOCUMENT');
    log('Exists: ${snapshot.exists}');
    log('Path: ${snapshot.reference.path}');
    log('Data: ${snapshot.data()}');
    log('====================================');
  }

  static void _listenToTokenRefresh() {
    _messaging.onTokenRefresh.listen((String token) async {
      log('====================================');
      log('FCM TOKEN REFRESHED');
      log(token);
      log('====================================');

      await _saveTokenToFirestore(token);
    });
  }

  static Future<void> _configureForegroundMessages() async {
    FirebaseMessaging.onMessage.listen((RemoteMessage message) async {
      log('====================================');
      log('FCM MESSAGE - FOREGROUND');
      log('====================================');

      _logMessage(message);

      await _showLocalNotification(message);
    });
  }

  static void _handleNotification(RemoteMessage message) {
    log('====================================');
    log('FCM NOTIFICATION DATA');
    log('====================================');

    _logMessage(message);

    final String? feature = message.data['feature'];
    final String? saleId = message.data['sale_id'];
    final String? total = message.data['total'];

    if (feature != null) {
      log('Feature: $feature');
    }

    if (saleId != null) {
      log('Sale ID: $saleId');
    }

    if (total != null) {
      log('Total: $total');
    }

    log('====================================');
  }

  static void _logMessage(RemoteMessage message) {
    log('Message ID: ${message.messageId}');
    log('Title: ${message.notification?.title}');
    log('Body: ${message.notification?.body}');
    log('Data: ${message.data}');
  }

  static Future<void> _showLocalNotification(RemoteMessage message) async {
    final String title = message.notification?.title ?? 'Nueva notificación';

    final String body = message.notification?.body ?? '';

    final AndroidNotificationDetails androidDetails =
        AndroidNotificationDetails(
          _channel.id,
          _channel.name,
          channelDescription: _channel.description,
          importance: Importance.max,
          priority: Priority.high,
          icon: '@mipmap/ic_launcher',
        );

    final NotificationDetails notificationDetails = NotificationDetails(
      android: androidDetails,
    );

    await _localNotifications.show(
      id: message.hashCode,
      title: title,
      body: body,
      notificationDetails: notificationDetails,
      payload: message.data.toString(),
    );
  }

  static Future<void> _configureNotificationTap() async {
    FirebaseMessaging.onMessageOpenedApp.listen((RemoteMessage message) {
      log('====================================');
      log('NOTIFICATION OPENED - BACKGROUND');
      log('====================================');

      _handleNotification(message);
    });

    final RemoteMessage? initialMessage = await _messaging.getInitialMessage();

    if (initialMessage != null) {
      log('====================================');
      log('NOTIFICATION OPENED - TERMINATED');
      log('====================================');

      _handleNotification(initialMessage);
    }
  }

  static Future<void> _subscribeToTopic() async {
    try {
      await _messaging.subscribeToTopic('noticias');

      log('Subscribed to topic: noticias');
    } catch (error, stackTrace) {
      log('Error subscribing to topic', error: error, stackTrace: stackTrace);
    }
  }
}
