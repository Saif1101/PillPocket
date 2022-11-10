import 'package:flutter/material.dart';
import 'package:prescription_ocr/common/utils/screen_utils.dart';
import 'package:prescription_ocr/data/models/user/user_profile.dart';
import 'package:prescription_ocr/journeys/common_widgets/PrescriptionCardCondensed.dart';
import 'package:prescription_ocr/journeys/common_widgets/ReminderCardInformation.dart';
import 'package:prescription_ocr/journeys/home/recent_prescriptions_column.dart';
import 'package:prescription_ocr/journeys/home/upcoming_reminders_row.dart';
import 'package:prescription_ocr/journeys/home/widgets/DashboardRow.dart';
import 'package:prescription_ocr/journeys/home/widgets/RichTextHeader.dart';

class HomePageBody extends StatelessWidget {
  final UserProfile currentUser;

  const HomePageBody({
    Key? key,
    required this.currentUser,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          SizedBox(
            height: 20,
          ),
          Padding(
            padding: EdgeInsets.only(left: 20.0),
            child: Align(
                alignment: Alignment.centerLeft,
                child: RichTextHeader(
                  lightText: 'Hello, ',
                  boldText: currentUser.firstName!,
                )),
          ),
          SizedBox(
            height: 10,
          ),
          DashboardRow(),
          SizedBox(
            height: 5,
          ),
          Row(
            children: [
              Expanded(
                  child: Padding(
                padding: const EdgeInsets.symmetric(horizontal: 16.0),
                child: Divider(
                  color: Colors.black,
                  thickness: 1,
                ),
              )),
              //TODO Reolace with stateful widget to display all reminders in a list view
              Align(
                  alignment: Alignment.centerRight,
                  child: RichTextHeader(
                    lightText: 'Upcoming ',
                    boldText: 'Reminders',
                  )),
              SizedBox(
                width: 5,
              )
            ],
          ),
          UpcomingRemindersRow(),
          //TODO Replace with stateful widget to display all Prescriptions in a list view
          Row(
            children: [
              SizedBox(width: 5,),
              Align(
                  alignment: Alignment.centerRight,
                  child: RichTextHeader(
                    lightText: 'Recent ',
                    boldText: 'Prescriptions',
                  )),
              Expanded(
                  child: Padding(
                padding: const EdgeInsets.symmetric(horizontal: 16.0),
                child: Divider(
                  color: Colors.black,
                  thickness: 1,
                ),
              )),
            ],
          ),
          RecentPrescriptionsColumn(),
        ],
      ),
    );
  }
}
