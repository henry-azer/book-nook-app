import 'dart:ui';

import 'package:book_nook_app/core/utils/app_text_style.dart';
import 'package:book_nook_app/core/widgets/buttons/button_form_widget.dart';
import 'package:book_nook_app/core/widgets/circle/positioned_circle_widget.dart';
import 'package:book_nook_app/features/splash/presentation/screens/welcome_screen.dart';

import 'package:flutter/material.dart';
import 'package:group_button/group_button.dart';

import '../../../../config/routes/app_routes.dart';
import '../../../../core/utils/app_colors.dart';
import 'categories_card.dart';

class ReadingLevel extends StatefulWidget {
  // bool isSelected = false;

  const ReadingLevel({Key? key}) : super(key: key);

  @override
  State<ReadingLevel> createState() => _ReadingLevelState();
}

class _ReadingLevelState extends State<ReadingLevel>
    with SingleTickerProviderStateMixin {
  List<CategorieScreen> readingLevel = [
    CategorieScreen(
      text: 'Beginner',
      color: AppColors.transparent,
      textColor: AppTextStyle.welcomeTitleDescription,
    ),
    CategorieScreen(
      text: 'Intermediate',
      color: AppColors.transparent,
      textColor: AppTextStyle.welcomeTitleDescription,
    ),
    CategorieScreen(
      text: 'Expert',
      color: AppColors.transparent,
      textColor: AppTextStyle.welcomeTitleDescription,
    ),
  ];

  @override
  Widget build(BuildContext context) {
    _navigateToReadingLevelRoute() =>
        Navigator.pushReplacementNamed(context, Routes.readingLevel);
    return Scaffold(
      body: Stack(children: [
        PositionedCircle(
            color: AppColors.circlePrimary,
            top: -50,
            left: -30,
            width: 100,
            height: 100),
        PositionedCircle(
            color: AppColors.circleSecondary,
            top: 630,
            left: 260,
            width: 250,
            height: 250),
        BackdropFilter(
          filter: ImageFilter.blur(sigmaX: 12, sigmaY: 10),
          child: Container(),
        ),
        SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Padding(
                padding: const EdgeInsets.only(top: 40.0, left: 10),
                child: BackButton(
                  color: AppColors.white,
                  onPressed: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) {
                          return const WelcomeScreen();
                        },
                      ),
                    );
                  },
                ),
              ),
              Padding(
                padding: const EdgeInsets.only(top: 25.0, left: 45),
                child: RichText(
                  text: TextSpan(
                    children: [
                      TextSpan(
                        text: 'Choose Your \n',
                        style: AppTextStyle.title,
                      ),
                      const WidgetSpan(
                        child: Padding(
                          padding: EdgeInsets.only(top: 35.0),
                        ),
                      ),
                      TextSpan(
                          text: 'reading level \n',
                          style: AppTextStyle.title2),
                      const WidgetSpan(
                        child: Padding(
                          padding: EdgeInsets.only(top: 30.0),
                        ),
                      ),
                    ],
                  ),
                ),
              ),
              Container(
                alignment: Alignment.center,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Padding(
                      padding: const EdgeInsets.only(top: 80.0,bottom: 20),
                      child: Center(
                        child: GroupButton(
                          options: GroupButtonOptions(
                            groupRunAlignment: GroupRunAlignment.spaceBetween,
                            selectedColor: AppColors.white,
                            unselectedColor: AppColors.transparent,
                            unselectedBorderColor: AppColors.white,
                            selectedTextStyle: AppTextStyle.cardDescription,
                            unselectedTextStyle:AppTextStyle.fieldLabel,
                            runSpacing: 30,
                            spacing: 100,
                            buttonHeight: 50,
                            buttonWidth: 160,
                            direction: Axis.horizontal,
                            borderRadius: BorderRadius.circular(25),
                            crossGroupAlignment: CrossGroupAlignment.center,
                            mainGroupAlignment: MainGroupAlignment.center,
                          ),
                          buttons: const [
                            'Beginner',
                            'Intermediate',
                            'Expert',
                          ],
                        ),
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.only(top: 60),
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
                              padding: EdgeInsets.only(left: 40),
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
        ),
      ]),
    );
  }
}