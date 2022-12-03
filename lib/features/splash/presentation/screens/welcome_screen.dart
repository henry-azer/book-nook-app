import 'dart:ui';

import 'package:book_nook_app/core/utils/app_colors.dart';
import 'package:book_nook_app/core/utils/app_text_style.dart';
import 'package:book_nook_app/core/widgets/buttons/button_form_widget.dart';
import 'package:book_nook_app/core/widgets/circle/positioned_circle_widget.dart';
import 'package:flutter/material.dart';

import '../../../../config/locale/app_localizations.dart';
import '../../../../config/routes/app_routes.dart';

class WelcomeScreen extends StatefulWidget {
  const WelcomeScreen({super.key});

  @override
  State<WelcomeScreen> createState() => _WelcomeScreenState();
}

class _WelcomeScreenState extends State<WelcomeScreen> {
  _navigateToSigninRoute() => Navigator.pushReplacementNamed(context, Routes.signin);

  @override
  Widget build(BuildContext context) {
    return Material(
      child: Scaffold(
        body: Stack(
          children: [
            PositionedCircle(
              color: AppColors.circleSecondary,
              width: 250,
              height: 250,
              top: -98,
              left: -142,
            ),
            PositionedCircle(
              color: AppColors.circlePrimary,
              width: 107,
              height: 107,
              top: 85,
              left: 380,
            ),
            PositionedCircle(
              color: AppColors.circlePrimary,
              width: 150,
              height: 150,
              top: 489,
              left: -110,
            ),
            BackdropFilter(
              filter: ImageFilter.blur(sigmaX: 12, sigmaY: 10),
              child: Container(),
            ),
            Padding(
              padding: const EdgeInsets.only(top: 337.0, left: 23.0),
              child: Column(
                children: [
                  RichText(
                    text: TextSpan(
                      children: [
                        TextSpan(
                            text: AppLocalizations.of(context)!.translate('welcome_title')!,
                            style: AppTextStyle.welcomeTitle),
                        const WidgetSpan(
                          child: Padding(
                            padding: EdgeInsets.only(top: 35.0),
                          ),
                        ),
                        TextSpan(
                            text: AppLocalizations.of(context)!.translate('welcome_description')!,
                            style: AppTextStyle.welcomeTitleDescription),
                      ],
                    ),
                  ),
                ],
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(top: 680.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Padding(
                    padding: const EdgeInsets.only(left: 30.0, bottom: 16.0),
                    child: Text(
                      AppLocalizations.of(context)!.translate('welcome_span')!,
                      style: AppTextStyle.welcomeTitleSpan,
                    ),
                  ),
                  ButtonFormWidget(
                      onPress: _navigateToSigninRoute,
                      child: Text(
                          AppLocalizations.of(context)!.translate('welcome_start')!,
                          style: AppTextStyle.button)),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
