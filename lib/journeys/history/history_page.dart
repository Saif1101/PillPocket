import 'package:flutter/material.dart';

import 'package:google_fonts/google_fonts.dart';
import 'package:prescription_ocr/journeys/common_widgets/GreenWhitePageHeader.dart';
import 'package:prescription_ocr/journeys/common_widgets/PrescriptionCardCondensed.dart';
import 'package:prescription_ocr/journeys/common_widgets/ReminderCardCondensed.dart';

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
            GreenWhitePageHeader(
              text: 'Prescriptions\n& Reminders',
            ),
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
                  onTap: () {
                    showReminders = !showReminders;
                    setState(() {});
                  },
                  child: GRBWGColorSwitchButton(
                    text: 'Prescriptions',
                    fontWeight: FontWeight.w500,
                    fontSize: 14,
                    isSelected: !showReminders,
                  ),
                ),
                GestureDetector(
                  onTap: () {
                    showReminders = !showReminders;
                    setState(() {});
                  },
                  child: GRBWGColorSwitchButton(
                    text: 'Reminders',
                    fontWeight: FontWeight.w500,
                    fontSize: 14,
                    isSelected: showReminders,
                  ),
                ),
              ],
            ),
            SizedBox(
              height: 25,
            ),
            Expanded(
              child:
                  showReminders ? showRemindersList() : showPrescriptionsList(),
            )
          ]),
    ));
  }

  ListView showRemindersList() {
    return ListView.separated(
      padding: EdgeInsets.only(top: 10),
      shrinkWrap: true,
      itemCount: 5,
      itemBuilder: (BuildContext context, int index) {
        return ReminderCardCondensed();
      },
      separatorBuilder: (BuildContext context, int index) {
        return SizedBox(
          height: 20,
        );
      },
    );
  }

  ListView showPrescriptionsList() {
    return ListView.separated(
      padding: EdgeInsets.only(top: 10),
      shrinkWrap: true,
      itemCount: 5,
      itemBuilder: (BuildContext context, int index) {
        return SizedBox();
      },
      separatorBuilder: (BuildContext context, int index) {
        return SizedBox(
          height: 20,
        );
      },
    );
  }
}
