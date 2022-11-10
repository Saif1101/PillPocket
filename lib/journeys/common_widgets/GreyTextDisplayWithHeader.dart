import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:prescription_ocr/common/theme_colors.dart';
import 'package:prescription_ocr/journeys/common_widgets/BlackTextHeader.dart';

class GreyTextDisplayWithHeader extends StatelessWidget {
  final String header;
  final String displayText;
  final double? headerSize;
  final double? textSize;
  const GreyTextDisplayWithHeader({
    required this.header,
    required this.displayText,
    Key? key,
    this.headerSize,
    this.textSize,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        BlackTextHeader(
          header: header,
          fontSize: headerSize,
        ),
        SizedBox(
          height: 5,
        ),
        Container(
          padding: EdgeInsets.symmetric(horizontal: 12.0, vertical: 8.0),
          decoration: BoxDecoration(
            color: ThemeColors.primaryGrey,
          ),
          child: Text(
            displayText,
            style: GoogleFonts.roboto(
              fontWeight: FontWeight.w500,
              color: Colors.black,
              fontSize: textSize ?? 16,
            ),
          ),
        )
      ],
    );
  }
}
