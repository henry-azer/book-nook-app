import 'package:book_nook_app/features/profile/presentation/widgets/profile_text_field.dart';
import 'package:flutter/material.dart';

import '../../../../config/locale/app_localizations.dart';
import '../../../../core/utils/app_colors.dart';
import '../../../../core/utils/app_text_style.dart';
import '../../../../core/utils/app_values.dart';
import '../../../../core/validation/validation_types.dart';
import '../../../../data/entities/user/user.dart';

class ProfileForm extends StatefulWidget {
  final User user;

  const ProfileForm({Key? key, required this.user}) : super(key: key);

  @override
  State<ProfileForm> createState() => _ProfileFormState();
}

class _ProfileFormState extends State<ProfileForm> {
  final GlobalKey<FormState> _formkey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    return Material(
      color: Colors.transparent,
      child: Form(
          autovalidateMode: AutovalidateMode.onUserInteraction,
          key: _formkey,
          child: Column(
            children: [
              Padding(
                padding: const EdgeInsets.only(top: 20.0),
                child: ProfileTextField(
                    enabled: false,
                    value: widget.user.email,
                    label: AppLocalizations.of(context)!.translate('email')!,
                    valueStyle: AppTextStyle.field,
                    keyboardType: TextInputType.emailAddress,
                    errorStyle: AppTextStyle.fieldError,
                    borderWidth: AppConstValues.borderWidth,
                    borderColor: Colors.transparent,
                    errorBorderColor: AppColors.error,
                    validateType: ValidationTypes.signinEmail,
                    secureText: false,
                    onSave: (value) {
                      // password = value;
                    }),
              ),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 40.0),
                child: Divider(
                  color: AppColors.border,
                  thickness: 3,
                  height: 4,
                ),
              ),
              Padding(
                padding: const EdgeInsets.only(top: 20.0),
                child: ProfileTextField(
                    enabled: false,
                    value: widget.user.password.substring(0, 20),
                    label: AppLocalizations.of(context)!.translate('password')!,
                    valueStyle: AppTextStyle.field,
                    keyboardType: TextInputType.visiblePassword,
                    errorStyle: AppTextStyle.fieldError,
                    borderWidth: AppConstValues.borderWidth,
                    borderColor: Colors.transparent,
                    errorBorderColor: AppColors.error,
                    validateType: ValidationTypes.signinEmail,
                    secureText: true,
                    onSave: (value) {
                      // password = value;
                    }),
              ),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 40.0),
                child: Divider(
                  color: AppColors.border,
                  thickness: 3,
                  height: 5,
                ),
              ),
              Padding(
                padding: const EdgeInsets.only(top: 20.0),
                child: ProfileTextField(
                    enabled: false,
                    value: widget.user.firstName,
                    label:
                        AppLocalizations.of(context)!.translate('first_name')!,
                    valueStyle: AppTextStyle.field,
                    keyboardType: TextInputType.visiblePassword,
                    errorStyle: AppTextStyle.fieldError,
                    borderWidth: AppConstValues.borderWidth,
                    borderColor: Colors.transparent,
                    errorBorderColor: AppColors.error,
                    validateType: ValidationTypes.signinEmail,
                    secureText: false,
                    onSave: (value) {
                      // password = value;
                    }),
              ),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 40.0),
                child: Divider(
                  color: AppColors.border,
                  thickness: 3,
                  height: 5,
                ),
              ),
              Padding(
                padding: const EdgeInsets.only(top: 20.0),
                child: ProfileTextField(
                    enabled: false,
                    value: widget.user.lastName,
                    label:
                        AppLocalizations.of(context)!.translate('last_name')!,
                    valueStyle: AppTextStyle.field,
                    keyboardType: TextInputType.visiblePassword,
                    errorStyle: AppTextStyle.fieldError,
                    borderWidth: AppConstValues.borderWidth,
                    borderColor: Colors.transparent,
                    errorBorderColor: AppColors.error,
                    validateType: ValidationTypes.signinEmail,
                    secureText: false,
                    onSave: (value) {
                      // password = value;
                    }),
              ),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 40.0),
                child: Divider(
                  color: AppColors.border,
                  thickness: 3,
                  height: 5,
                ),
              ),
              Padding(
                padding: const EdgeInsets.only(top: 20.0),
                child: ProfileTextField(
                    enabled: false,
                    value: widget.user.birthdate,
                    label:
                        AppLocalizations.of(context)!.translate('birth_date')!,
                    valueStyle: AppTextStyle.field,
                    keyboardType: TextInputType.visiblePassword,
                    errorStyle: AppTextStyle.fieldError,
                    borderWidth: AppConstValues.borderWidth,
                    borderColor: Colors.transparent,
                    errorBorderColor: AppColors.error,
                    validateType: ValidationTypes.signinEmail,
                    secureText: false,
                    onSave: (value) {
                      // password = value;
                    }),
              ),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 40.0),
                child: Divider(
                  color: AppColors.border,
                  thickness: 3,
                  height: 5,
                ),
              ),
              Padding(
                padding: const EdgeInsets.only(top: 20.0),
                child: ProfileTextField(
                    enabled: false,
                    value: widget.user.phoneNumber,
                    label: AppLocalizations.of(context)!
                        .translate('phone_number')!,
                    valueStyle: AppTextStyle.field,
                    keyboardType: TextInputType.visiblePassword,
                    errorStyle: AppTextStyle.fieldError,
                    borderWidth: AppConstValues.borderWidth,
                    borderColor: Colors.transparent,
                    errorBorderColor: AppColors.error,
                    validateType: ValidationTypes.signinEmail,
                    secureText: false,
                    onSave: (value) {
                      // password = value;
                    }),
              ),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 40.0),
                child: Divider(
                  color: AppColors.border,
                  thickness: 3,
                  height: 5,
                ),
              ),
            ],
          )),
    );
  }
}
