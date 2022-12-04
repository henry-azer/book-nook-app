import 'package:book_nook_app/features/signin/presentation/widgets/signin_form_widget.dart';
import 'package:flutter/material.dart';

import '../../../../config/locale/app_localizations.dart';
import '../../../../config/routes/app_routes.dart';
import '../../../../core/utils/app_text_style.dart';
import '../../../../core/widgets/logo_widget.dart';

class SigninScreen extends StatefulWidget {
  const SigninScreen({Key? key}) : super(key: key);

  @override
  State<SigninScreen> createState() => _SigninScreenState();
}

class _SigninScreenState extends State<SigninScreen> {
  @override
  Widget build(BuildContext context) {
    return Material(
        child: Scaffold(
      body: SingleChildScrollView(
        child: Column(
          children: [
            Center(
              child: Column(
                children: [
                  Padding(
                    padding: const EdgeInsets.only(top: 65, bottom: 40),
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
            ),
            const SigninFormWidget(),
            Padding(
                padding: const EdgeInsets.only(top: 30),
                child: TextButton(
                  onPressed: () {
                    Navigator.pushReplacementNamed(context, Routes.signupUserInfo);
                  },
                  child: Text(
                      AppLocalizations.of(context)!.translate('create_new_account')!,
                      style: AppTextStyle.textDecoration),
                )),
          ],
        ),
      ),
    ));
  }
}
