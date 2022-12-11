import 'package:book_nook_app/core/utils/app_colors.dart';
import 'package:book_nook_app/core/utils/app_text_style.dart';
import 'package:flutter/material.dart';

class CategoriesTextField extends StatefulWidget {
  final String label;
  const CategoriesTextField({Key? key, required this.label}) : super(key: key);

  @override
  State<CategoriesTextField> createState() => _CategoriesTextFieldState();
}

class _CategoriesTextFieldState extends State<CategoriesTextField> {
  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {},
      child: TextFormField(
        keyboardType: TextInputType.text,
        obscureText: false,
        autocorrect: false,
        enableSuggestions: true,
        textAlign: TextAlign.start,
        style: AppTextStyle.field,
        decoration: InputDecoration(
          hintText: widget.label,
          suffixIcon: Icon(
            Icons.search,
            color: AppColors.white,
          ),
          floatingLabelStyle: TextStyle(color: AppColors.fontPrimary),
          contentPadding: const EdgeInsets.only(left: 50, right: 50),
          enabledBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(20.0),
            borderSide: BorderSide(
              color: AppColors.circlePrimary,
              width: 1,
            ),
          ),
          focusedBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(20.0),
            borderSide: BorderSide(
              color: AppColors.circlePrimary,
              width: 1,
            ),
          ),
          focusedErrorBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(20.0),
            borderSide: BorderSide(
              color: AppColors.error,
              width: 1,
            ),
          ),
          errorStyle: AppTextStyle.fieldError,
        ),
      ),
    );
  }
}
