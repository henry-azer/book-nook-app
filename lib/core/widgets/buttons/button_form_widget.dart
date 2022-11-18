import 'package:book_nook_app/core/utils/assets_manager.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../config/locale/app_localizations.dart';
import '../../../features/splash/presentation/cubit/locale_cubit.dart';
import '../../utils/app_colors.dart';

class ButtonFormWidget extends StatefulWidget {
  final String text;
  final TextStyle? textStyle;

  const ButtonFormWidget(
      {Key? key, required this.text, required this.textStyle})
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
              width: 355,
              child: ElevatedButton(
                  onPressed: () {
                    if (AppLocalizations.of(context)!.isEnLocale) {
                      BlocProvider.of<LocaleCubit>(context).toArabic();
                    } else if (AppLocalizations.of(context)!.isArLocale) {
                      BlocProvider.of<LocaleCubit>(context).toEnglish();
                    }
                  },
                  style: ButtonStyle(
                      backgroundColor:
                          MaterialStateProperty.all(AppColors.button),
                      shape: MaterialStateProperty.all<RoundedRectangleBorder>(
                          RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(25.0),
                      ))),
                  child: Text(
                    widget.text,
                    style: widget.textStyle,
                  )),
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
