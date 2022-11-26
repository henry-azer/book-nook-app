import 'package:book_nook_app/core/utils/app_text_style.dart';
import 'package:flutter/material.dart';

import '../../../../core/utils/app_colors.dart';

class CardScreen extends StatelessWidget {
  final String text;
  final Color color;
  final TextStyle? textColor;

  const CardScreen({
    Key? key,
    required this.text,
    required this.color,
    required this.textColor,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(crossAxisAlignment: CrossAxisAlignment.center, children: [
      ElevatedButton(
        onPressed: () {
          ElevatedButton.styleFrom(
            backgroundColor: AppColors.white,
            textStyle: TextStyle(color: AppColors.fontSecondary),
            side: BorderSide(
              width: 2,
              color: AppColors.white,
            ),
            shape: RoundedRectangleBorder(
              side: BorderSide(
                color: AppColors.white,
              ),
              borderRadius: BorderRadius.circular(30.0),
            ),
          );
        },
        style: ElevatedButton.styleFrom(
          backgroundColor: AppColors.buttonBackground,
          side: BorderSide(
            width: 2,
            color: AppColors.white,
          ),
          shape: RoundedRectangleBorder(
            side: BorderSide(
              color: AppColors.white,
            ),
            borderRadius: BorderRadius.circular(30.0),
          ),
        ),
        child: Container(
          decoration: BoxDecoration(color: color),
          padding:
              const EdgeInsets.only(top: 20, bottom: 20, left: 40, right: 40),
          child: Text(text, style: textColor),
        ),
      ),
    ]);
  }
}
