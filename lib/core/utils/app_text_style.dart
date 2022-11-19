import 'package:flutter/cupertino.dart';
import 'package:flutter/foundation.dart';

import 'app_colors.dart';
import 'app_strings.dart';

class AppTextStyle with Diagnosticable {
  static TextStyle? title = TextStyle(
    fontSize: 45,
    fontWeight: FontWeight.w500,
    color: AppColors.fontPrimary,
    fontFamily: AppStrings.fontFamilyComfortaa,
  );

  static TextStyle? fieldLabel = TextStyle(
    fontSize: 16,
    fontWeight: FontWeight.w400,
    color: AppColors.fontPrimary,
    fontFamily: AppStrings.fontFamilyBarlow,
  );

  static TextStyle? fieldError = TextStyle(
    fontSize: 14,
    fontWeight: FontWeight.w400,
    color: AppColors.fontPrimary,
    fontFamily: AppStrings.fontFamilyBarlow,
  );

  static TextStyle? button = TextStyle(
    fontSize: 25,
    fontWeight: FontWeight.w500,
    color: AppColors.fontPrimary,
    fontFamily: AppStrings.fontFamilyBarlow,
  );

  static TextStyle? textDecoration = TextStyle(
    fontSize: 16,
    fontWeight: FontWeight.w400,
    color: AppColors.fontPrimary,
    decoration: TextDecoration.underline,
    fontFamily: AppStrings.fontFamilyBarlow,
  );

  static TextStyle? rememberme = TextStyle(
    fontSize: 16,
    fontWeight: FontWeight.w400,
    color: AppColors.fontPrimary,
    fontFamily: AppStrings.fontFamilyBarlow,
  );
}
