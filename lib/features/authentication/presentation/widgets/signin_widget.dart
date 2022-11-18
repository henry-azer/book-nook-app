import 'package:book_nook_app/config/locale/app_localizations.dart';
import 'package:flutter/material.dart';

import '../../../../core/utils/app_text_style.dart';
import '../../../../core/widgets/logo_widget.dart';

class SigninWidget extends StatefulWidget {
  const SigninWidget({Key? key}) : super(key: key);

  @override
  State<SigninWidget> createState() => _SigninWidgetState();
}

class _SigninWidgetState extends State<SigninWidget> {
  @override
  Widget build(BuildContext context) {
    return Center(
      child: Column(
        children: [
          Padding(
            padding: const EdgeInsets.symmetric(vertical: 65, horizontal: 0),
            child: Column(
              children: [
                const LogoWidget(width: 220, height: 220),
                Text(
                  AppLocalizations.of(context)!.translate('signin')!,
                  style: AppTextStyle.title,
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
