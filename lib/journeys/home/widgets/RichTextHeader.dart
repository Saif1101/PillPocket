import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class RichTextHeader extends StatelessWidget {
  final String lightText;
  final String boldText;
  const RichTextHeader({
    required this.lightText,
    required this.boldText,
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return RichText(
      text: TextSpan(
        text: lightText,
        style: GoogleFonts.roboto(color: Colors.black, fontSize: 24),
        children: <TextSpan>[
          TextSpan(
            text: boldText,
            style: GoogleFonts.roboto(
                color: Colors.black, fontWeight: FontWeight.bold, fontSize: 24),
          ),
        ],
      ),
    );
  }
}