import 'package:flutter/material.dart';
import 'package:prescription_ocr/journeys/common_widgets/EditDeleteButtonBar.dart';
import 'package:prescription_ocr/journeys/common_widgets/ReminderCardInformation.dart';

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
          // ReminderCardInformation()
          child: SizedBox(),
        ),
        EditDeleteButtonBar(),
      ],
    );
  }
}
