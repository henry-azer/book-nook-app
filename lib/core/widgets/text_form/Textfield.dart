import 'package:book_nook_app/core/utils/app_colors.dart';
import 'package:flutter/material.dart';

class TextFieldForm extends StatefulWidget {
  final String label;
  final TextInputType keyboardType;

  const TextFieldForm(
      {Key? key, required this.label, required this.keyboardType})
      : super(key: key);

  @override
  State<TextFieldForm> createState() => _TextFieldFormState();
}

class _TextFieldFormState extends State<TextFieldForm> {
  GlobalKey<FormState> formkey = GlobalKey<FormState>();
  String? validatePassword(String value) {
    if (value.isEmpty) {
      return "Password is Required";
    } else if (value.length < 8) {
      return "Password should be at least 8 characters";
    } else {
      return null;
    }
  }

  String? validateEmail(String value) {
    if (value.isEmpty) {
      return "Email is Required";
    } else if (!value.contains('@gmail.com')) {
      return "Something Missing";
    } else {
      return null;
    }
  }

  @override
  Widget build(BuildContext context) {
    return TextFormField(
        keyboardType: widget.keyboardType,
        style: TextStyle(color: AppColors.white),
        decoration: InputDecoration(
          labelText: widget.label,
          labelStyle: TextStyle(color: AppColors.white),
          floatingLabelStyle: TextStyle(color: AppColors.white),
          contentPadding: const EdgeInsets.only(left: 22),
          focusedBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(25.0),
            borderSide: BorderSide(
              color: AppColors.textFormBorder,
            ),
          ),
          enabledBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(29.0),
            borderSide: BorderSide(
              color: AppColors.textFormBorder,
              width: 2.0,
            ),
          ),
        ));
  }
}
