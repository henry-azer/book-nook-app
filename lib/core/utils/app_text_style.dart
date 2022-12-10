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

  static TextStyle? appbarTitle = TextStyle(
    fontSize: 20,
    fontWeight: FontWeight.w700,
    color: AppColors.fontPrimary,
    fontFamily: AppStrings.fontFamilyComfortaa,
  );

  static TextStyle? categoryTitle = TextStyle(
    fontSize: 25,
    fontWeight: FontWeight.w700,
    color: AppColors.fontPrimary,
    fontFamily: AppStrings.fontFamilyComfortaa,
  );

  static TextStyle? categoryDecoratedTitle = TextStyle(
    fontSize: 16,
    fontWeight: FontWeight.w300,
    color: AppColors.fontSecondary,
    decoration: TextDecoration.underline,
    fontFamily: AppStrings.fontFamilyComfortaa,
  );

  static TextStyle? homeTitle = TextStyle(
    fontSize: 34,
    fontWeight: FontWeight.w700,
    color: AppColors.fontPrimary,
    fontFamily: AppStrings.fontFamilyComfortaa,
  );

  static TextStyle? homeSubtitle = TextStyle(
    fontSize: 30,
    fontWeight: FontWeight.w700,
    color: AppColors.fontSecondary,
    fontFamily: AppStrings.fontFamilyComfortaa,
  );

  static TextStyle? bookHighlightName = TextStyle(
    fontSize: 22,
    fontWeight: FontWeight.w700,
    color: AppColors.fontPrimary,
    fontFamily: AppStrings.fontFamilyComfortaa,
  );

  static TextStyle? bookHighlightTitle = TextStyle(
    fontSize: 18,
    fontWeight: FontWeight.w700,
    color: AppColors.fontSecondary,
    fontFamily: AppStrings.fontFamilyComfortaa,
  );

  static TextStyle? bookHighlightSubtitle = TextStyle(
    fontSize: 16,
    fontWeight: FontWeight.w700,
    color: AppColors.fontPrimary,
    fontFamily: AppStrings.fontFamilyComfortaa,
  );
}
