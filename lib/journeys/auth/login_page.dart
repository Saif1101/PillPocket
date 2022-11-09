import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:prescription_ocr/blocs/authentication/auth_bloc.dart';
import 'package:prescription_ocr/common/utils/screen_utils.dart';
import 'package:prescription_ocr/common/theme_colors.dart';
import 'package:prescription_ocr/journeys/auth/registration_page.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({Key? key}) : super(key: key);

  static const String routeName = '/login';

  static Route route() {
    return MaterialPageRoute(
        settings: RouteSettings(name: routeName),
        builder: (_) => LoginScreen());
  }

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        backgroundColor: Colors.white,
        body: Container(
          child: BlocConsumer<AuthBloc, AuthState>(
            listener: (context, state) {
              if (state is Registered) {
                Navigator.pushNamedAndRemoveUntil(
                    context, '/home', (Route<dynamic> route) => false);
              }
            },
            builder: (context, state) {
              if (state is Initial) {
                BlocProvider.of<AuthBloc>(context).add(GoogleSignInRequested());
                return const Align(
                  alignment: Alignment.center,
                  child: CircularProgressIndicator(
                    color: ThemeColors.primaryGreen,
                  ),
                );
              } else if (state is Loading || state is Registered) {
                return const Align(
                  alignment: Alignment.center,
                  child: CircularProgressIndicator(
                    color: ThemeColors.primaryGreen,
                  ),
                );
              } else if (state is UnAuthenticated) {
                return SingleChildScrollView(
                  child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        SizedBox(
                          height: ScreenUtil.screenHeight / 4,
                        ),
                        SizedBox(
                          height: ScreenUtil.screenHeight / 6,
                          child: Padding(
                            padding: const EdgeInsets.all(16.0),
                            child: Row(
                              // mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              crossAxisAlignment: CrossAxisAlignment.center,
                              mainAxisAlignment: MainAxisAlignment.spaceAround,
                              children: [
                                Expanded(
                                  flex: 3,
                                  child: FittedBox(
                                    child: Text(
                                      'PillPocket',
                                      style: GoogleFonts.inter(
                                        color: ThemeColors.primaryGreen,
                                        fontWeight: FontWeight.bold,
                                      ),
                                    ),
                                  ),
                                ),
                                SizedBox(
                                  width: 10,
                                ),
                                Flexible(
                                  child: Container(
                                    color: ThemeColors.primaryGreen,
                                    child: SvgPicture.asset(
                                      'assets/Logo_prescription_pill_pocket_rotated.svg',
                                      fit: BoxFit.contain,
                                    ),
                                  ),
                                ),
                              ],
                            ),
                          ),
                        ),
                        Padding(
                          padding: EdgeInsets.symmetric(
                              vertical: 32.0,
                              horizontal: ScreenUtil.screenWidth / 4),
                          child: SizedBox(
                            height: ScreenUtil.screenHeight / 50,
                            child: Container(
                              decoration: BoxDecoration(
                                  color: ThemeColors.primaryGreen,
                                  borderRadius:
                                      BorderRadius.all(Radius.circular(20))),
                            ),
                          ),
                        ),
                        SizedBox(
                          height: ScreenUtil.screenHeight / 8,
                        ),
                        GestureDetector(
                            onTap: () {
                              BlocProvider.of<AuthBloc>(context)
                                  .add(GoogleSignInRequested());
                            },
                            child: SizedBox(
                              height: ScreenUtil.screenHeight / 16,
                              width: ScreenUtil.screenWidth / 3,
                              child: Row(
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: [
                                  Flexible(
                                    flex: 1,
                                    child: Container(
                                      decoration: BoxDecoration(
                                        color: Colors.white,
                                      ),
                                      child: Padding(
                                        padding: const EdgeInsets.symmetric(
                                            vertical: 4.0, horizontal: 4.0),
                                        child: SvgPicture.asset(
                                            'assets/google_logo.svg'),
                                      ),
                                    ),
                                  ),
                                  const Flexible(
                                    flex: 4,
                                    child: FittedBox(
                                      fit: BoxFit.fitWidth,
                                      child: Padding(
                                        padding: EdgeInsets.symmetric(
                                            vertical: 8, horizontal: 12.0),
                                        child: Text(
                                          'Login',
                                          style: TextStyle(
                                              fontSize: 18,
                                              fontWeight: FontWeight.bold,
                                              color: Colors.black),
                                        ),
                                      ),
                                    ),
                                  )
                                ],
                              ),
                            )),
                      ]),
                );
              } else if (state is Unregistered) {
                return const RegistrationPage();
              }
              return Center(
                child: Text('Undeined State: $state in LoginPage'),
              );
            },
          ),
        ),
      ),
    );
  }
}
