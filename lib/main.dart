import 'package:BodyPower/internal/prefs_settings.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_local_notifications/flutter_local_notifications.dart';
import 'package:workmanager/workmanager.dart';
import 'internal/helpers/firebase_options.dart';
import 'internal/application.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(options: DefaultFirebaseOptions.currentPlatform);
  Workmanager().initialize(callbackDispatcher, isInDebugMode: kDebugMode);
  Workmanager().registerPeriodicTask(
    "2",
    "simplePeriodicTask",
    frequency: const Duration(minutes: 15),
  );
  await SystemChrome.setPreferredOrientations([DeviceOrientation.portraitUp]);
  runApp(const MyApp());
}

var flip = FlutterLocalNotificationsPlugin();
@pragma('vm:entry-point')
void callbackDispatcher() {
  Workmanager().executeTask((task, inputData) async {
    var android = const AndroidInitializationSettings('@mipmap/launcher_icon');
    var settings = InitializationSettings(android: android);

    DateTime? fitnessTime;
    final time = await AppStorage.getData('fitnessTime');
    if (time != null) {
      fitnessTime = DateTime.parse(time);
    }

    flip.initialize(settings);
    if (fitnessTime != null) {
      if (DateTime.now().weekday != DateTime.sunday) {
        final isBefore5minutes = fitnessTime
            .add(const Duration(minutes: -5))
            .isBefore(DateTime.now());
        final isAtSameMomentAs5minutes = fitnessTime
            .add(const Duration(minutes: -5))
            .isAtSameMomentAs(DateTime.now());
        final isBefore1hours =
            fitnessTime.add(const Duration(hours: -1)).isBefore(DateTime.now());
        final isAtSameMomentAs1hours = fitnessTime
            .add(const Duration(hours: -1))
            .isAtSameMomentAs(DateTime.now());
        if (isBefore1hours || isAtSameMomentAs1hours) {
          if (isBefore5minutes || isAtSameMomentAs5minutes) {
            showNotificationWithDefaultSound(
                body: 'Через 30 мин начнем тренировку');
          } else {
            showNotificationWithDefaultSound(
                body: 'Через час начнем тренировку');
          }
        }
      }
    }

    return Future.value(true);
  });
}

Future<void> showNotificationWithDefaultSound(
    {String? title, String? body, String? time}) async {
  var androidPlatformChannelSpecifics = const AndroidNotificationDetails(
    'com.example.fitness',
    'BodyPower',
    icon: '@mipmap/launcher_icon',
    importance: Importance.max,
    priority: Priority.high,
    enableLights: true,
    enableVibration: true,
    playSound: true,
  );

  var platformChannelSpecifics =
      NotificationDetails(android: androidPlatformChannelSpecifics);
  await flip.show(0, title ?? 'BodyPower',
      body ?? 'Напоминание о тренировках : $time', platformChannelSpecifics,
      payload: 'Default_Sound');
}
