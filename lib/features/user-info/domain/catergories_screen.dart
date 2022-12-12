import 'dart:ui';
import 'package:book_nook_app/features/user-info/domain/row_in_categories_card.dart';
import 'package:flutter/material.dart';

import '../../../../config/routes/app_routes.dart';
import '../../../../core/utils/app_colors.dart';
import '../../../../core/utils/app_strings.dart';
import '../../../../core/utils/app_text_style.dart';
import '../../../../core/widgets/buttons/button_form_widget.dart';
import '../../../../core/widgets/circle/positioned_circle_widget.dart';

class CategoriesScreen extends StatefulWidget {
  const CategoriesScreen({Key? key}) : super(key: key);

  @override
  State<CategoriesScreen> createState() => _CategoriesScreenState();
}

class _CategoriesScreenState extends State<CategoriesScreen>
    with SingleTickerProviderStateMixin {

  @override
  Widget build(BuildContext context) {
    _navigateToReadingLevelRoute() =>
        Navigator.pushReplacementNamed(context, Routes.readingLevel);
    return Scaffold(
      body: Stack(
        children: [
          PositionedCircle(
              color: AppColors.circlePrimary,
              top: -60,
              left: -40,
              width: 100,
              height: 100),
          PositionedCircle(
              color: AppColors.circleSecondary,
              top: 640,
              left: 280,
              width: 250,
              height: 250),
          BackdropFilter(
            filter: ImageFilter.blur(sigmaX: 12, sigmaY: 10),
            child: Column(
              children: [
                Padding(
                  padding: const EdgeInsets.only(top: 90.0, left: 15),
                  child: RichText(
                    text: TextSpan(
                      children: [
                        TextSpan(
                          text: 'Choose Your \n',
                          style: AppTextStyle.title1,
                        ),
                        const WidgetSpan(
                          child: Padding(
                            padding: EdgeInsets.only(top: 20.0),
                          ),
                        ),
                        TextSpan(
                            text: 'best Categories \n',
                            style: AppTextStyle.title2),
                      ],
                    ),
                  ),
                ),
                CategoriesRow(),
                const Padding(
                  padding: EdgeInsets.only(top: 50.0 ,bottom: 10),
                  child: Text('Chooose one category at least ',
                      style: TextStyle(
                        fontSize: 16,
                        fontWeight: FontWeight.w400,
                        color: Colors.white,
                        fontFamily: AppStrings.fontFamilyBarlow,
                      )),
                ),
                Padding(
                  padding: const EdgeInsets.only(top:40.0),
                  child: ButtonFormWidget(
                    onPress: _navigateToReadingLevelRoute,
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Text(
                          'Next',
                          style: AppTextStyle.button,
                        ),
                        const Padding(
                          padding: EdgeInsets.only(left: 20),
                          child: Icon(
                            Icons.arrow_forward_outlined,
                            size: 35,
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}