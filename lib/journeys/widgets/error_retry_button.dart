import 'package:flutter/material.dart';
import 'package:prescription_ocr/common/theme_colors.dart';

class ErrorButton extends StatelessWidget {
  final String? buttonText; 
  final VoidCallback? function; 
  const ErrorButton({Key? key, required this.buttonText, required this.function}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
            child: Text(buttonText??'Error'),
            onPressed: function?? (){},
            style: ElevatedButton.styleFrom(
                backgroundColor: ThemeColors.primaryGreen,
                padding: EdgeInsets.symmetric(horizontal: 10, vertical: 10),
                textStyle: TextStyle(
                color: Colors.white,
                fontSize: 10,
                fontWeight: FontWeight.bold)),
);
  }
}