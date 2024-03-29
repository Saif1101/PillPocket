import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:prescription_ocr/common/theme_colors.dart';
import 'package:prescription_ocr/data/models/prescription/prescription_model.dart';
import 'package:prescription_ocr/journeys/common_widgets/DateCard.dart';
import 'package:prescription_ocr/journeys/inspect_prescription/inspect_prescription_page.dart';

class PrescriptionCardCondensed extends StatelessWidget {
  final PrescriptionModel prescriptionModel;

  const PrescriptionCardCondensed({
    Key? key,
    required this.prescriptionModel,
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
                      Flexible(
                        child: Text(
                          prescriptionModel.prescriptionTitle!,
                          overflow: TextOverflow.fade,
                          style: GoogleFonts.roboto(
                            fontWeight: FontWeight.bold,
                            color: Colors.black,
                            fontSize: 32,
                          ),
                        ),
                      ),
                      DateCard(
                        dateTime: prescriptionModel.creationDateTime!,
                      ),
                    ],
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.start,
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
                              prescriptionModel.doctorName ?? "NA",
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
                              prescriptionModel.cause ?? "NA",
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
                              prescriptionModel.note ?? "NA",
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
                      context, InspectPrescriptionPage.routeName,
                      arguments: prescriptionModel);
                },
                icon: const Icon(Icons.keyboard_arrow_right)),
          ],
        ),
      ],
    );
  }
}
