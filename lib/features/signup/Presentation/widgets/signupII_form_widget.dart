import 'package:book_nook_app/core/utils/app_colors.dart';
import 'package:book_nook_app/core/utils/app_text_style.dart';
import 'package:book_nook_app/core/utils/app_values.dart';
import 'package:book_nook_app/core/validation/validation_types.dart';
import 'package:book_nook_app/core/widgets/forms/text_field_widget.dart';
import 'package:book_nook_app/features/authentication/presentation/cubit/signin_cubit.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:loading_animation_widget/loading_animation_widget.dart';
import '../../../../config/locale/app_localizations.dart';
import '../../../../config/routes/app_routes.dart';
import '../../../../core/utils/app_strings.dart';
import '../../../../core/utils/constants.dart';
import '../../../../core/widgets/buttons/button_form_widget.dart';

class SignupFormIIWidget extends StatefulWidget {
  String? firstName;
  String? secondName;
  String? birthdayDd;
  String? birthdayMm;
  String? birthdayYyyy;
  String? phoneNumber;

  SignupFormIIWidget([
    this.firstName,
    this.secondName,
    this.birthdayDd,
    this.birthdayMm,
    this.birthdayYyyy,
    this.phoneNumber,
  ]);
  @override
  State<SignupFormIIWidget> createState() => _SignupFormIIWidgetState();
}

class _SignupFormIIWidgetState extends State<SignupFormIIWidget> {
  final GlobalKey<FormState> _formkey = GlobalKey<FormState>();
  late String email;
  late String password;
  late String confirmpassword;

  Text signinTextWidget() {
    return Text(
      "sign up",
      style: AppTextStyle.button,
    );
  }

  @override
  Widget build(BuildContext context) {
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
                    secureText: false,
                    onSave: (value) {
                      email = value;
                    })),
            SizedBox(
              height: 20,
            ),
            Padding(
                padding: const EdgeInsets.fromLTRB(22, 20, 22, 0),
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
                    onSave: (value) {
                      password = value;
                    })),
            SizedBox(
              height: 20,
            ),
            Padding(
                padding: const EdgeInsets.fromLTRB(22, 20, 22, 0),
                child: TextFieldWidget(
                    label: "Confirm Password",
                    keyboardType: TextInputType.visiblePassword,
                    labelStyle: AppTextStyle.fieldLabel,
                    errorStyle: AppTextStyle.fieldError,
                    borderWidth: AppConstValues.borderWidth,
                    borderColor: AppColors.border,
                    errorBorderColor: AppColors.error,
                    validateType: ValidationTypes.signinPassword,
                    secureText: true,
                    onSave: (value) {
                      confirmpassword = value;
                    })),
            SizedBox(
              height: 20,
            ),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: ButtonFormWidget(
                  child: Text(
                    "Sign up",
                    style: AppTextStyle.button,
                  ),
                  onPress: () {
                    if (_formkey.currentState!.validate()) {
                      _formkey.currentState?.save();
                      if (email.isEmpty) {
                        Constants.showErrorDialog(
                            context: context,
                            message: AppStrings.emptyEmailError);
                        return;
                      }
                      if (password.isEmpty) {
                        Constants.showErrorDialog(
                            context: context,
                            message: AppStrings.emptyPasswordError);
                        return;
                      }
                      if (confirmpassword.isEmpty) {
                        Constants.showErrorDialog(
                            context: context, message: AppStrings.required);
                        return;
                      }
                      print(email);
                      print(password);
                      print(confirmpassword);
                      Navigator.pushReplacementNamed(
                          context, Routes.beforehomepage);
                    }
                  }),
            ),
          ],
        ),
      ),
    );
  }
}
