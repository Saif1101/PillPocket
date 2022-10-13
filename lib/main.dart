import 'package:awesome_notifications/awesome_notifications.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:google_sign_in/google_sign_in.dart';
import 'package:prescription_ocr/blocs/auhtentication/login_bloc.dart';
import 'package:prescription_ocr/common/screen_utils.dart';
import 'package:prescription_ocr/common/theme_colors.dart';
import 'package:prescription_ocr/config/app_router.dart';
import 'package:prescription_ocr/journeys/auth/login.dart';
import 'package:prescription_ocr/journeys/home/home_page.dart';
import 'package:prescription_ocr/repositories/authentication/auth_repository.dart';

Future<void> main() async {
  ScreenUtil.init();
  WidgetsFlutterBinding
      .ensureInitialized();
  await Firebase.initializeApp();

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
   //Ensure plugin services are initialized
  //Get list of available cameras
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return RepositoryProvider(
      create: (context) => AuthRepository(
          firebaseAuth: FirebaseAuth.instance, googleSignIn: GoogleSignIn()),
      child: BlocProvider(
        create: (context) => LoginBloc(
          authRepository: RepositoryProvider.of<AuthRepository>(context),
        ),
        child: MaterialApp(
          title: 'Flutter Demo',
          debugShowCheckedModeBanner: false,
          theme: ThemeData(
            appBarTheme: AppBarTheme(color: Colors.white),
            primarySwatch: Colors.blue,
          ),
          onGenerateRoute: AppRouter.onGenerateRoute,
          initialRoute: HomePage.routeName,//Switched to home to bypass login
        ),
      ),
    );
  }
}
