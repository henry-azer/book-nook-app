import 'package:book_nook_app/core/utils/app_text_style.dart';
import 'package:flutter/material.dart';

class LabeledSeeAllButton extends StatefulWidget {
  final String categoryName;
  final String buttonName;

  const LabeledSeeAllButton({
    Key? key,
    required this.categoryName,
    required this.buttonName,
  }) : super(key: key);

  @override
  State<LabeledSeeAllButton> createState() => _LabeledSeeAllButtonState();
}

class _LabeledSeeAllButtonState extends State<LabeledSeeAllButton> {
  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Text(
          widget.categoryName,
          style: AppTextStyle.categoriesSubtitle,
        ),
        TextButton(
            onPressed: () {},
            child: Text(
              widget.buttonName,
              style: AppTextStyle.categoriesTextButton,
            ))
      ],
    );
  }
}
