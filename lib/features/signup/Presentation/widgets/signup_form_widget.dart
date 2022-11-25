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

class SignupFormWidget extends StatefulWidget {
  const SignupFormWidget({Key? key}) : super(key: key);

  @override
  State<SignupFormWidget> createState() => _SignupFormWidgetState();
}

class _SignupFormWidgetState extends State<SignupFormWidget> {
  final GlobalKey<FormState> _formkey = GlobalKey<FormState>();
  late String firstname;
  late String lastname;
  late String birthdate_dd;
  late String birthdate_mm;
  late String birthdate_yyyy;
  late String phonenumber;
  Text signinTextWidget() {
    return Text(
      AppLocalizations.of(context)!.translate('signup')!,
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
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            Padding(
                padding: const EdgeInsets.fromLTRB(22, 20, 22, 0),
                child: TextFieldWidget(
                    label: "First Name",
                    keyboardType: TextInputType.text,
                    labelStyle: AppTextStyle.fieldLabel,
                    errorStyle: AppTextStyle.fieldError,
                    borderWidth: AppConstValues.borderWidth,
                    borderColor: AppColors.border,
                    errorBorderColor: AppColors.error,
                    validateType: ValidationTypes.signupFname,
                    secureText: false,
                    onSave: (value) {
                      firstname = value;
                    })),
            SizedBox(
              height: 10,
            ),
            Padding(
                padding: const EdgeInsets.fromLTRB(22, 20, 22, 0),
                child: TextFieldWidget(
                    label: "Last Name",
                    keyboardType: TextInputType.text,
                    labelStyle: AppTextStyle.fieldLabel,
                    errorStyle: AppTextStyle.fieldError,
                    borderWidth: AppConstValues.borderWidth,
                    borderColor: AppColors.border,
                    errorBorderColor: AppColors.error,
                    validateType: ValidationTypes.signupLname,
                    secureText: false,
                    onSave: (value) {
                      lastname = value;
                    })),
            SizedBox(
              height: 10,
            ),
            Padding(
              padding: const EdgeInsets.fromLTRB(22, 20, 22, 0),
              child: Text(
                "Birthday Date",
                style: AppTextStyle.fieldLabel,
              ),
            ),
            Padding(
              padding: const EdgeInsets.fromLTRB(22, 20, 22, 0),
              child: Row(
                children: <Widget>[
                  Container(
                    width: 88,
                    height: 33,
                    child: TextFieldWidget(
                        label: "   DD",
                        keyboardType: TextInputType.number,
                        labelStyle: AppTextStyle.fieldLabel,
                        errorStyle: AppTextStyle.fieldError,
                        borderWidth: AppConstValues.borderWidth,
                        borderColor: AppColors.border,
                        errorBorderColor: AppColors.error,
                        validateType: ValidationTypes.signupLname,
                        secureText: false,
                        onSave: (value) {
                          birthdate_dd = value;
                        }),
                  ),
                  SizedBox(
                    width: 33,
                  ),
                  Container(
                    width: 88,
                    height: 33,
                    child: TextFieldWidget(
                        label: "  MM",
                        keyboardType: TextInputType.number,
                        labelStyle: AppTextStyle.fieldLabel,
                        errorStyle: AppTextStyle.fieldError,
                        borderWidth: AppConstValues.borderWidth,
                        borderColor: AppColors.border,
                        errorBorderColor: AppColors.error,
                        validateType: ValidationTypes.signupLname,
                        secureText: false,
                        onSave: (value) {
                          birthdate_mm = value;
                        }),
                  ),
                  SizedBox(
                    width: 33,
                  ),
                  Container(
                    width: 88,
                    height: 33,
                    child: TextFieldWidget(
                        label: "YYYY",
                        keyboardType: TextInputType.number,
                        labelStyle: AppTextStyle.fieldLabel,
                        errorStyle: AppTextStyle.fieldError,
                        borderWidth: AppConstValues.borderWidth,
                        borderColor: AppColors.border,
                        errorBorderColor: AppColors.error,
                        validateType: ValidationTypes.signupLname,
                        secureText: false,
                        onSave: (value) {
                          birthdate_yyyy = value;
                        }),
                  ),
                ],
              ),
            ),
            SizedBox(
              height: 10,
            ),
            Padding(
                padding: const EdgeInsets.fromLTRB(22, 20, 22, 0),
                child: TextFieldWidget(
                    label: "Phone Number",
                    keyboardType: TextInputType.number,
                    labelStyle: AppTextStyle.fieldLabel,
                    errorStyle: AppTextStyle.fieldError,
                    borderWidth: AppConstValues.borderWidth,
                    borderColor: AppColors.border,
                    errorBorderColor: AppColors.error,
                    validateType: ValidationTypes.signupFname,
                    secureText: false,
                    onSave: (value) {
                      phonenumber = value;
                    })),
            Center(
              child: TextButton(
                onPressed: () {
                  Navigator.pushReplacementNamed(context, Routes.initial);
                },
                child: Text("Have already account ?",
                    style: AppTextStyle.textDecoration),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
