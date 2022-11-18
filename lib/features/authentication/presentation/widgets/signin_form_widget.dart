import 'package:book_nook_app/core/utils/app_colors.dart';
import 'package:book_nook_app/core/utils/app_text_style.dart';
import 'package:book_nook_app/core/utils/app_values.dart';
import 'package:book_nook_app/core/validation/validation_types.dart';
import 'package:book_nook_app/core/widgets/forms/text_field_widget.dart';
import 'package:flutter/material.dart';

import '../../../../config/locale/app_localizations.dart';
import '../../../../config/routes/app_routes.dart';
import '../../../../core/widgets/buttons/button_form_widget.dart';

class SigninFormWidget extends StatefulWidget {
  const SigninFormWidget({Key? key}) : super(key: key);

  @override
  State<SigninFormWidget> createState() => _SigninFormWidgetState();
}

class _SigninFormWidgetState extends State<SigninFormWidget> {
  GlobalKey<FormState> formkey = GlobalKey<FormState>();

  String? validatePassword(String value) {
    if (value.isEmpty) {
      return "* Required";
    } else if (value.length < 6) {
      return "Password should be at least 8 characters";
    } else {
      return null;
    }
  }

  @override
  Widget build(BuildContext context) {
    return Material(
      color: Colors.transparent,
      child: Form(
        autovalidateMode: AutovalidateMode.onUserInteraction,
        key: formkey,
        child: Column(
          children: <Widget>[
            Padding(
                padding: const EdgeInsets.fromLTRB(22, 10, 22, 0),
                child: TextFieldWidget(
                  label: AppLocalizations.of(context)!.translate('email')!,
                  keyboardType: TextInputType.emailAddress,
                  labelStyle: AppTextStyle.fieldLabel,
                  errorStyle: AppTextStyle.fieldError,
                  borderWidth: AppConstValues.borderWidth,
                  borderColor: AppColors.border,
                  errorBorderColor: AppColors.error,
                  validateType: ValidationTypes.signinEmail,
                  secureText: false,
                )),
            Padding(
                padding: const EdgeInsets.fromLTRB(22, 25, 22, 0),
                child: TextFieldWidget(
                  label: AppLocalizations.of(context)!.translate('password')!,
                  keyboardType: TextInputType.visiblePassword,
                  labelStyle: AppTextStyle.fieldLabel,
                  errorStyle: AppTextStyle.fieldError,
                  borderWidth: AppConstValues.borderWidth,
                  borderColor: AppColors.border,
                  errorBorderColor: AppColors.error,
                  validateType: ValidationTypes.signinPassword,
                  secureText: true,
                )),
            Padding(
                padding: const EdgeInsets.only(top: 65),
                child: ButtonFormWidget(
                  text: AppLocalizations.of(context)!.translate('signin')!,
                  textStyle: AppTextStyle.button,
                )),
            Padding(
                padding: const EdgeInsets.only(top: 40),
                child: TextButton(
                  onPressed: () {
                    Navigator.pushReplacementNamed(context, Routes.initial);
                  },
                  child: Text(
                      AppLocalizations.of(context)!
                          .translate('create_new_account')!,
                      style: AppTextStyle.textDecoration),
                )),
          ],
        ),
      ),
    );
  }
}
