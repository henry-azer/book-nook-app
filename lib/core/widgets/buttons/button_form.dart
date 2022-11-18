import 'package:book_nook_app/core/utils/app_colors.dart';
import 'package:book_nook_app/core/utils/assets_manager.dart';

import 'package:flutter/material.dart';

class ButtonForm extends StatefulWidget {
  const ButtonForm({Key? key}) : super(key: key);

  @override
  State<ButtonForm> createState() => _ButtonFormState();
}

class _ButtonFormState extends State<ButtonForm> {
  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 80,
      child: Stack(
        children: [
          Positioned(
            top: 3,
            child: SizedBox(
              height: 48,
              width: 355,
              child: ElevatedButton(
                style: ButtonStyle(
                    backgroundColor:
                        MaterialStateProperty.all(AppColors.textFormBorder),
                    shape: MaterialStateProperty.all<RoundedRectangleBorder>(
                        RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(29.0),
                    ))),
                onPressed: () {},
                child: Text("Sign in",
                    style: TextStyle(
                        fontSize: 25,
                        fontWeight: FontWeight.w500,
                        fontFamily: 'Barlow-Black.ttf')),
              ),
            ),
          ),
          Positioned(
            top: -30,
            right: 15,
            child: AnimatedContainer(
              duration: const Duration(milliseconds: 500),
              child: Image.asset(
                ImgAssets.subtract,
                width: 110,
                height: 145,
              ),
            ),
          ),
        ],
      ),
    );
  }
}
