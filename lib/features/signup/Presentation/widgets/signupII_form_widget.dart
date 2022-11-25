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

class SignupIIFormWidget extends StatefulWidget {
  const SignupIIFormWidget({Key? key}) : super(key: key);

  @override
  State<SignupIIFormWidget> createState() => _SignupIIFormWidgetState();
}

class _SignupIIFormWidgetState extends State<SignupIIFormWidget> {
  final GlobalKey<FormState> _formkey = GlobalKey<FormState>();
  late String email;
  late String password;
  late String confirm_password;

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
              height: 40,
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
              height: 40,
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
                      confirm_password = value;
                    })),
          ],
        ),
      ),
    );
  }
}