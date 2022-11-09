import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:prescription_ocr/common/theme_colors.dart';

class ReminderCardInformation extends StatelessWidget {
  const ReminderCardInformation({
    Key? key,
  }) : super(key: key);

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
              'Paracetamol',
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
                      'Dosage',
                      style: GoogleFonts.roboto(
                        fontWeight: FontWeight.bold,
                        color: Colors.black,
                        fontSize: 18,
                      ),
                    ),
                    Text(
                      '500 mg.',
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
                      'Duration',
                      style: GoogleFonts.roboto(
                        fontWeight: FontWeight.bold,
                        color: Colors.black,
                        fontSize: 18,
                      ),
                    ),
                    Text(
                      '4 weeks | 2 days',
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
                      'Reminders',
                      style: GoogleFonts.roboto(
                        fontWeight: FontWeight.bold,
                        color: Colors.black,
                        fontSize: 18,
                      ),
                    ),
                    Text(
                      '9:00 AM\n3:00 PM\n4:00 PM\n',
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
                SizedBox(
                  height: 150,
                  width: 75,
                  child: SvgPicture.asset(
                    'assets/pill_after_meal_gb.svg',
                    fit: BoxFit.contain,
                  ),
                ),
              ],
            )
          ],
        ),
      ),
    );
  }
}
