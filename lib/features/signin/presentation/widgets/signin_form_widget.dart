import 'package:book_nook_app/core/utils/app_colors.dart';
import 'package:book_nook_app/core/utils/app_text_style.dart';
import 'package:book_nook_app/core/utils/app_values.dart';
import 'package:book_nook_app/core/validation/validation_types.dart';
import 'package:book_nook_app/core/widgets/forms/text_field_widget.dart';
import 'package:book_nook_app/features/signin/presentation/cubit/signin_cubit.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:loading_animation_widget/loading_animation_widget.dart';

import '../../../../config/locale/app_localizations.dart';
import '../../../../config/routes/app_routes.dart';
import '../../../../core/utils/constants.dart';
import '../../../../core/widgets/buttons/button_form_widget.dart';
import '../../domain/entities/signin_request.dart';

class SigninFormWidget extends StatefulWidget {
  const SigninFormWidget({Key? key}) : super(key: key);

  @override
  State<SigninFormWidget> createState() => _SigninFormWidgetState();
}

class _SigninFormWidgetState extends State<SigninFormWidget> {
  final GlobalKey<FormState> _formkey = GlobalKey<FormState>();
  late SigninRequest signinRequest = SigninRequest();

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
                    textAlign: TextAlign.start,
                    secureText: false,
                    onSave: (value) {
                      signinRequest.email = value;
                    })),
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
                    textAlign: TextAlign.start,
                    secureText: true,
                    onSave: (value) {
                      signinRequest.password = value;
                    })),
            Padding(
              padding: const EdgeInsets.only(
                  left: 25, right: 25, top: 10, bottom: 30),
              child: GestureDetector(
                onTap: () {
                  setState(() {
                    signinRequest.rememberme = !signinRequest.rememberme;
                  });
                },
                child: Row(
                  children: [
                    Checkbox(
                      checkColor: AppColors.primary,
                      activeColor: AppColors.fontPrimary,
                      autofocus: false,
                      value: signinRequest.rememberme,
                      onChanged: (value) {
                        setState(() {
                          signinRequest.rememberme = value!;
                        });
                      },
                    ),
                    Text(AppLocalizations.of(context)!.translate('rememberme')!, style: AppTextStyle.rememberme)
                  ],
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(top: 20),
              child: BlocConsumer<SigninCubit, SigninState>(
                builder: ((context, state) {
                  if (state is SigninLoading) {
                    return ButtonFormWidget(
                      onPress: () {},
                      child: Padding(
                        padding: const EdgeInsets.only(top: 5),
                        child: LoadingAnimationWidget.staggeredDotsWave(
                          color: Colors.white,
                          size: 40,
                        ),
                      ),
                    );
                  } else {
                    return ButtonFormWidget(
                      onPress: () {
                        if (_formkey.currentState!.validate()) {
                          _formkey.currentState?.save();
                          if (signinRequest.email.isEmpty) {
                            Constants.showErrorDialog(context: context, message: AppLocalizations.of(context)!.translate('blank_email')!);
                            return;
                          }
                          if (signinRequest.password.isEmpty) {
                            Constants.showErrorDialog(context: context, message: AppLocalizations.of(context)!.translate('blank_password')!);
                            return;
                          }
                          BlocProvider.of<SigninCubit>(context).signin(signinRequest);
                        }
                      },
                      child: Text(
                        AppLocalizations.of(context)!.translate('signin')!,
                        style: AppTextStyle.button,
                      ),
                    );
                  }
                }),
                listener: ((context, state) {
                  if (state is SigninError) {
                    Constants.showErrorDialog(context: context, message: state.message);
                  } else if (state is SigninSuccess) {
                    Constants.showSnackBar(context: context, message: state.signinClaimsResponse.message);
                    Navigator.pushReplacementNamed(context, Routes.userWelcome);
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
