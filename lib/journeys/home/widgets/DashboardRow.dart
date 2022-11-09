import 'package:flutter/material.dart';
import 'package:prescription_ocr/common/theme_colors.dart';
import 'package:prescription_ocr/journeys/history/history_page.dart';
import 'package:prescription_ocr/journeys/home/widgets/DashboardGreenButton.dart';
import 'package:prescription_ocr/journeys/inspect_reminder_page/inspect_reminder_page.dart';

class DashboardRow extends StatelessWidget {
  const DashboardRow({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.symmetric(vertical: 4),
      color: ThemeColors.primaryGrey,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: [
          DashboardGreenButton(
            onTap: () {
              Navigator.pushNamed(context, HistoryPage.routeName);
            },
            text: 'History',
            icon: Icons.history_outlined,
          ),
          DashboardGreenButton(
            onTap: () {
              Navigator.pushNamed(context, InspectReminderPage.routeName);
            },
            text: 'Reminder',
            icon: Icons.add,
          ),
        ],
      ),
    );
  }
}
