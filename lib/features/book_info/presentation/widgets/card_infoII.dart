import 'package:book_nook_app/core/utils/app_colors.dart';
import 'package:book_nook_app/core/utils/app_text_style.dart';
import 'package:flutter/material.dart';

class InfoCardII extends StatefulWidget {
  final String text;
  final String value;
  InfoCardII({
    Key? key,
    required this.text,
    required this.value,
  }) : super(key: key);

  @override
  State<InfoCardII> createState() => _InfoCardIIState();
}

class _InfoCardIIState extends State<InfoCardII> {
  @override
  Widget build(BuildContext context) {
    return Center(
      child: Container(
        padding: const EdgeInsets.all(8.0),
        height: 60,
        width: 110,
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            Text(
              widget.text,
              style: AppTextStyle.cardinfo,
            ),
            SizedBox(
              height: 10,
            ),
            Text(
              widget.value,
              style: AppTextStyle.button,
            ),
          ],
        ),
        decoration: BoxDecoration(
          color: AppColors.card,
          borderRadius: BorderRadiusDirectional.circular(20),
        ),
      ),
    );
  }
}
