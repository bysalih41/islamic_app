import 'package:flutter_local_notifications/flutter_local_notifications.dart';
import 'package:timezone/data/latest.dart' as tzdata;
import 'package:timezone/timezone.dart' as tz;

class NotificationService {
  static final _plugin = FlutterLocalNotificationsPlugin();

  static Future init() async {
    tzdata.initializeTimeZones();
    const android = AndroidInitializationSettings('@mipmap/ic_launcher');
    const init = InitializationSettings(android: android);
    await _plugin.initialize(init);
  }

  static Future instant(String title, String body) async {
    const details = NotificationDetails(
      android: AndroidNotificationDetails("basic", "Basic"),
    );
    await _plugin.show(0, title, body, details);
  }

  static Future schedule(String title, String body, DateTime date) async {
    await _plugin.zonedSchedule(
      0,
      title,
      body,
      tz.TZDateTime.from(date, tz.local),
      const NotificationDetails(android: AndroidNotificationDetails("sched", "Scheduled")),
      androidAllowWhileIdle: true,
      uiLocalNotificationDateInterpretation:
          UILocalNotificationDateInterpretation.absoluteTime,
    );
  }
}
