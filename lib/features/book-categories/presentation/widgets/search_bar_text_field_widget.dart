import 'package:book_nook_app/core/utils/app_colors.dart';
import 'package:book_nook_app/core/utils/app_text_style.dart';
import 'package:flutter/material.dart';

class SearchBarTextFieldWidget extends StatefulWidget {
  final String label;

  const SearchBarTextFieldWidget({Key? key, required this.label})
      : super(key: key);

  @override
  State<SearchBarTextFieldWidget> createState() =>
      _SearchBarTextFieldWidgetState();
}

class _SearchBarTextFieldWidgetState extends State<SearchBarTextFieldWidget> {
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
          contentPadding: const EdgeInsets.only(left: 20, right: 20),
          enabledBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(25.0),
            borderSide: BorderSide(
              color: AppColors.circlePrimary,
              width: 1,
            ),
          ),
          focusedBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(25.0),
            borderSide: BorderSide(
              color: AppColors.circlePrimary,
              width: 1,
            ),
          ),
          focusedErrorBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(25.0),
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
