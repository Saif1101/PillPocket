import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:photo_view/photo_view.dart';
import 'package:prescription_ocr/common/utils/screen_utils.dart';
import 'package:prescription_ocr/common/theme_colors.dart';
import 'package:prescription_ocr/data/models/prescription/prescription_model.dart';
import 'package:prescription_ocr/journeys/add_prescription/add_prescription_page.dart';
import 'package:prescription_ocr/journeys/common_widgets/BlackTextHeader.dart';
import 'package:prescription_ocr/journeys/common_widgets/DateCard.dart';
import 'package:prescription_ocr/journeys/edit_prescription/edit_prescription.dart';
import 'package:prescription_ocr/journeys/history/history_page.dart';
import 'package:prescription_ocr/journeys/profile/profile_page.dart';

class InspectPrescriptionPage extends StatelessWidget {
  final PrescriptionModel prescriptionModel;
  const InspectPrescriptionPage({Key? key, required this.prescriptionModel})
      : super(key: key);

  static const String routeName = '/inspect-prescription';

  static Route route(PrescriptionModel args) {
    return MaterialPageRoute(
        settings: RouteSettings(name: routeName),
        builder: (_) => InspectPrescriptionPage(
              prescriptionModel: args,
            ));
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
        child: Scaffold(
            appBar: AppBar(
              backgroundColor: ThemeColors.primaryGreen,
              elevation: 0,
              actions: [
                IconButton(
                    onPressed: () {
                      Navigator.pushNamed(
                          context, EditPrescriptionPage.routeName);
                    },
                    icon: Icon(
                      Icons.edit,
                      color: Colors.white,
                    )),
                IconButton(
                    onPressed: () {
                      print('Delete button pressed');
                    },
                    icon: Icon(
                      Icons.delete,
                      color: Colors.white,
                    )),
              ],
            ),
            backgroundColor: ThemeColors.primaryGreen,
            body: Container(
              decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.only(
                      topLeft: Radius.circular(10),
                      topRight: Radius.circular(10))),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Text(
                      prescriptionModel.prescriptionTitle!,
                      style: GoogleFonts.roboto(
                        fontWeight: FontWeight.bold,
                        color: Colors.black,
                        fontSize: 32,
                      ),
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.start,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          'Doctor',
                          style: GoogleFonts.roboto(
                            fontWeight: FontWeight.bold,
                            color: Colors.black,
                            fontSize: 24,
                          ),
                        ),
                        Text(
                          prescriptionModel.doctorName ?? "NA",
                          style: GoogleFonts.roboto(
                            fontWeight: FontWeight.w300,
                            color: Colors.black,
                            fontSize: 18,
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
                            fontSize: 24,
                          ),
                        ),
                        Text(
                          prescriptionModel.cause ?? "NA",
                          style: GoogleFonts.roboto(
                            fontWeight: FontWeight.w300,
                            color: Colors.black,
                            fontSize: 18,
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
                            fontSize: 24,
                          ),
                        ),
                        Text(
                          prescriptionModel.note ?? "NA",
                          overflow: TextOverflow.ellipsis,
                          maxLines: 3,
                          style: GoogleFonts.roboto(
                            fontWeight: FontWeight.w300,
                            color: Colors.black,
                            fontSize: 18,
                          ),
                        ),
                      ],
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Row(
                      children: [
                        BlackTextHeader(header: 'Reminder Time(s)'),
                        IconButton(
                            onPressed: () {
                              'Redirect to edit reminders';
                            },
                            icon: Icon(
                              Icons.edit,
                              color: Colors.black,
                            ))
                      ],
                    ),
                  ),
                  Align(
                    alignment: Alignment.centerLeft,
                    child: Padding(
                      padding: const EdgeInsets.only(
                        top: 2.0,
                        left: 16.0,
                      ),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            'Reminder1',
                            style: GoogleFonts.roboto(
                              fontWeight: FontWeight.w500,
                              color: Colors.black,
                              fontSize: 16,
                            ),
                          ),
                          SizedBox(
                            height: 5,
                          ),
                          Text(
                            'Reminder2',
                            style: GoogleFonts.roboto(
                              fontWeight: FontWeight.w500,
                              color: Colors.black,
                              fontSize: 16,
                            ),
                          ),
                          SizedBox(
                            height: 5,
                          ),
                          Text(
                            'Reminder3',
                            style: GoogleFonts.roboto(
                              fontWeight: FontWeight.w500,
                              color: Colors.black,
                              fontSize: 16,
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                  SizedBox(
                    height: 5,
                  ),
                  Align(
                    alignment: Alignment.center,
                    child: Text(
                      'Prescription',
                      style: GoogleFonts.roboto(
                        fontWeight: FontWeight.w800,
                        color: Colors.black,
                        fontSize: 18,
                      ),
                    ),
                  ),
                  Divider(
                    color: Colors.black,
                    thickness: 1.0,
                  ),
                  Expanded(
                    child: prescriptionModel.prescriptionPhotoUrl != null
                        ? PhotoView(
                            imageProvider: NetworkImage(
                                prescriptionModel.prescriptionPhotoUrl!),
                          )
                        : const Center(
                            child: Text(
                                'This does not have a prescription image attached to it.'),
                          ),
                  ),
                ],
              ),
            )));
  }
}
