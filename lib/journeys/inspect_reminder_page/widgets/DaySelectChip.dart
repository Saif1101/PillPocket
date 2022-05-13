import 'package:flutter/material.dart';
import 'package:prescription_ocr/common/theme_colors.dart';

class DaySelectChip extends StatelessWidget {
  final Function(bool value, String day) onTap;
  final String day; 
  final bool isSelected;
  
  const DaySelectChip({ Key? key, required this.onTap, required this.day, required this.isSelected }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return FilterChip(
                      label: Text(day),
                      selected: isSelected,
                      onSelected: (value)=>onTap(value, day),
                      pressElevation: 15,
                      selectedColor: ThemeColors.primaryGreen,
                      backgroundColor: ThemeColors.primaryGrey,
    );
  }
}