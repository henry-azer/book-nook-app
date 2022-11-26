// import 'package:flutter/cupertino.dart';
import 'dart:ui';

import 'package:book_nook_app/core/utils/app_text_style.dart';
import 'package:book_nook_app/core/widgets/buttons/button_form_widget.dart';
import 'package:book_nook_app/core/widgets/circle/positioned_circle_widget.dart';
import 'package:book_nook_app/features/user-info/presentaion/screens/card.dart';
import 'package:book_nook_app/features/splash/presentation/screens/welcome_screen.dart';
import 'package:flutter/material.dart';

// import '../../../../config/locale/app_localizations.dart';
import '../../../../config/routes/app_routes.dart';
import '../../../../core/utils/app_colors.dart';
// import '../../../../core/utils/app_strings.dart';

class ReadingLevel extends StatefulWidget {
  const ReadingLevel({Key? key}) : super(key: key);

  @override
  State<ReadingLevel> createState() => _ReadingLevelState();
}

class _ReadingLevelState extends State<ReadingLevel> {
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
        Column(
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
              padding: const EdgeInsets.only(top: 30.0, bottom: 50, left: 30),
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
                        text: 'reading level\n', style: AppTextStyle.title2),
                    const WidgetSpan(
                      child: Padding(
                        padding: EdgeInsets.only(top: 20.0),
                      ),
                    ),
                  ],
                ),
              ),
            ),
            Container(
              alignment: Alignment.center,
              child: Column(
                children: [
                  CardScreen(
                    text: 'Beginner',
                    color: AppColors.buttonBackground,
                    textColor: AppTextStyle.selectButton,
                  ),
                  const SizedBox(
                    height: 20,
                  ),
                  CardScreen(
                    text: 'Intermediate',
                    color: AppColors.buttonBackground,
                    textColor: AppTextStyle.selectButton,
                  ),
                  const SizedBox(
                    height: 20,
                  ),
                  CardScreen(
                    text: 'Expert',
                    color: AppColors.buttonBackground,
                    textColor: AppTextStyle.selectButton,
                  ),
                  const SizedBox(
                    height: 20,
                  ),
                  Padding(
                    padding: const EdgeInsets.only(top: 20),
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
                  )
                ],
              ),
            ),
          ],
        ),
      ]),
    );
  }
}
