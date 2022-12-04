import 'package:flutter/material.dart';

import '../../../../config/locale/app_localizations.dart';
import '../../../../core/utils/app_text_style.dart';
import '../../../../core/validation/text_field_validation.dart';

class UserProfileTextField extends StatefulWidget {
  final String value;
  final String label;
  final TextStyle? valueStyle;
  final TextStyle? errorStyle;
  final double borderWidth;
  final Color borderColor;
  final Color errorBorderColor;
  final bool secureText;
  final bool? enabled;
  final String validateType;
  final TextInputType keyboardType;
  final FormFieldSetter onSave;

  const UserProfileTextField({
    Key? key,
    this.errorStyle,
    required this.borderWidth,
    required this.borderColor,
    required this.errorBorderColor,
    required this.secureText,
    required this.validateType,
    required this.keyboardType,
    required this.onSave,
    required this.valueStyle,
    required this.value,
    required this.label,
    this.enabled,
  }) : super(key: key);

  @override
  State<UserProfileTextField> createState() => _UserProfileTextFieldState();
}

class _UserProfileTextFieldState extends State<UserProfileTextField> {
  @override
  Widget build(BuildContext context) {
    String validation = "";

    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        Text(
          widget.label,
          style: AppTextStyle.profileFieldLabel,
        ),
        Padding(
          padding: const EdgeInsets.only(left: 20.0),
          child: SizedBox(
            width: widget.value.length > 20 ? 220 : 180,
            height: 50,
            child: TextFormField(
              enabled: widget.enabled ?? true,
              initialValue: widget.value,
              style: widget.valueStyle,
              keyboardType: widget.keyboardType,
              obscureText: widget.secureText,
              obscuringCharacter: "*",
              autocorrect: false,
              enableSuggestions: false,
              onSaved: widget.onSave,
              decoration: InputDecoration(
                contentPadding: const EdgeInsets.only(left: 10),
                enabledBorder: UnderlineInputBorder(
                  borderSide: BorderSide(color: widget.borderColor),
                ),
                focusedBorder: UnderlineInputBorder(
                  borderSide: BorderSide(color: widget.borderColor),
                ),
                errorBorder: UnderlineInputBorder(
                  borderSide: BorderSide(color: widget.errorBorderColor),
                ),
                focusedErrorBorder: UnderlineInputBorder(
                  borderSide: BorderSide(color: widget.errorBorderColor),
                ),
              ),
              onChanged: (value) {
                validation =
                    ValidateTextFiled.validate(value, widget.validateType)!;
              },
              validator: (value) {
                return validation == ""
                    ? null
                    : AppLocalizations.of(context)!.translate(validation)!;
              },
            ),
          ),
        ),
      ],
    );
  }
}
