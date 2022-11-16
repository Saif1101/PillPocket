import 'package:flutter/material.dart';
import 'package:prescription_ocr/data/models/reminder/reminder_model.dart';
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
          child: ReminderCardInformation(
            reminderModel: ReminderModel(
              reminderTitle: 'Sample Prescription',
              mealCombination: {'Before': true, 'With': false, "After": false},
              
              selectedDays: {
                'Monday': false,
                'Tuesday': true,
                'Wednesday': true,
                'Thursday': false,
                'Friday': false,
                'Saturday': false,
                'Sunday': false,
                'Everyday': false,
              },
            ),
          ),
        ),
        EditDeleteButtonBar(),
      ],
    );
  }
}
