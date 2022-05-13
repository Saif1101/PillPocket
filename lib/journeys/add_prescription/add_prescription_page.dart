import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:prescription_ocr/common/screen_utils.dart';
import 'package:prescription_ocr/common/theme_colors.dart';
import 'package:prescription_ocr/journeys/add_prescription/prescription_review_page.dart';

class AddPrescriptionPage extends StatefulWidget {
  const AddPrescriptionPage({Key? key}) : super(key: key);

  static const String routeName = '/add-prescription';

  static Route route() {
    return MaterialPageRoute(
        settings: RouteSettings(name: routeName),
        builder: (_) => AddPrescriptionPage());
  }

  @override
  State<AddPrescriptionPage> createState() => _AddPrescriptionPageState();
}

class _AddPrescriptionPageState extends State<AddPrescriptionPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: Stack(
      children: [
        Positioned(
          top: 0,
          left: 0,
          right: 0,
          child: SizedBox(
            height: ScreenUtil.screenHeight / 1.75,
            width: ScreenUtil.screenWidth,
            child: Card(
              elevation: 5,
              child: Container(
                padding: EdgeInsets.fromLTRB(16.0, 8.0, 16.0, 100.0),
                color: ThemeColors.primaryGreen,
                child: SvgPicture.asset('assets/prescription_w.svg'),
              ),
            ),
          ),
        ),
        Column(
          children: [
            SizedBox(
              height: ScreenUtil.screenHeight / 1.875,
            ),
            Padding(
              padding: EdgeInsets.symmetric(
                horizontal: ScreenUtil.screenWidth / 3.975,
              ),
              child: UseCameraButton(),
            ),
            SizedBox(
              height: 50,
            ),
            Padding(
              padding: EdgeInsets.symmetric(horizontal: 18.0),
              child: Row(
                children: [
                  Expanded(
                      child: Divider(
                    color: Colors.black,
                    thickness: 1.0,
                  )),
                  Padding(
                    padding: EdgeInsets.symmetric(horizontal: 18.0),
                    child: Text('OR', 
                    style: GoogleFonts.roboto(
                            fontWeight: FontWeight.bold,
                            color: Colors.black,
                            fontSize: 18,
                          ),),
                  ),
                  Expanded(
                      child: Divider(
                    color: Colors.black,
                    thickness: 1.0,
                  )),
                ],
              ),
            ),
            SizedBox(
              height: 50,
            ),
            Padding(
              padding: EdgeInsets.symmetric(
                horizontal: ScreenUtil.screenWidth / 3.975,
              ),
              child: SelectDocumentButton(),
            ),
          ],
        )
      ],
    ));
  }
}

class SelectDocumentButton extends StatelessWidget {
  const SelectDocumentButton({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: ScreenUtil.screenWidth / 1.5,
      child: ElevatedButton(
          onPressed: () {
            print('Button Press');
          },
          child: Row(
            mainAxisSize: MainAxisSize.min,
            children: [
              Icon(
                Icons.document_scanner,
                size: 15,
                color: Colors.black,
              ),
              SizedBox(
                width: 15,
              ),
              Text(
                'Select a document \n PDF,JPG or PNG',
                style: GoogleFonts.roboto(
                  fontWeight: FontWeight.w500,
                  color: Colors.black,
                  fontSize: 16,
                ),
              )
            ],
          ),
          style: ButtonStyle(
              backgroundColor: MaterialStateProperty.all(
                  ThemeColors.secondaryGrey),
              shape:
                  MaterialStateProperty.all<RoundedRectangleBorder>(
                      RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(18.0),
              )))),
    );
  }
}

class UseCameraButton extends StatelessWidget {
  const UseCameraButton({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: ScreenUtil.screenWidth / 2,
      child: ElevatedButton(
          onPressed: () {
            Navigator.pushNamed(context, PrescriptionReviewPage.routeName);
          },
          child: Row(
            mainAxisSize: MainAxisSize.min,
            children: [
              Icon(
                Icons.camera_alt_outlined,
                color: Colors.black,
              ),
              SizedBox(
                width: 15,
              ),
              Text(
                'Use Camera',
                style: GoogleFonts.roboto(
                  fontWeight: FontWeight.w500,
                  color: Colors.black,
                  fontSize: 16,
                ),
              )
            ],
          ),
          style: ButtonStyle(
              backgroundColor: MaterialStateProperty.all(
                  ThemeColors.secondaryGrey),
              shape:
                  MaterialStateProperty.all<RoundedRectangleBorder>(
                      RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(18.0),
              )))),
    );
  }
}
