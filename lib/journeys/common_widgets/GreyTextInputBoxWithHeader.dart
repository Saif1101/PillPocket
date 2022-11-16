import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:prescription_ocr/common/theme_colors.dart';
import 'package:prescription_ocr/journeys/common_widgets/BlackTextHeader.dart';

class GreyTextInputBoxWithHeader extends StatelessWidget {
  final TextEditingController controller; 
  final String header;
  
  final String? hintText; 
  final double? headerSize;
  final double? textSize;

  const GreyTextInputBoxWithHeader({
    this.hintText,
    required this.header,
    required this.controller, 
    
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
        IntrinsicWidth(
          child: Container(
            margin: const EdgeInsets.only(right: 12.0,) ,
            padding: const EdgeInsets.symmetric(horizontal: 12.0, vertical: 8.0),
            decoration: const BoxDecoration(
              color: ThemeColors.primaryGrey,
            ),
            child: TextField(
            
              controller: controller,
              decoration:  InputDecoration(
                hintText: hintText ,
                        border: InputBorder.none,
                        focusedBorder: InputBorder.none,
                        enabledBorder: InputBorder.none,
                        errorBorder: InputBorder.none,
                        disabledBorder: InputBorder.none,
                      ),
                  autofocus: false,
                  minLines: 1,
           maxLines: 3,
              style: GoogleFonts.roboto(
                fontWeight: FontWeight.w500,
                color: Colors.black,
                fontSize: textSize ?? 16,
              ),
            ),
          ),
        )
      ],
    );
  }
}