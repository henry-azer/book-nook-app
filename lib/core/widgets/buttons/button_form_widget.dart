import 'package:flutter/material.dart';

import '../../../config/locale/app_localizations.dart';
import '../../utils/app_colors.dart';
import '../../utils/assets_manager.dart';

class ButtonFormWidget extends StatefulWidget {
  final Widget? child;
  final Function onPress;

  const ButtonFormWidget({Key? key, required this.child, required this.onPress})
      : super(key: key);

  @override
  State<ButtonFormWidget> createState() => _ButtonFormWidgetState();
}

class _ButtonFormWidgetState extends State<ButtonFormWidget> {
  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 80,
      child: Stack(
        alignment: Alignment.center,
        children: [
          Positioned(
            top: 3,
            child: SizedBox(
              height: 49,
              width: 340,
              child: ElevatedButton(
                onPressed: () {
                  widget.onPress.call();
                },
                style: ButtonStyle(
                    backgroundColor:
                        MaterialStateProperty.all(AppColors.button),
                    shape: MaterialStateProperty.all<RoundedRectangleBorder>(
                        RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(25.0),
                    ))),
                child: widget.child,
              ),
            ),
          ),
          if (AppLocalizations.of(context)!.isEnLocale) ...[
            Positioned(
              top: -30,
              right: 15,
              child: Image.asset(
                ImgAssets.bookmarkIcon,
                width: 100,
                height: 105,
              ),
            ),
          ] else if (AppLocalizations.of(context)!.isArLocale) ...[
            Positioned(
              top: -30,
              left: 40,
              child: Image.asset(
                ImgAssets.bookmarkIcon,
                width: 100,
                height: 105,
              ),
            ),
          ],
        ],
      ),
    );
  }
}
