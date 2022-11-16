import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:prescription_ocr/common/theme_colors.dart';
import 'package:prescription_ocr/common/extensions/date_extension.dart';
import 'package:prescription_ocr/common/extensions/string_extension.dart';
import 'package:prescription_ocr/data/models/reminder/reminder_model.dart';

class ReminderCardInformation extends StatelessWidget {
  
  final ReminderModel reminderModel; 

  const ReminderCardInformation({
    required this.reminderModel,
    Key? key,
  }) : super(key: key);

  Widget buildMealIcon(Map<String,bool> mealCombination){
    if(mealCombination['Before']!){
      return SizedBox(
                  height: 150,
                  width: 75,
                  child: SvgPicture.asset(
                    'assets/pill_before_meal_gb.svg',
                    fit: BoxFit.contain,
                  ),
                );
    } else if(mealCombination['With']!){
      return SizedBox(
                  height: 150,
                  width: 75,
                  child: SvgPicture.asset(
                    'assets/pill_with_meal_gb.svg',
                    fit: BoxFit.contain,
                  ),
                );
    }
    return SizedBox(
                  height: 150,
                  width: 75,
                  child: SvgPicture.asset(
                    'assets/pill_after_meal_gb.svg',
                    fit: BoxFit.contain,
                  ),
                );
    
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
          color: ThemeColors.deepGrey,
          borderRadius: BorderRadius.only(
              topRight: Radius.circular(10), bottomRight: Radius.circular(10))),
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 16.0, vertical: 12.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              reminderModel.reminderTitle!,
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
                      'Cause',
                      style: GoogleFonts.roboto(
                        fontWeight: FontWeight.bold,
                        color: Colors.black,
                        fontSize: 18,
                      ),
                    ),
                    Text(
                      '${reminderModel.cause}',
                      style: GoogleFonts.roboto(
                        fontWeight: FontWeight.w300,
                        color: Colors.black,
                        fontSize: 14,
                      ),
                    ),
                    SizedBox(
                      height: 5,
                    ),
                    Text(
                      'Days',
                      style: GoogleFonts.roboto(
                        fontWeight: FontWeight.bold,
                        color: Colors.black,
                        fontSize: 18,
                      ),
                    ),
                    Text(
                      StringMapExtension(reminderModel.selectedDays).getDays('\n'),
                      style: GoogleFonts.roboto(
                        fontWeight: FontWeight.w300,
                        color: Colors.black,
                        fontSize: 14,
                      ),
                    ),
                   
                    Text(
                      'Reminders',
                      style: GoogleFonts.roboto(
                        fontWeight: FontWeight.bold,
                        color: Colors.black,
                        fontSize: 18,
                      ),
                    ),
                    Text(
                      DateTimeExtension(reminderModel.reminderTimes).getTimes('\n'),
                      style: GoogleFonts.roboto(
                        fontWeight: FontWeight.w300,
                        color: Colors.black,
                        fontSize: 14,
                      ),
                    ),
                  ],
                ),
                SizedBox(
                  width: 15,
                ),
                SizedBox(
                  height: 65,
                  child: VerticalDivider(
                    thickness: 1,
                    color: Colors.black,
                  ),
                ),
                SizedBox(
                  width: 15,
                ),
                buildMealIcon(reminderModel.mealCombination!)
              ],
            )
          ],
        ),
      ),
    );
  }
}
