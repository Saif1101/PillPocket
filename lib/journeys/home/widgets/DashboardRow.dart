import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:prescription_ocr/blocs/home_page/home_page_bloc.dart';
import 'package:prescription_ocr/blocs/recent_prescriptions/recent_prescriptions_bloc.dart';
import 'package:prescription_ocr/blocs/upcoming_reminders/upcoming_reminders_bloc.dart';
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
            onTap: ()async{
             Navigator.pushNamed(context, HistoryPage.routeName).then((value) {
              BlocProvider.of<RecentPrescriptionsBloc>(context).add(RecentPrescriptionsEvent.started());
             });
              
            },
            text: 'History',
            icon: Icons.history_outlined,
          ),
          DashboardGreenButton(
            onTap: () async {
              Navigator.pushNamed(context, InspectReminderPage.routeName).then((value) {
               
                 BlocProvider.of<UpcomingRemindersBloc>(context).add(UpcomingRemindersEvent.started());
              });
              

            },
            text: 'Reminder',
            icon: Icons.add,
          ),
        ],
      ),
    );
  }
}
