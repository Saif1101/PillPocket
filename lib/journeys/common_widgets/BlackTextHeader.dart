import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class BlackTextHeader extends StatelessWidget {
  final double? fontSize;
  const BlackTextHeader({
    Key? key,
    required this.header,
    this.fontSize,
  }) : super(key: key);

  final String header;

  @override
  Widget build(BuildContext context) {
    return Text(
      header,
      style: GoogleFonts.roboto(
        fontWeight: FontWeight.bold,
        color: Colors.black,
        fontSize: fontSize ?? 20,
      ),
    );
  }
}
