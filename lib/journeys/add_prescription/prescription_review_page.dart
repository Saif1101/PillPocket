
import 'package:camera/camera.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:google_fonts/google_fonts.dart';

import 'package:flutter/material.dart';
import 'package:prescription_ocr/common/utils/screen_utils.dart';
import 'package:prescription_ocr/common/theme_colors.dart';
import 'package:prescription_ocr/journeys/add_prescription/reminders_review_page.dart';
import 'package:prescription_ocr/journeys/common_widgets/GreyTextDisplayWithHeader.dart';
import 'package:prescription_ocr/journeys/widgets/circular_progress_indicator.dart';
import 'package:prescription_ocr/main.dart';

import '../profile/profile_page.dart';

class PrescriptionReviewPage extends StatefulWidget {
  static const String routeName = '/prescription-review';

  const PrescriptionReviewPage({
    Key? key,
  }) : super(key: key);

  static Route route() {
    return MaterialPageRoute(
        settings: RouteSettings(name: routeName),
        builder: (_) => PrescriptionReviewPage());
  }

  @override
  State<PrescriptionReviewPage> createState() => _PrescriptionReviewPageState();
}

class _PrescriptionReviewPageState extends State<PrescriptionReviewPage> {


  late CameraController controller;


  @override
  void initState(){
    super.initState();
    controller = CameraController(cameras[0], ResolutionPreset.max);
    controller.initialize().then((_) {
      if (!mounted) {
        return;
      }
      setState(() {});
    }).catchError((Object e) {
      if (e is CameraException) {
        switch (e.code) {
          case 'CameraAccessDenied':
            print('User denied camera access.');
            break;
          default:
            print('Handle other errors.');
            break;
        }
      }
    });
  }

  @override
  void dispose() {
    controller.dispose();
    super.dispose();
  }
  
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
          child: SafeArea(
              child: Scaffold(
        body: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              SizedBox(
                width: ScreenUtil.screenWidth,
                height: ScreenUtil.screenWidth,
                child: !controller.value.isInitialized?LoadingWidget():CameraPreview(controller),
              ),
              Material(
                elevation: 5,
                child: Container(
                  width: ScreenUtil.screenWidth,
                  color: ThemeColors.primaryGreen,
                  child: Center(
                    child: Padding(
                      padding: EdgeInsets.symmetric(vertical: 8),
                      child: Text(
                        'Preview',
                        style: GoogleFonts.roboto(
                          fontWeight: FontWeight.bold,
                          color: Colors.white,
                          fontSize: 16,
                        ),
                      ),
                    ),
                  ),
                ),
              ),
              SizedBox(
                height: 20,
              ),
              Padding(
                padding: const EdgeInsets.only(top: 4, left: 16),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    GreyTextDisplayWithHeader(
                      header: 'Prescription Title',
                      displayText: '19',
                    ),
                    SizedBox(
                      height: 10,
                    ),
                    GreyTextDisplayWithHeader(
                      header: 'Doctor\'s Name',
                      displayText: 'sfn1101@gmail.com',
                    ),
                    SizedBox(
                      height: 10,
                    ),
                    GreyTextDisplayWithHeader(
                      header: 'Ailment',
                      displayText: '123456789',
                    ),
                    SizedBox(
                      height: 10,
                    ),
                    GreyTextDisplayWithHeader(
                      header: 'Notes',
                      displayText:
                          'Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo consequat. Duis aute irure dolor in reprehenderit in voluptate velit esse cillum dolore eu fugiat nulla pariatur. Excepteur sint occaecat cupidatat non proident, sunt in culpa qui officia deserunt mollit anim id est laborum.',
                    ),
                    Align(
                      alignment: Alignment.center,
                      child: GestureDetector(
                        onTap: () {
                          Navigator.pushNamed(
                              context, ReminderReviewPage.routeName);
                        },
                        child: SizedBox(
                          width: 65,
                          height: 65,
                          child: Padding(
                            padding: const EdgeInsets.symmetric(
                                horizontal: 10.0, vertical: 8),
                            child: Material(
                              color: ThemeColors.primaryGreen,
                              elevation: 5,
                              child: Container(
                                alignment: Alignment.center,
                                padding: EdgeInsets.symmetric(
                                    horizontal: 8, vertical: 6),
                                child: SvgPicture.asset(
                                  'assets/tick_white.svg',
                                  fit: BoxFit.contain,
                                ),
                              ),
                            ),
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
              )
            ],
          ),
        ),
      ))),
    );
  }
}
