import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:prescription_ocr/common/theme_colors.dart';
import 'package:prescription_ocr/journeys/history/history_page.dart';
import 'package:prescription_ocr/journeys/home/home_page.dart';
import 'package:prescription_ocr/journeys/inspect_reminder_page/inspect_reminder_page.dart';

class ReminderReviewPage extends StatelessWidget {
  const ReminderReviewPage({Key? key}) : super(key: key);

  static const String routeName = '/reminder-review';

  static Route route() {
    return MaterialPageRoute(
        settings: RouteSettings(name: routeName),
        builder: (_) => ReminderReviewPage());
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
        child: Scaffold(
      floatingActionButton: FloatingActionButton.extended(
        backgroundColor: ThemeColors.primaryGreen,
        icon: Icon(Icons.add),
        label: Text(
          'Add reminder',
          style: GoogleFonts.roboto(
            fontWeight: FontWeight.w500,
            color: Colors.white,
            fontSize: 16,
          ),
        ),
        onPressed: () {
          Navigator.pushNamed(context, InspectReminderPage.routeName);
        },
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerFloat,
      body: Stack(
        children: [
          Container(
            padding: EdgeInsets.all(18),
            color: ThemeColors.primaryGreen,
            child: Column(
              mainAxisSize: MainAxisSize.min,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Row(
                  children: [
                    Text(
                      'Reminders',
                      style: GoogleFonts.roboto(
                        fontWeight: FontWeight.bold,
                        color: Colors.white,
                        fontSize: 40,
                      ),
                    ),
                  ],
                ),
                SizedBox(
                  height: 3,
                ),
                Text('Configure reminders for this prescription.',
                style: GoogleFonts.roboto(
                    fontWeight: FontWeight.w800,
                    color: Colors.white,
                    fontSize: 14,
                  ),),
              ],
            ),
          ),
          Column(
            children: [
              SizedBox(height: 85,),
              Expanded(
                child: ListView.separated(
                  
                  shrinkWrap: true,
                  itemCount:  5,
                  itemBuilder: (BuildContext context, int index) {  
                    return ReminderCardCondensed();
                  }, separatorBuilder: (BuildContext context, int index) { 
                    return SizedBox(height:10);
                   },
                  ),
              ),
            ],
          )
        ],
      ),
    ));
  }
}
