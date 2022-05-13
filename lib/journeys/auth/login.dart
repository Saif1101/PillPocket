import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:prescription_ocr/common/screen_utils.dart';
import 'package:prescription_ocr/common/theme_colors.dart';
import 'package:prescription_ocr/journeys/home/home_page.dart';

class LoginScreen extends StatelessWidget {
  const LoginScreen({Key? key}) : super(key: key);

  static const String routeName = '/login';

  static Route route() {
    return MaterialPageRoute(
        settings: RouteSettings(name: routeName),
        builder: (_) => LoginScreen());
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              SizedBox(
                height: ScreenUtil.screenHeight / 2,
                width: ScreenUtil.screenWidth,
                child: Container(
                  padding: EdgeInsets.all(16),
                  color: ThemeColors.primaryGreen,
                  child: SvgPicture.asset(
                    'assets/Logo_prescription_pill_pocket_rotated.svg',
                    fit: BoxFit.contain,
                  ),
                ),
              ),
              Padding(
                padding:
                    const EdgeInsets.symmetric(horizontal: 30.0, vertical: 2.0),
                child: Center(
                  child: SizedBox(
                      width: ScreenUtil.screenWidth,
                      child: FittedBox(
                        fit: BoxFit.fitWidth,
                        child: Text(
                          'PillPocket',
                          style: GoogleFonts.inter(
                            color: ThemeColors.primaryGreen,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                      )),
                ),
              ),
              SizedBox(
                height: ScreenUtil.screenHeight / 8,
              ),
              GestureDetector(
                  onTap: () {
                    Navigator.pushNamed(context, HomePage.routeName);
                  },
                  child: Card(
                    elevation: 5,
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
                          Flexible(
                            flex: 4,
                            child: FittedBox(
                              fit: BoxFit.fitWidth,
                              child: Padding(
                                padding: EdgeInsets.symmetric(
                                  vertical: 8,
                                    horizontal: 12.0),
                                child: Text(
                                  'Login',
                                  style: TextStyle(
                                      fontSize: 24,
                                      fontWeight: FontWeight.w400,
                                      color: Colors.black),
                                ),
                              ),
                            ),
                          )
                        ],
                      ),
                    ),
                  )),
            ]),
      ),
    );
  }
}
