import 'package:flutter/material.dart';

import '../../../../core/utils/app_colors.dart';

class CategorieScreen extends StatelessWidget {
  final String text;
  final Color color;
  final TextStyle? textColor;

  const CategorieScreen({
    Key? key,
    required this.text,
    required this.color,
    required this.textColor,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(children: [
      Container(
          height: 40,
          width: 250,
          decoration: BoxDecoration(
            color: AppColors.buttonBackground,
            borderRadius: const BorderRadius.all(Radius.circular(25)),
            border: Border.all(color: AppColors.white, width: 1.5),
          ),
          child: Center(
            child: Text(
              text,
              style: TextStyle(color: AppColors.white),
            ),
          )),
    ]);
  }
}
