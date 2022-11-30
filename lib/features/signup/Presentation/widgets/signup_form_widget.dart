import 'package:book_nook_app/core/utils/app_colors.dart';
import 'package:book_nook_app/core/utils/app_text_style.dart';
import 'package:book_nook_app/core/utils/app_values.dart';
import 'package:book_nook_app/core/validation/validation_types.dart';
import 'package:book_nook_app/core/widgets/forms/text_field_widget.dart';
import 'package:book_nook_app/features/authentication/presentation/cubit/signin_cubit.dart';
import 'package:book_nook_app/features/signup/Presentation/widgets/signupII_form_widget.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:loading_animation_widget/loading_animation_widget.dart';
import '../../../../config/locale/app_localizations.dart';
import '../../../../config/routes/app_routes.dart';
import '../../../../core/utils/app_strings.dart';
import '../../../../core/utils/constants.dart';
import '../../../../core/widgets/buttons/button_form_widget.dart';

class SignupFormIWidget extends StatefulWidget {
  const SignupFormIWidget({Key? key}) : super(key: key);

  @override
  State<SignupFormIWidget> createState() => _SignupFormIWidgetState();
}

class _SignupFormIWidgetState extends State<SignupFormIWidget> {
  final GlobalKey<FormState> _formkey = GlobalKey<FormState>();
  late String firstname;
  late String lastname;
  late String birthdatdd;
  late String birthdatemm;
  late String birthdateyyyy;
  late String phonenumber;
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
                    validateType: ValidationTypes.signupFirstName,
                    secureText: false,
                    onSave: (value) {
                      firstname = value;
                    })),
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
                    validateType: ValidationTypes.signupLastName,
                    secureText: false,
                    onSave: (value) {
                      lastname = value;
                    })),
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
                        validateType: ValidationTypes.signupDayBirtday,
                        secureText: false,
                        textAlign: TextAlign.center,
                        onSave: (value) {
                          birthdatdd = value;
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
                        validateType: ValidationTypes.signupMonthBirtday,
                        secureText: false,
                        textAlign: TextAlign.center,
                        onSave: (value) {
                          birthdatemm = value;
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
                        textAlign: TextAlign.center,
                        labelStyle: AppTextStyle.fieldLabel,
                        errorStyle: AppTextStyle.fieldError,
                        borderWidth: AppConstValues.borderWidth,
                        borderColor: AppColors.border,
                        errorBorderColor: AppColors.error,
                        validateType: ValidationTypes.signupYearBirtday,
                        secureText: false,
                        onSave: (value) {
                          birthdateyyyy = value;
                        }),
                  ),
                ],
              ),
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
                    validateType: ValidationTypes.signupPhoneNumber,
                    secureText: false,
                    onSave: (value) {
                      phonenumber = value;
                    })),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: ButtonFormWidget(
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: <Widget>[
                      Text(
                        "Next",
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
                            context: context,
                            message: AppStrings.emptyFirstName);
                        return;
                      }
                      if (lastname.isEmpty) {
                        Constants.showErrorDialog(
                            context: context,
                            message: AppStrings.emptyLastName);
                        return;
                      }
                      if (birthdatdd.isEmpty) {
                        Constants.showErrorDialog(
                            context: context, message: AppStrings.required);
                        return;
                      }
                      if (birthdatemm.isEmpty) {
                        Constants.showErrorDialog(
                            context: context, message: AppStrings.required);
                        return;
                      }
                      if (birthdateyyyy.isEmpty) {
                        Constants.showErrorDialog(
                            context: context, message: AppStrings.required);
                        return;
                      }
                      if (phonenumber.isEmpty) {
                        Constants.showErrorDialog(
                            context: context,
                            message: AppStrings.emptyPhoneNumber);
                        return;
                      }
                      print(firstname);
                      print(lastname);
                      print(phonenumber);
                      //Navigator.pushReplacementNamed(context, Routes.signup2);
                      Navigator.of(context).pushReplacement(MaterialPageRoute(
                          builder: (context) => SignupFormIIWidget(
                                firstname,
                                lastname,
                                birthdatdd,
                                birthdatemm,
                                birthdateyyyy,
                                phonenumber,
                              )));
                    }
                  }),
            ),
            Center(
              child: TextButton(
                onPressed: () {
                  Navigator.pushReplacementNamed(context, Routes.signin);
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
