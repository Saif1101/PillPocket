import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:prescription_ocr/common/theme_colors.dart';

class MealCombinationButton extends StatefulWidget {
  final bool isSelected;
  final String label;
  final Function(bool value, String label) onTap;  

  const MealCombinationButton({Key? key, required this.isSelected, required this.label, required this.onTap}) : super(key: key);

  @override
  State<MealCombinationButton> createState() => _MealCombinationButtonState();
}

class _MealCombinationButtonState extends State<MealCombinationButton> {
  @override
  Widget build(BuildContext context) {
    return Material(
                    elevation: 10,
                    color: widget.isSelected
                        ? Color.fromARGB(255, 177, 242, 217)
                        : ThemeColors.deepGrey,
                    child: GestureDetector(
                      onTap: ()=>widget.onTap(widget.isSelected,widget.label),
                      child: Container(
                        alignment: Alignment.center,
                        padding:
                            EdgeInsets.symmetric(horizontal: 8, vertical: 12),
                        child: SvgPicture.asset(
                          'assets/pill_${widget.label}_meal_gb.svg',
                          fit: BoxFit.contain,
                        ),
                      ),
                    ),
                  );
  }
}