import 'package:awesome_notifications/awesome_notifications.dart';
import 'package:flutter/material.dart';
import 'package:prescription_ocr/common/screen_utils.dart';
import 'package:prescription_ocr/common/theme_colors.dart';
import 'package:prescription_ocr/config/app_router.dart';
import 'package:prescription_ocr/journeys/auth/login.dart';
import 'package:prescription_ocr/journeys/home/home_page.dart';

Future<void> main() async {
  ScreenUtil.init();
  AwesomeNotifications().initialize(
    'resource://drawable/res_notification_app_icon',
    [
      NotificationChannel(
        channelKey: 'basic_channel',
        channelName: 'Basic Notifications',
        defaultColor: Colors.teal,
        importance: NotificationImportance.High,
        channelDescription: 'Basic Notifications Channel',
        channelShowBadge: true,
      ),
      NotificationChannel(
          channelKey: 'scheduled_channel',
          channelName: 'Scheduled Notifications',
          defaultColor: ThemeColors.primaryGreen,
          locked: true,
          importance: NotificationImportance.High,
          channelDescription: 'Channel for Scheduled Notifications.'),
    ],
  );
  WidgetsFlutterBinding
      .ensureInitialized(); //Ensure plugin services are initialized
  //Get list of available cameras
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        appBarTheme: AppBarTheme(color: Colors.white),
        primarySwatch: Colors.blue,
      ),
      onGenerateRoute: AppRouter.onGenerateRoute,
      initialRoute: LoginScreen.routeName,
    );
  }
}
