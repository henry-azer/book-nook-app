// ignore_for_file: file_names
import 'package:book_nook_app/core/utils/app_colors.dart';
import 'package:book_nook_app/core/utils/app_text_style.dart';
import 'package:book_nook_app/core/utils/app_values.dart';
import 'package:book_nook_app/core/validation/validation_types.dart';
import 'package:book_nook_app/core/widgets/forms/text_field_widget.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import '../../../../config/locale/app_localizations.dart';
import '../../../../core/utils/constants.dart';
import '../../../../core/widgets/buttons/button_form_widget.dart';

class SignupFormIIWidget extends StatefulWidget {

  const SignupFormIIWidget({super.key});

  @override
  State<SignupFormIIWidget> createState() => _SignupFormIIWidgetState();
}

class _SignupFormIIWidgetState extends State<SignupFormIIWidget> {
  final GlobalKey<FormState> _formkey = GlobalKey<FormState>();
  late String email;
  late String password;
  late String confirmPassword;

  @override
  Widget build(BuildContext context) {
    var formData = ModalRoute.of(context)!.settings.arguments as Map;
     print(formData);

    return Material(
      color: Colors.transparent,
      child: Form(
        autovalidateMode: AutovalidateMode.onUserInteraction,
        key: _formkey,
        child: Column(
          children: <Widget>[
            Padding(
                padding: const EdgeInsets.fromLTRB(22, 20, 22, 0),
                child: TextFieldWidget(
                    label: AppLocalizations.of(context)!.translate('email')!,
                    keyboardType: TextInputType.emailAddress,
                    labelStyle: AppTextStyle.fieldLabel,
                    errorStyle: AppTextStyle.fieldError,
                    borderWidth: AppConstValues.borderWidth,
                    borderColor: AppColors.border,
                    errorBorderColor: AppColors.error,
                    validateType: ValidationTypes.signinEmail,
                    textAlign: TextAlign.start,
                    secureText: false,
                    onSave: (value) {
                      email = value;
                    })),
            Padding(
                padding: const EdgeInsets.fromLTRB(22, 35, 22, 0),
                child: TextFieldWidget(
                    label: AppLocalizations.of(context)!.translate('password')!,
                    keyboardType: TextInputType.visiblePassword,
                    labelStyle: AppTextStyle.fieldLabel,
                    errorStyle: AppTextStyle.fieldError,
                    borderWidth: AppConstValues.borderWidth,
                    borderColor: AppColors.border,
                    errorBorderColor: AppColors.error,
                    validateType: ValidationTypes.signinPassword,
                    textAlign: TextAlign.start,
                    secureText: true,
                    onSave: (value) {
                      password = value;
                    })),
            Padding(
                padding: const EdgeInsets.fromLTRB(22, 35, 22, 0),
                child: TextFieldWidget(
                    label: AppLocalizations.of(context)!.translate('confirm_password')!,
                    keyboardType: TextInputType.visiblePassword,
                    labelStyle: AppTextStyle.fieldLabel,
                    errorStyle: AppTextStyle.fieldError,
                    borderWidth: AppConstValues.borderWidth,
                    borderColor: AppColors.border,
                    errorBorderColor: AppColors.error,
                    validateType: ValidationTypes.signinPassword,
                    textAlign: TextAlign.start,
                    secureText: true,
                    onSave: (value) {
                      confirmPassword = value;
                    })),
            Padding(
              padding: const EdgeInsets.only(top: 80),
              child: ButtonFormWidget(
                  child: Text(AppLocalizations.of(context)!.translate('signup')!,
                    style: AppTextStyle.button,
                  ),
                  onPress: () {
                    if (_formkey.currentState!.validate()) {
                      _formkey.currentState?.save();
                      if (email.isEmpty) {
                        Constants.showErrorDialog(context: context, message: AppLocalizations.of(context)!.translate('blank_email')!);
                        return;
                      }
                      if (password.isEmpty) {
                        Constants.showErrorDialog(context: context, message: AppLocalizations.of(context)!.translate('blank_password')!);
                        return;
                      }
                      if (confirmPassword.isEmpty) {
                        Constants.showErrorDialog(context: context, message: AppLocalizations.of(context)!.translate('blank_confirm_password')!);
                        return;
                      }
                      if (password.compareTo(confirmPassword).isOdd) {
                        Constants.showErrorDialog(context: context, message: AppLocalizations.of(context)!.translate('passwords_mismatch')!);
                        return;
                      }
                      if (kDebugMode) {
                        print(email);
                        print(confirmPassword);
                        print(password);
                      }
                      // print(formData);
                      // Navigator.pushReplacementNamed(context, Routes.beforehomepage);
                    }
                  }),
            ),
          ],
        ),
      ),
    );
  }
}
