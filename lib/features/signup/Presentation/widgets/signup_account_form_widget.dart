// ignore_for_file: file_names
import 'package:book_nook_app/core/utils/app_colors.dart';
import 'package:book_nook_app/core/utils/app_text_style.dart';
import 'package:book_nook_app/core/utils/app_values.dart';
import 'package:book_nook_app/core/validation/validation_types.dart';
import 'package:book_nook_app/core/widgets/forms/text_field_widget.dart';
import 'package:book_nook_app/features/signup/domain/entities/signup_request.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:loading_animation_widget/loading_animation_widget.dart';
import '../../../../config/locale/app_localizations.dart';
import '../../../../config/routes/app_routes.dart';
import '../../../../core/utils/constants.dart';
import '../../../../core/widgets/buttons/button_form_widget.dart';
import '../cubit/signup_cubit.dart';

class SignupAccountFormWidget extends StatefulWidget {
  const SignupAccountFormWidget({super.key});

  @override
  State<SignupAccountFormWidget> createState() => _SignupAccountFormWidgetState();
}

class _SignupAccountFormWidgetState extends State<SignupAccountFormWidget> {
  final GlobalKey<FormState> _formkey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    SignupRequest signupRequest = ModalRoute.of(context)!.settings.arguments as SignupRequest;

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
                      signupRequest.email = value;
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
                      signupRequest.password = value;
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
                      signupRequest.confirmPassword = value;
                    })),
            Padding(
              padding: const EdgeInsets.only(top: 80),
              child: BlocConsumer<SignupCubit, SignupState>(
                builder: ((context, state) {
                  if (state is SignupLoading) {
                    return ButtonFormWidget(
                      onPress: () {},
                      child: Padding(
                        padding: const EdgeInsets.only(top: 5),
                        child: LoadingAnimationWidget.staggeredDotsWave(
                          color: Colors.white, size: 40,
                        ),
                      ),
                    );
                  } else {
                    return ButtonFormWidget(
                        child: Text(AppLocalizations.of(context)!.translate('signup')!,
                          style: AppTextStyle.button,
                        ),
                        onPress: () {
                          if (_formkey.currentState!.validate()) {
                            _formkey.currentState?.save();
                            if (signupRequest.email.isEmpty) {
                              Constants.showErrorDialog(context: context, message: AppLocalizations.of(context)!.translate('blank_email')!);
                              return;
                            }
                            if (signupRequest.password.isEmpty) {
                              Constants.showErrorDialog(context: context, message: AppLocalizations.of(context)!.translate('blank_password')!);
                              return;
                            }
                            if (signupRequest.confirmPassword.isEmpty) {
                              Constants.showErrorDialog(context: context, message: AppLocalizations.of(context)!.translate('blank_confirm_password')!);
                              return;
                            }
                            if (signupRequest.password.compareTo(signupRequest.confirmPassword).isOdd) {
                              Constants.showErrorDialog(context: context, message: AppLocalizations.of(context)!.translate('passwords_mismatch')!);
                              return;
                            }
                            BlocProvider.of<SignupCubit>(context).signup(signupRequest);
                          }
                        });
                  }
                }),
                listener: ((context, state) {
                  if (state is SignupError) {
                    Constants.showErrorDialog(context: context, message: state.message);
                  } else if (state is SignupSuccess) {
                    Constants.showSnackBar(context: context, message: state.userResponse.message);
                    Navigator.pushReplacementNamed(context, Routes.signin);
                  }
                }),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
