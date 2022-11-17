import 'package:book_nook_app/core/utils/app_colors.dart';
import 'package:flutter/material.dart';

class TexButton extends StatefulWidget {
  const TexButton({Key? key}) : super(key: key);

  @override
  State<TexButton> createState() => _TexButtonState();
}

class _TexButtonState extends State<TexButton> {
  @override
  Widget build(BuildContext context) {
    return TextButton(
        onPressed: () {},
        child: Text(
          "Create a new account?",
          style: TextStyle(
              color: AppColors.white,
              fontFamily: 'Barlow-Black.ttf',
              fontWeight: FontWeight.normal,
              fontSize: 15 ,
          decoration: TextDecoration.underline),
        ));
  }
}
