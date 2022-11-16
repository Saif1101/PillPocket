import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:prescription_ocr/common/theme_colors.dart';

class GRBWGColorSwitchButton extends StatelessWidget {
  final String text;
  final FontWeight fontWeight;
  final double fontSize;
  final bool isSelected;

  const GRBWGColorSwitchButton({
    required this.isSelected,
    required this.text,
    Key? key,
    required this.fontWeight,
    required this.fontSize,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 18, vertical: 4.0),
      decoration: BoxDecoration(
          color:
              isSelected ? ThemeColors.primaryGreen : ThemeColors.primaryGrey,
          borderRadius: const BorderRadius.all(Radius.circular(55))),
      child: Text(
        text,
        style: GoogleFonts.roboto(
          fontWeight: fontWeight,
          color: isSelected ? Colors.white : Colors.black,
          fontSize: fontSize,
        ),
      ),
    );
  }
}