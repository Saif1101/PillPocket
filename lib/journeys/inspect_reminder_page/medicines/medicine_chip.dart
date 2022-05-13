import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:prescription_ocr/common/theme_colors.dart';

Widget medicine({
  medicineModel,
  onTap,
  action,
}) {
  return InkWell(
      onTap: onTap,
      child: Stack(
        children: [
          Container(
            padding: EdgeInsets.symmetric(
              vertical: 5.0,
              horizontal: 5.0,
            ),
            child: Container(
              padding: EdgeInsets.symmetric(
                horizontal: 15.0,
                vertical: 10.0,
              ),
              decoration: BoxDecoration(
                color: ThemeColors.primaryGrey,
              ),
              child: Text(
                '${medicineModel.title}',
                style: GoogleFonts.roboto(
                  fontWeight: FontWeight.w300,
                  color: Colors.black,
                  fontSize: 15.0,
                )
              ),
            ),
          ),
          Positioned(
            top: 0,
            bottom: 0,
            right: 0,
            child: CircleAvatar(
              backgroundColor: Colors.black,
              radius: 8.0,
              child: Icon(
                Icons.clear,
                size: 10.0,
                color: Colors.white,
              ),
            ),
          )
        ],
      ));
}