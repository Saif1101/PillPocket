import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:prescription_ocr/common/screen_utils.dart';

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
      body: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Padding(
              padding:
                  const EdgeInsets.symmetric(horizontal: 30.0, vertical: 2.0),
              child: Center(
                child: SizedBox(
                    width: ScreenUtil.screenWidth,
                    child: FittedBox(
                      fit: BoxFit.fitWidth,
                      child: Text(
                        'PrescriptionOCR',
                        style: GoogleFonts.manrope(
                          color: Colors.black,
                          fontWeight: FontWeight.w500,
                        ),
                      ),
                    )),
              ),
            ),
            SizedBox(
                height: ScreenUtil.screenHeight / 4,
                child: SvgPicture.asset('assets/Logo(0).svg')),
            SizedBox(
              height: ScreenUtil.screenHeight / 8,
            ),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal:32.0,vertical: 8.0),
              child: Center(
                child: Material(
                  
                  shape: RoundedRectangleBorder(borderRadius:BorderRadius.circular(32) ),
                  elevation: 10,
                  child: Container(
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(32),
                      border: Border.all(color: Colors.blue)
                    ),
                    child: InkWell(
                      onTap: (){
                        Navigator.pushNamed(context, '/profile-page');
                      },
                      child: Row(
                        crossAxisAlignment: CrossAxisAlignment.center,
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Padding(
                            padding: const EdgeInsets.symmetric(
                                vertical: 12.0, horizontal: 6.0),
                            child: Text(
                              'Login',
                              style: Theme.of(context).textTheme.bodyText1,
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal:32.0,vertical: 8.0),
              child: Center(
                child: Material(
                  elevation: 10,
                  shape: RoundedRectangleBorder(borderRadius:BorderRadius.circular(32) ),
                  child: Container(
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(32),
                      border: Border.all(color: Colors.blue)
                    ),
                    child: InkWell(
                      onTap: () => {print("Sign-up button")},
                      child: Row(
                        crossAxisAlignment: CrossAxisAlignment.center,
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Padding(
                            padding: const EdgeInsets.symmetric(
                                vertical: 12.0, horizontal: 6.0),
                            child: Text(
                              'Sign Up',
                              style: Theme.of(context).textTheme.bodyText1,
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                ),
              ),
            ),
          ]),
    );
  }
}
