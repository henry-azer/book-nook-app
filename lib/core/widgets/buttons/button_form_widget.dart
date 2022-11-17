import 'package:book_nook_app/core/utils/assets_manager.dart';
import 'package:flutter/material.dart';

import '../../utils/app_colors.dart';

class ButtonFormWidget extends StatefulWidget {
  const ButtonFormWidget({Key? key}) : super(key: key);

  @override
  State<ButtonFormWidget> createState() => _ButtonFormWidgetState();
}

class _ButtonFormWidgetState extends State<ButtonFormWidget> {
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
                  onPressed: () {},
                  style: ButtonStyle(
                      backgroundColor:
                          MaterialStateProperty.all(AppColors.button),
                      shape: MaterialStateProperty.all<RoundedRectangleBorder>(
                          RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(25.0),
                      ))),
                  child: Text(
                    "Sign in",
                    style: Theme.of(context).textTheme.bodyMedium,
                  )),
            ),
          ),
          Positioned(
            top: -30,
            right: 15,
            child: AnimatedContainer(
              duration: const Duration(milliseconds: 500),
              child: Image.asset(
                ImgAssets.bookmarkIcon,
                width: 100,
                height: 105,
              ),
            ),
          ),
        ],
      ),
    );
  }
}
