import 'package:book_nook_app/config/locale/app_localizations.dart';
import 'package:flutter/material.dart';

import '../../../../core/utils/app_text_style.dart';
import '../../../../core/widgets/logo_widget.dart';
class SignupWidget extends StatefulWidget {
  const SignupWidget({Key? key}) : super(key: key);

  @override
  State<SignupWidget> createState() => _SignupWidgetState();
}

class _SignupWidgetState extends State<SignupWidget> {
  @override
  Widget build(BuildContext context) {
    return Center(
      child: Column(
        children: [
          Padding(
            padding: const EdgeInsets.only(top: 65, bottom: 40),
            child: Column(
              children: [
                const LogoWidget(width: 220, height: 220),
                Text(
                  //AppLocalizations.of(context)!.translate('signup')!,
                  "Sign up",
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
