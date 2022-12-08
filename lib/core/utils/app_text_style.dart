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

  static TextStyle? field = TextStyle(
    fontSize: 18,
    fontWeight: FontWeight.w400,
    color: AppColors.fontPrimary,
    fontFamily: AppStrings.fontFamilyBarlow,
  );

  static TextStyle? fieldLabel = TextStyle(
    fontSize: 16,
    fontWeight: FontWeight.w400,
    color: AppColors.fontPrimary,
    fontFamily: AppStrings.fontFamilyBarlow,
  );

  static TextStyle? profileFieldLabel = TextStyle(
    fontSize: 20,
    fontWeight: FontWeight.w400,
    color: AppColors.fontPrimary,
    fontFamily: AppStrings.fontFamilyBarlow,
  );

  static TextStyle? profileName = TextStyle(
    fontSize: 24,
    fontWeight: FontWeight.w700,
    color: AppColors.fontPrimary,
    fontFamily: AppStrings.fontFamilyComfortaa,
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

  static TextStyle? welcomeTitle = TextStyle(
    fontSize: 35,
    fontWeight: FontWeight.w700,
    color: AppColors.fontSecondary,
    fontFamily: AppStrings.fontFamilyComfortaa,
  );

  static TextStyle? welcomeTitleDescription = TextStyle(
    fontSize: 15,
    fontWeight: FontWeight.w400,
    color: AppColors.fontPrimary,
    fontFamily: AppStrings.fontFamilyBarlow,
  );

  static TextStyle? welcomeTitleSpan = TextStyle(
    fontSize: 18,
    fontWeight: FontWeight.w400,
    color: AppColors.fontPrimary,
    fontFamily: AppStrings.fontFamilyBarlow,
  );

  static TextStyle? snackbar = TextStyle(
    fontSize: 16,
    fontWeight: FontWeight.w400,
    color: AppColors.fontPrimary,
    fontFamily: AppStrings.fontFamilyComfortaa,
  );

  static TextStyle? cardinfo = TextStyle(
    fontSize: 12,
    fontWeight: FontWeight.w300,
    color: AppColors.gold,
    fontFamily: AppStrings.fontFamilyBarlow,
  );

  static TextStyle? cardvalue = TextStyle(
    fontSize: 12,
    fontWeight: FontWeight.w500,
    color: AppColors.white,
    fontFamily: AppStrings.fontFamilyBarlow,
  );

  static TextStyle? cardinfotextprimary = TextStyle(
    fontSize: 24,
    fontWeight: FontWeight.w700,
    color: AppColors.gold,
    fontFamily: AppStrings.fontFamilyComfortaa,
  );

  static TextStyle? cardinfotextsecondry = TextStyle(
    fontSize: 18,
    fontWeight: FontWeight.w300,
    color: AppColors.white,
    decoration: TextDecoration.underline,
    fontFamily: AppStrings.fontFamilyComfortaa,
  );

  static TextStyle? authorTitlePrimary = TextStyle(
    fontSize: 15,
    fontWeight: FontWeight.w300,
    color: AppColors.white,
    fontFamily: AppStrings.fontFamilyBarlow,
  );
}
