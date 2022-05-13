import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:prescription_ocr/common/screen_utils.dart';
import 'package:prescription_ocr/common/theme_colors.dart';

class ProfilePage extends StatelessWidget {

  const ProfilePage({ Key? key }) : super(key: key);

  static const String routeName = '/profile-page';

  static Route route(){
    return MaterialPageRoute(
      settings: RouteSettings(name: routeName),
      builder: (_)=>ProfilePage());
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        appBar: AppBar(
          automaticallyImplyLeading: true,
          iconTheme: IconThemeData(
    color: Colors.black, //change your color here
  ),
        ),
        body: Column( 
          children: [
           Align(
             alignment: Alignment.center,
             child: Icon(Icons.account_circle, color: Colors.black,size:ScreenUtil.screenWidth/3,)), 
          Text('Lorem Ipsum', style: GoogleFonts.roboto(fontWeight: FontWeight.bold, color: Colors.black, fontSize: 24,),),
          SizedBox(height: 25,),
          Align(
            alignment: Alignment.centerLeft,
            child: Padding(
              padding: EdgeInsets.only(
                  left: ScreenUtil.screenWidth/20,
                  ),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  GreyTextDisplayWithHeader(header: 'Age',displayText: '19',),
                  SizedBox(height: 10,),
                  GreyTextDisplayWithHeader(header: 'Email',displayText: 'sfn1101@gmail.com',),
                  SizedBox(height: 10,),
                  GreyTextDisplayWithHeader(header: 'Phone',displayText: '123456789',),
                  SizedBox(height: 10,),
                ],
              ),
            ),
          ),
          ],
        ),
      ),
    );
  }
}

class GreyTextDisplayWithHeader extends StatelessWidget {
  final String header; 
  final String displayText; 
  final double? headerSize;
  final double? textSize; 
  const GreyTextDisplayWithHeader({
    required this.header, 
    required this.displayText,
    
    Key? key, this.headerSize, this.textSize,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
                  BlackTextHeader(header: header, fontSize: headerSize,),
                  SizedBox(height: 5,),
                  Container(
                    padding: EdgeInsets.symmetric(horizontal: 12.0, vertical: 8.0),
                    decoration: BoxDecoration(
                      color: ThemeColors.primaryGrey,
                    ),
                    child: Text(
                      displayText,
                      style: GoogleFonts.roboto(fontWeight: FontWeight.w500, color: Colors.black, fontSize: textSize??16,),),
                  )
      ],
    );
  }
}

class BlackTextHeader extends StatelessWidget {
  final double? fontSize;
  const BlackTextHeader({
    Key? key,
    required this.header, this.fontSize,
  }) : super(key: key);

  final String header;

  @override
  Widget build(BuildContext context) {
    return Text(header, 
    style: GoogleFonts.roboto(fontWeight: FontWeight.bold, 
    color: Colors.black, fontSize: fontSize??20,),);
  }
}
