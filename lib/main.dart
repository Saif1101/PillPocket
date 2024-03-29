import 'package:awesome_notifications/awesome_notifications.dart';
import 'package:camera/camera.dart';

import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:get_storage/get_storage.dart';

import 'package:prescription_ocr/blocs/authentication/auth_bloc.dart';
import 'package:prescription_ocr/blocs/observer/bloc_observer.dart';
import 'package:prescription_ocr/common/utils/screen_utils.dart';
import 'package:prescription_ocr/common/theme_colors.dart';
import 'package:prescription_ocr/config/app_router.dart';
import 'package:prescription_ocr/journeys/auth/login_page.dart';
import 'package:prescription_ocr/repositories/authentication/auth_repository.dart';
import 'package:prescription_ocr/repositories/user/user_repository.dart';


  late List<CameraDescription> cameras;
  
Future<void> main() async {
  ScreenUtil.init();
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  await GetStorage.init();
  cameras = await availableCameras();

  await AwesomeNotifications().initialize(
    null,
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

  await SystemChrome.setPreferredOrientations([DeviceOrientation.portraitUp]);

  BlocOverrides.runZoned(
    () {
      runApp(const MyApp());
    },
    blocObserver: MyGlobalObserver(),
  );
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MultiRepositoryProvider(
      providers: [
        RepositoryProvider(
          create: (context) => AuthRepository(),
        ),
        RepositoryProvider(
          create: (context) => UserRepository(),
        ),
      ],
      child: BlocProvider(
        create: (context) => AuthBloc(
          authRepository: RepositoryProvider.of<AuthRepository>(context),
          userRepository: RepositoryProvider.of<UserRepository>(context),
        )..add(GoogleSignInRequested()),
        child: MaterialApp(
          title: 'PillPocket',
          debugShowCheckedModeBanner: false,
          theme: ThemeData(
            appBarTheme: AppBarTheme(color: Colors.white),
            colorScheme: ColorScheme.fromSwatch().copyWith(
              primary: ThemeColors.primaryGreen,
              secondary: ThemeColors.primaryGrey,
            ),
          ),
          onGenerateRoute: AppRouter.onGenerateRoute,
          initialRoute:
              LoginScreen.routeName, //Switched to home to bypass login
        ),
      ),
    );
  }
}
