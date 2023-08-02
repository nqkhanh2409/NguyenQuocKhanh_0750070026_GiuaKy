import 'package:flutter/material.dart';

import '../../../constants.dart';
import 'color_dots.dart';

class ListOfColors extends StatelessWidget {
  const ListOfColors({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return const Padding(
      padding: EdgeInsets.symmetric(vertical: kDefaultPadding),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          ColorDot(fillColor: Color(0xFF80989A), isSelected: true),
          ColorDot(fillColor: Color(0xFFFF5200)),
          ColorDot(fillColor: kPrimaryColor),
        ],
      ),
    );
  }
}