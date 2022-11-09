import 'package:flutter/material.dart';
import 'package:prescription_ocr/journeys/inspect_reminder_page/inspect_reminder_page.dart';

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
            onPressed: () {
              Navigator.pushNamed(context, InspectReminderPage.routeName);
            },
            icon: Icon(Icons.edit)),
        IconButton(
            onPressed: () {
              print("Delete Button Pressed");
            },
            icon: Icon(Icons.delete))
      ],
    );
  }
}
