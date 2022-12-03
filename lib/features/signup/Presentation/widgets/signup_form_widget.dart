import 'package:book_nook_app/core/utils/app_colors.dart';
import 'package:book_nook_app/core/utils/app_text_style.dart';
import 'package:book_nook_app/core/utils/app_values.dart';
import 'package:book_nook_app/core/validation/validation_types.dart';
import 'package:book_nook_app/core/widgets/forms/text_field_widget.dart';
import 'package:flutter/material.dart';
import '../../../../config/locale/app_localizations.dart';
import '../../../../config/routes/app_routes.dart';
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
  late String birthDay;
  late String birthMonth;
  late String birthYear;
  late String phoneNumber;

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
                    label: AppLocalizations.of(context)!.translate("first_name")!,
                    keyboardType: TextInputType.text,
                    labelStyle: AppTextStyle.fieldLabel,
                    errorStyle: AppTextStyle.fieldError,
                    borderWidth: AppConstValues.borderWidth,
                    borderColor: AppColors.border,
                    errorBorderColor: AppColors.error,
                    validateType: ValidationTypes.signupFirstName,
                    textAlign: TextAlign.start,
                    secureText: false,
                    onSave: (value) {
                      firstname = value;
                    })),
            Padding(
                padding: const EdgeInsets.fromLTRB(22, 22, 22, 0),
                child: TextFieldWidget(
                    label: AppLocalizations.of(context)!.translate("last_name")!,
                    keyboardType: TextInputType.text,
                    labelStyle: AppTextStyle.fieldLabel,
                    errorStyle: AppTextStyle.fieldError,
                    borderWidth: AppConstValues.borderWidth,
                    borderColor: AppColors.border,
                    errorBorderColor: AppColors.error,
                    validateType: ValidationTypes.signupLastName,
                    textAlign: TextAlign.start,
                    secureText: false,
                    onSave: (value) {
                      lastname = value;
                    })),
            Padding(
              padding: const EdgeInsets.fromLTRB(30, 25, 22, 0),
              child: Text(
                AppLocalizations.of(context)!.translate("birth_date")!,
                style: AppTextStyle.fieldLabel,
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(top: 20.0),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: <Widget>[
                  SizedBox(
                    width: 100,
                    child: TextFieldWidget(
                        label: AppLocalizations.of(context)!.translate("birth_dd")!,
                        keyboardType: TextInputType.number,
                        labelStyle: AppTextStyle.fieldLabel,
                        errorStyle: AppTextStyle.fieldError,
                        borderWidth: AppConstValues.borderWidth,
                        borderColor: AppColors.border,
                        errorBorderColor: AppColors.error,
                        validateType: ValidationTypes.signupBirthDay,
                        secureText: false,
                        textAlign: TextAlign.center,
                        onSave: (value) {
                          birthDay = value;
                        }),
                  ),
                  const SizedBox(
                    width: 30,
                  ),
                  SizedBox(
                    width: 100,
                    child: TextFieldWidget(
                        label: AppLocalizations.of(context)!.translate("birth_mm")!,
                        keyboardType: TextInputType.number,
                        labelStyle: AppTextStyle.fieldLabel,
                        errorStyle: AppTextStyle.fieldError,
                        borderWidth: AppConstValues.borderWidth,
                        borderColor: AppColors.border,
                        errorBorderColor: AppColors.error,
                        validateType: ValidationTypes.signupBirthMonth,
                        secureText: false,
                        textAlign: TextAlign.center,
                        onSave: (value) {
                          birthMonth = value;
                        }),
                  ),
                  const SizedBox(
                    width: 30,
                  ),
                  SizedBox(
                    width: 100,
                    child: TextFieldWidget(
                        label: AppLocalizations.of(context)!.translate("birth_yyyy")!,
                        keyboardType: TextInputType.number,
                        textAlign: TextAlign.center,
                        labelStyle: AppTextStyle.fieldLabel,
                        errorStyle: AppTextStyle.fieldError,
                        borderWidth: AppConstValues.borderWidth,
                        borderColor: AppColors.border,
                        errorBorderColor: AppColors.error,
                        validateType: ValidationTypes.signupBirthYear,
                        secureText: false,
                        onSave: (value) {
                          birthYear = value;
                        }),
                  ),
                ],
              ),
            ),
            Padding(
                padding: const EdgeInsets.fromLTRB(22, 24, 22, 0),
                child: TextFieldWidget(
                    label: AppLocalizations.of(context)!.translate("phone_number")!,
                    keyboardType: TextInputType.number,
                    labelStyle: AppTextStyle.fieldLabel,
                    errorStyle: AppTextStyle.fieldError,
                    borderWidth: AppConstValues.borderWidth,
                    borderColor: AppColors.border,
                    errorBorderColor: AppColors.error,
                    validateType: ValidationTypes.signupPhoneNumber,
                    textAlign: TextAlign.start,
                    secureText: false,
                    onSave: (value) {
                      phoneNumber = value;
                    })),
            Padding(
              padding: const EdgeInsets.only(top: 35.0),
              child: ButtonFormWidget(
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: <Widget>[
                      Text(
                        AppLocalizations.of(context)!.translate("next")!,
                        style: AppTextStyle.button,
                      ),
                      const Icon(Icons.arrow_forward_outlined),
                    ],
                  ),
                  onPress: () {
                    if (_formkey.currentState!.validate()) {
                      _formkey.currentState?.save();
                      if (firstname.isEmpty) {
                        Constants.showErrorDialog(
                            context: context, message: AppLocalizations.of(context)!.translate("blank_first_name")!);
                        return;
                      }
                      if (lastname.isEmpty) {
                        Constants.showErrorDialog(
                            context: context, message: AppLocalizations.of(context)!.translate("blank_last_name")!);
                        return;
                      }
                      if (birthDay.isEmpty) {
                        Constants.showErrorDialog(
                            context: context, message: AppLocalizations.of(context)!.translate("blank_birth_day")!);
                        return;
                      }
                      if (birthMonth.isEmpty) {
                        Constants.showErrorDialog(
                            context: context, message: AppLocalizations.of(context)!.translate("blank_birth_month")!);
                        return;
                      }
                      if (birthYear.isEmpty) {
                        Constants.showErrorDialog(
                            context: context, message: AppLocalizations.of(context)!.translate("blank_birth_year")!);
                        return;
                      }
                      if (phoneNumber.isEmpty) {
                        Constants.showErrorDialog(
                            context: context, message: AppLocalizations.of(context)!.translate("blank_phone_number")!);
                        return;
                      }
                      Navigator.pushNamed(context, Routes.signup2, arguments: {
                        "firstname": firstname, "lastname" : lastname, "phoneNumber" : phoneNumber,
                        "birthDay" : birthDay, "birthMonth" : birthMonth, "birthYear" : birthYear
                      });
                    }
                  }),
            ),
            Center(
              child: TextButton(
                onPressed: () {
                  Navigator.pushReplacementNamed(context, Routes.signin);
                },
                child: Text(
                    AppLocalizations.of(context)!.translate("have_already_account")!,
                    style: AppTextStyle.textDecoration),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
