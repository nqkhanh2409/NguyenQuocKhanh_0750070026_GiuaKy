import 'package:flutter/material.dart';

import '../../../constants.dart';

class ColorDot extends StatelessWidget {
  const ColorDot({
    super.key,
    required this.fillColor,
    this.isSelected = false,
  });
  final Color fillColor;
  final bool isSelected;

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.symmetric(horizontal: kDefaultPadding / 2.5),
      padding: const EdgeInsets.all(3),
      width: 24,
      height: 24,
      decoration: BoxDecoration(
          shape: BoxShape.circle,
          border: Border.all(
              color:
                  isSelected ? const Color(0xFF707070) : Colors.transparent)),
      child: Container(
        decoration: BoxDecoration(shape: BoxShape.circle, color: fillColor),
      ),
    );
  }
}