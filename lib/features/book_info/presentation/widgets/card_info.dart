import 'package:book_nook_app/core/utils/app_colors.dart';
import 'package:book_nook_app/core/utils/app_text_style.dart';
import 'package:flutter/material.dart';

class InfoCard extends StatefulWidget {
  final Icon icons;
  final String text;
  final String value;

  InfoCard({
    Key? key,
    required this.icons,
    required this.text,
    required this.value,
  }) : super(key: key);

  @override
  State<InfoCard> createState() => _InfoCardState();
}

class _InfoCardState extends State<InfoCard> {
  @override
  Widget build(BuildContext context) {
    return Center(
      child: Container(
        padding: const EdgeInsets.all(8.0),
        height: 60,
        width: 110,
        child: Row(
          children: [
            Icon(
              widget.icons.icon,
              color: AppColors.gold,
            ),
            SizedBox(width: 20,),
            Column(
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
                  style: AppTextStyle.cardvalue,
                ),
              ],
            ),
          ],
        ),
        decoration: BoxDecoration(
          color: AppColors.circlePrimary.withOpacity(0.3),
          borderRadius: BorderRadiusDirectional.circular(20),
        ),
      ),
    );
  }
}
