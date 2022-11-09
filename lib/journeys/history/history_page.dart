import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:prescription_ocr/common/utils/screen_utils.dart';
import 'package:prescription_ocr/common/theme_colors.dart';
import 'package:prescription_ocr/journeys/add_prescription/prescription_review_page.dart';
import 'package:prescription_ocr/journeys/inspect_prescription/inspect_prescription_page.dart';
import 'package:prescription_ocr/journeys/inspect_reminder_page/inspect_reminder_page.dart';

class HistoryPage extends StatefulWidget {
  const HistoryPage({Key? key}) : super(key: key);

  static const String routeName = '/history-page';

  static Route route() {
    return MaterialPageRoute(
        settings: RouteSettings(name: routeName),
        builder: (_) => HistoryPage());
  }

  @override
  State<HistoryPage> createState() => _HistoryPageState();
}

class _HistoryPageState extends State<HistoryPage> {

  bool showReminders = false; 

  @override
  Widget build(BuildContext context) {
    return SafeArea(
        child: Scaffold(
      body: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            GreenWhitePageHeader(text: 'Prescriptions\n& Reminders',),
            SizedBox(
              height: 15,
            ),
            Padding(
              padding: const EdgeInsets.only(
                  left: 16.0, right: 2.0, top: 8.0, bottom: 8.0),
              child: Text(
                'Tap on a prescription or a reminder card to see related\ninformation.',
                style: GoogleFonts.roboto(
                  fontWeight: FontWeight.bold,
                  color: Colors.black,
                  fontSize: 14,
                ),
              ),
            ),
            SizedBox(
              height: 15,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                GestureDetector(
                  onTap: (){
                    showReminders = !showReminders; 
                    setState(() {
                      
                    });
                  },
                  child: GRBWGColorSwitchButton(
                      text: 'Prescriptions',
                      fontWeight: FontWeight.w500,
                      fontSize: 14, 
                      isSelected: !showReminders,),
                ),
                GestureDetector(
                  onTap: (){
                    showReminders = !showReminders; 
                    setState(() {
                      
                    });
                  },
                  child: GRBWGColorSwitchButton(
                      text: 'Reminders',
                      fontWeight: FontWeight.w500,
                      fontSize: 14, 
                      isSelected: showReminders,),
                ),
              ],
            ),
            SizedBox(
              height: 25,
            ),
            Expanded(
              child: showReminders ? showRemindersList() : showPrescriptionsList(),
            )
          ]),
    ));
  }

  ListView showRemindersList() {
    return ListView.separated(
             padding: EdgeInsets.only(top: 10),
              shrinkWrap: true,
              itemCount: 5 ,
              itemBuilder: (BuildContext context, int index) {  
                return ReminderCardCondensed();
              }, separatorBuilder: (BuildContext context, int index) {  
                return SizedBox(height: 20,);
              },
            );
  }

  ListView showPrescriptionsList() {
    return ListView.separated(
             padding: EdgeInsets.only(top: 10),
              shrinkWrap: true,
              itemCount: 5,
              itemBuilder: (BuildContext context, int index) {  
                return PrescriptionCardCondensed();
              }, separatorBuilder: (BuildContext context, int index) {  
                return SizedBox(height: 20,);
              },
            );
  }
}

class GreenWhitePageHeader extends StatelessWidget {
  final String text; 
  const GreenWhitePageHeader({
    required this.text,
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      color: ThemeColors.primaryGreen,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.start,
        children: [
          Padding(
            padding: const EdgeInsets.symmetric(
                vertical: 14.0, horizontal: 18),
            child: Text(
              text,
              style: GoogleFonts.roboto(
                fontWeight: FontWeight.bold,
                color: Colors.white,
                fontSize: 24,
              ),
            ),
          ),
        ],
      ),
    );
  }
}

class ReminderCardCondensed extends StatelessWidget {
  const ReminderCardCondensed({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
      children: [
        Expanded(
          child: ReminderCardInformation(),
        ), 
        EditDeleteButtonBar(),
      ],
    );
  }
}

class EditDeleteButtonBar extends StatelessWidget {
  const EditDeleteButtonBar({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
      children: [
        IconButton(
          onPressed: (){
            Navigator.pushNamed(context, InspectReminderPage.routeName);
          }, 
          icon: Icon(Icons.edit)), 
          IconButton(
          onPressed: (){
            print("Delete Button Pressed");
          }, 
          icon: Icon(Icons.delete))
      ],
    );
  }
}

class ReminderCardInformation extends StatelessWidget {
  const ReminderCardInformation({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        color: ThemeColors.deepGrey,
        borderRadius: BorderRadius.only(topRight: Radius.circular(10), bottomRight:  Radius.circular(10))
      ),
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal:16.0, vertical: 12.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              'Paracetamol',
              style: GoogleFonts.roboto(
                fontWeight: FontWeight.bold,
                color: Colors.black,
                fontSize: 32,
              ),
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround, 
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Column(
                  mainAxisAlignment: MainAxisAlignment.start,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      'Dosage',
                      style: GoogleFonts.roboto(
                        fontWeight: FontWeight.bold,
                        color: Colors.black,
                        fontSize: 18,
                      ),
                    ),
                    Text(
                      '500 mg.',
                      style: GoogleFonts.roboto(
                        fontWeight: FontWeight.w300,
                        color: Colors.black,
                        fontSize: 14,
                      ),
                    ),
                    SizedBox(height: 5,), 
                    Text(
                      'Duration',
                      style: GoogleFonts.roboto(
                        fontWeight: FontWeight.bold,
                        color: Colors.black,
                        fontSize: 18,
                      ),
                    ),
                    Text(
                      '4 weeks | 2 days',
                      style: GoogleFonts.roboto(
                        fontWeight: FontWeight.w300,
                        color: Colors.black,
                        fontSize: 14,
                      ),
                    ),
                    SizedBox(height: 5,), 
                    Text(
                      'Reminders',
                      style: GoogleFonts.roboto(
                        fontWeight: FontWeight.bold,
                        color: Colors.black,
                        fontSize: 18,
                      ),
                    ),
                    Text(
                      '9:00 AM\n3:00 PM\n4:00 PM\n',
                      style: GoogleFonts.roboto(
                        fontWeight: FontWeight.w300,
                        color: Colors.black,
                        fontSize: 14,
                      ),
                    ),
        
                  ],
                ),
                SizedBox(width: 15,),
                SizedBox(
                  height: 65,
                  child: VerticalDivider(thickness: 1, color: Colors.black,),
                ),
                SizedBox(width: 15,),
                SizedBox(
                  height: 150,
                  width: 75,
                  child: SvgPicture.asset('assets/pill_after_meal_gb.svg',fit: BoxFit.contain,),
                ),
              
              ],
            )
          ],
        ),
      ),
    );
  }
}

class PrescriptionCardCondensed extends StatelessWidget {
  const PrescriptionCardCondensed({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
      children: [
        Expanded(
          child: Container(
            decoration: BoxDecoration(
              color: ThemeColors.deepGrey,
              borderRadius: BorderRadius.only(topRight: Radius.circular(10), bottomRight:  Radius.circular(10))
            ),
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal:16.0, vertical: 12.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
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
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceAround, 
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      Flexible(
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.start,
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              'Doctor',
                              style: GoogleFonts.roboto(
                                fontWeight: FontWeight.bold,
                                color: Colors.black,
                                fontSize: 18,
                              ),
                            ),
                            Text(
                              'Dr. Lorem Ipsum',
                              style: GoogleFonts.roboto(
                                fontWeight: FontWeight.w300,
                                color: Colors.black,
                                fontSize: 14,
                              ),
                            ),
                            SizedBox(height: 5,), 
                            Text(
                              'Cause',
                              style: GoogleFonts.roboto(
                                fontWeight: FontWeight.bold,
                                color: Colors.black,
                                fontSize: 18,
                              ),
                            ),
                            Text(
                              'Stomach Distress',
                              style: GoogleFonts.roboto(
                                fontWeight: FontWeight.w300,
                                color: Colors.black,
                                fontSize: 14,
                              ),
                            ),
                            SizedBox(height: 5,), 
                            Text(
                              'Notes',
                              style: GoogleFonts.roboto(
                                fontWeight: FontWeight.bold,
                                color: Colors.black,
                                fontSize: 18,
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
                                fontSize: 14,
                              ),
                            ),
                              
                          ],
                        ),
                      ),
                      
                     
                    
                    ],
                  )
                ],
              ),
            ),
          ),
        ), 
        Column(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            IconButton(
              onPressed: (){
                Navigator.pushNamed(context, InspectPrescriptionPage.routeName);
              }, 
              icon: Icon(Icons.keyboard_arrow_right)), 
              
          ],
        ),
      ],
    );
  }
}

class DateCard extends StatelessWidget {
  const DateCard({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Card(
               shape: RoundedRectangleBorder(
                 borderRadius: BorderRadius.circular(12),
               ),
               elevation: 5.0,
               child: Padding(
                 padding: const EdgeInsets.all(4.0),
                 child: Column(
                     mainAxisSize: MainAxisSize.min,
                     mainAxisAlignment:
                         MainAxisAlignment.center,
                     children: [
                       Icon(
                         Icons.calendar_today,
                         color: Colors.black,
                         
                       ),
                       Padding(
                         padding: const EdgeInsets.all(4.0),
                         child: Text(
                           '10/11/12',
                           style: TextStyle(
                               fontWeight: FontWeight.bold),
                         ),
                       ),
                       
                     ]),
               ),
    );
  }
}