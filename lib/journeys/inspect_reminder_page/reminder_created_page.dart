import 'package:flutter/material.dart';
import 'package:flutter/src/foundation/key.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:prescription_ocr/common/theme_colors.dart';
import 'package:prescription_ocr/journeys/inspect_reminder_page/inspect_reminder_page.dart';

class ReminderCreatedConfirmationPage extends StatefulWidget {
  const ReminderCreatedConfirmationPage({Key? key}) : super(key: key);

  static const String routeName = '/reminder-created-confirmation';

  static Route route() {
    return MaterialPageRoute(
        settings: const RouteSettings(name: routeName),
        builder: (_) => ReminderCreatedConfirmationPage());
  }

  @override
  State<ReminderCreatedConfirmationPage> createState() =>
      _ReminderCreatedConfirmationPageState();
}

class _ReminderCreatedConfirmationPageState
    extends State<ReminderCreatedConfirmationPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Text(
              'Reminder Created',
              style: GoogleFonts.roboto(
                fontWeight: FontWeight.bold,
                color: Colors.black,
                fontSize: 32,
              ),
            ),
            SizedBox(height: 10,),
            IconButton(
              icon: Icon(Icons.done,
              color: ThemeColors.primaryGreen,
              size: 64), onPressed: () { Navigator.pop(context); },
            )
          ],
        ),
      ),
    );
  }
}
