import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:prescription_ocr/common/theme_colors.dart';

class GreenWhitePageHeader extends StatelessWidget {
  final String text;
  const GreenWhitePageHeader({
    required this.text,
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      color: ThemeColors.primaryGreen,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.start,
        children: [
          Padding(
            padding: const EdgeInsets.symmetric(vertical: 14.0, horizontal: 18),
            child: Text(
              text,
              style: GoogleFonts.roboto(
                fontWeight: FontWeight.bold,
                color: Colors.white,
                fontSize: 24,
              ),
            ),
          ),
        ],
      ),
    );
  }
}
