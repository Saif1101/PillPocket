import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:prescription_ocr/common/theme_colors.dart';
import 'package:prescription_ocr/journeys/common_widgets/DateCard.dart';
import 'package:prescription_ocr/journeys/inspect_prescription/inspect_prescription_page.dart';

class PrescriptionCardCondensed extends StatelessWidget {
  const PrescriptionCardCondensed({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
      children: [
        Expanded(
          child: Container(
            decoration: BoxDecoration(
                color: ThemeColors.deepGrey,
                borderRadius: BorderRadius.only(
                    topRight: Radius.circular(10),
                    bottomRight: Radius.circular(10))),
            child: Padding(
              padding:
                  const EdgeInsets.symmetric(horizontal: 16.0, vertical: 12.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(
                        'Prescription#A',
                        style: GoogleFonts.roboto(
                          fontWeight: FontWeight.bold,
                          color: Colors.black,
                          fontSize: 32,
                        ),
                      ),
                      DateCard(),
                    ],
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceAround,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      Flexible(
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.start,
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              'Doctor',
                              style: GoogleFonts.roboto(
                                fontWeight: FontWeight.bold,
                                color: Colors.black,
                                fontSize: 18,
                              ),
                            ),
                            Text(
                              'Dr. Lorem Ipsum',
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
                              'Cause',
                              style: GoogleFonts.roboto(
                                fontWeight: FontWeight.bold,
                                color: Colors.black,
                                fontSize: 18,
                              ),
                            ),
                            Text(
                              'Stomach Distress',
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
                              'Notes',
                              style: GoogleFonts.roboto(
                                fontWeight: FontWeight.bold,
                                color: Colors.black,
                                fontSize: 18,
                              ),
                            ),
                            Text(
                              "Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam,"
                              "quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo consequat. Duis aute irure dolor in reprehenderit"
                              "in voluptate velit esse cillum dolore eu fugiat nulla pariatur. Excepteur sint occaecat cupidatat non proident, sunt in culpa qui officia deserunt mollit anim id est laborum.",
                              overflow: TextOverflow.ellipsis,
                              maxLines: 3,
                              style: GoogleFonts.roboto(
                                fontWeight: FontWeight.w300,
                                color: Colors.black,
                                fontSize: 14,
                              ),
                            ),
                          ],
                        ),
                      ),
                    ],
                  )
                ],
              ),
            ),
          ),
        ),
        Column(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            IconButton(
                onPressed: () {
                  Navigator.pushNamed(
                      context, InspectPrescriptionPage.routeName);
                },
                icon: Icon(Icons.keyboard_arrow_right)),
          ],
        ),
      ],
    );
  }
}
