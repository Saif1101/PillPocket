import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:prescription_ocr/common/screen_utils.dart';
import 'package:prescription_ocr/common/theme_colors.dart';
import 'package:prescription_ocr/journeys/add_prescription/add_prescription_page.dart';
import 'package:prescription_ocr/journeys/edit_prescription/edit_prescription.dart';
import 'package:prescription_ocr/journeys/history/history_page.dart';
import 'package:prescription_ocr/journeys/profile/profile_page.dart';

class InspectPrescriptionPage extends StatelessWidget {

  const InspectPrescriptionPage({ Key? key }) : super(key: key);

  static const String routeName = '/inspect-prescription';

  static Route route(){
    return MaterialPageRoute(
      settings: RouteSettings(name: routeName),
      builder: (_)=>InspectPrescriptionPage());
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        appBar: AppBar(
          backgroundColor: ThemeColors.primaryGreen,
          elevation: 0,
          actions: [
            IconButton(
              onPressed: (){
                Navigator.pushNamed(context, EditPrescriptionPage.routeName);
              }, 
              icon: Icon(Icons.edit, color: Colors.white,)
              ),
              IconButton(
              onPressed: (){
                print('Delete button pressed');
              }, 
              icon: Icon(Icons.delete, color: Colors.white,)
              ),

          ],
        ),
        backgroundColor: ThemeColors.primaryGreen,
        body: Container(
          decoration: BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.only(topLeft: Radius.circular(10), topRight: Radius.circular(10))
          ),
          child: Column(
            children: [
              Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text(
                          'Prescription#A',
                          style: GoogleFonts.roboto(
                            fontWeight: FontWeight.bold,
                            color: Colors.black,
                            fontSize: 32,
                          ),
                        ),
                         DateCard(),
                      ],
                    ),
              Column(
                          mainAxisAlignment: MainAxisAlignment.start,
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              'Doctor',
                              style: GoogleFonts.roboto(
                                fontWeight: FontWeight.bold,
                                color: Colors.black,
                                fontSize: 24,
                              ),
                            ),
                            Text(
                              'Dr. Lorem Ipsum',
                              style: GoogleFonts.roboto(
                                fontWeight: FontWeight.w300,
                                color: Colors.black,
                                fontSize: 18,
                              ),
                            ),
                            SizedBox(height: 5,), 
                            Text(
                              'Cause',
                              style: GoogleFonts.roboto(
                                fontWeight: FontWeight.bold,
                                color: Colors.black,
                                fontSize: 24,
                              ),
                            ),
                            Text(
                              'Stomach Distress',
                              style: GoogleFonts.roboto(
                                fontWeight: FontWeight.w300,
                                color: Colors.black,
                                fontSize: 18,
                              ),
                            ),
                            SizedBox(height: 5,), 
                            Text(
                              'Notes',
                              style: GoogleFonts.roboto(
                                fontWeight: FontWeight.bold,
                                color: Colors.black,
                                fontSize: 24,
                              ),
                            ),
                            Text(
                              "Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam," 
                              "quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo consequat. Duis aute irure dolor in reprehenderit"
                              "in voluptate velit esse cillum dolore eu fugiat nulla pariatur. Excepteur sint occaecat cupidatat non proident, sunt in culpa qui officia deserunt mollit anim id est laborum.",
                              overflow: TextOverflow.ellipsis,
                              maxLines: 3,
                              style: GoogleFonts.roboto(
                                fontWeight: FontWeight.w300,
                                color: Colors.black,
                                fontSize: 18,
                              ),
                            ),
                              
                          ],
                        ),
                        Row(
                children: [
                  BlackTextHeader(header: 'Reminder Time(s)'),
                  IconButton(
                      onPressed: () {
                       'Redirect to edit reminders';
                      },
                      icon: Icon(
                        Icons.edit,
                        color: Colors.black,
                      ))
                ],
              ),
              Align(
                alignment: Alignment.centerLeft,
                child: Padding(
                  padding: const EdgeInsets.only(top: 2.0, left: 16.0, ),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text('Reminder1', 
                      style: GoogleFonts.roboto(
                                    fontWeight: FontWeight.w500,
                                    color: Colors.black,
                                    fontSize: 16,
                                  ),),
                      SizedBox(
                        height: 5,
                      ),
                      Text('Reminder2', 
                      style: GoogleFonts.roboto(
                                    fontWeight: FontWeight.w500,
                                    color: Colors.black,
                                    fontSize: 16,
                                  ),),
                      SizedBox(
                        height: 5,
                      ),
                      Text('Reminder3', 
                      style: GoogleFonts.roboto(
                                    fontWeight: FontWeight.w500,
                                    color: Colors.black,
                                    fontSize: 16,
                                  ),),
                    ],
                  ),
                ),
              ), 
              SizedBox(
                        height: 5,
                      ),
              Text('Prescription', 
                      style: GoogleFonts.roboto(
                                    fontWeight: FontWeight.w800,
                                    color: Colors.black,
                                    fontSize: 18,
                                  ),),
              Divider(color: Colors.black,
              thickness: 1.0,),
              Expanded(
                child: Image.asset('assets/SamplePrescription.png',
                fit: BoxFit.contain,) 
                ,),
                


            ],
          ),
        )
      )
    );
  }
}