import 'package:flutter/material.dart';

import '../../utils/app_colors.dart';

class TextFieldWidget extends StatefulWidget {
  final String label;
  final TextInputType keyboardType;

  const TextFieldWidget(
      {Key? key, required this.label, required this.keyboardType})
      : super(key: key);

  @override
  State<TextFieldWidget> createState() => _TextFieldWidgetState();
}

class _TextFieldWidgetState extends State<TextFieldWidget> {
  @override
  Widget build(BuildContext context) {
    return TextFormField(
      keyboardType: widget.keyboardType,
      style: TextStyle(color: AppColors.fontPrimary),
      decoration: InputDecoration(
          labelText: widget.label,
          floatingLabelStyle: TextStyle(color: AppColors.fontPrimary),
          contentPadding: const EdgeInsets.only(left: 22),
          focusedBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(25.0),
            borderSide: BorderSide(
              color: AppColors.inputBorder,
            ),
          ),
          enabledBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(25.0),
            borderSide: BorderSide(
              color: AppColors.inputBorder,
              width: 2.0,
            ),
          ),
          errorBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(25.0),
            borderSide: BorderSide(
              color: AppColors.inputBorder,
              width: 2.0,
            ),
          ),
          errorStyle: const TextStyle(
            color: Colors.red,
          )),
      // validator: MultiValidator([
      //   RequiredValidator(errorText: "Required"),
      //   EmailValidator(errorText: "Invalid email"),
      // ])
    );
  }
}
