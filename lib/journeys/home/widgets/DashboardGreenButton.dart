import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:prescription_ocr/common/theme_colors.dart';

class DashboardGreenButton extends StatelessWidget {
  final String text;
  final IconData icon;
  final VoidCallback onTap;
  const DashboardGreenButton({
    required this.text,
    required this.icon,
    required this.onTap,
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Card(
        shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.all(Radius.circular(15))),
        elevation: 10,
        color: ThemeColors.primaryGreen,
        child: Container(
          padding: EdgeInsets.all(8.0),
          child: SizedBox(
            height: 85,
            width: 85,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                Icon(
                  icon,
                  size: 60,
                  color: Colors.white,
                ),
                SizedBox(
                  height: 5,
                ),
                Text(
                  text,
                  style: GoogleFonts.roboto(
                    color: Colors.white,
                    fontWeight: FontWeight.bold,
                    fontSize: 16,
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}