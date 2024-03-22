import 'package:flutter_local_notifications/flutter_local_notifications.dart';

class LocalNotifications {
  static Future<void> requestPermissionLocalNotification() async {
    FlutterLocalNotificationsPlugin flutterLocalNotificationsPlugin =
        FlutterLocalNotificationsPlugin();
    await flutterLocalNotificationsPlugin
        .resolvePlatformSpecificImplementation<
            AndroidFlutterLocalNotificationsPlugin>()
        ?.requestNotificationsPermission();
  }

  static Future<void> initializeLocalNotifications() async {
    final flutterLocalNotificationsPlugin = FlutterLocalNotificationsPlugin();
    const initializationSettingsAndroid =
        AndroidInitializationSettings('app_icon');
    const initializationSettings = InitializationSettings(
      android: initializationSettingsAndroid,
      // TODO: iOS config
    );

    await flutterLocalNotificationsPlugin.initialize(
      initializationSettings,
      //onDidReceiveBackgroundNotificationResponse: onDidReceiveBackgroundNotificationResponse
    );
  }

  static void showLocalNotification({
    required int id,
    String? title,
    String? body,
    String? data,
  }) {
    const androidDetails = AndroidNotificationDetails(
      'channelId',
      'channelName',
      playSound: true,
      sound: RawResourceAndroidNotificationSound(
          'android_app_res_raw_notification'),
      importance: Importance.defaultImportance,
      priority: Priority.high,
    );

    const notificationDetails = NotificationDetails(
      android: androidDetails,
    );

    final flutterNotificationsPlugin = FlutterLocalNotificationsPlugin();
    flutterNotificationsPlugin.show(id, title, body, notificationDetails,
        payload: data);
  }
}
