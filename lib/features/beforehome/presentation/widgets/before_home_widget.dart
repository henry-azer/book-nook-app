import 'package:book_nook_app/core/utils/app_text_style.dart';
import 'package:flutter/material.dart';

class BeforeWidget extends StatefulWidget {
  const BeforeWidget({Key? key}) : super(key: key);

  @override
  State<BeforeWidget> createState() => _BeforeWidgetState();
}

class _BeforeWidgetState extends State<BeforeWidget> {
  @override
  Widget build(BuildContext context) {
    return Material(
      color: Colors.transparent,
      child: Column(
        children: [
          Text(
            "Hello,",
            style: AppTextStyle.title,
          ),
          Text(
            "We choose our books specially for you \n                  with all our careness",
            style: AppTextStyle.fieldLabel,
          )
        ],
      ),
    );
  }
}
