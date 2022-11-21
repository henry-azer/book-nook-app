import 'dart:async';
import 'dart:ui';

import 'package:book_nook_app/core/utils/app_colors.dart';
import 'package:book_nook_app/core/widgets/circles_with_anitmation_widget.dart';
import 'package:flutter/material.dart';

import '../../../../config/routes/app_routes.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({
    Key? key,
  }) : super(key: key);

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen>
    with SingleTickerProviderStateMixin<SplashScreen> {
  late Timer _timer;

  _goNext() =>
      Navigator.pushReplacementNamed(context, Routes.welcomeQuoteRoute);

  _startDelay() {
    _timer = Timer(const Duration(milliseconds: 7000), () => _goNext());
  }

  @override
  void initState() {
    super.initState();
    _startDelay();
  }

  @override
  void dispose() {
    _timer.cancel();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.appBackgroundColor,
      body: Center(
        child: Stack(
          children: [
            CirclesWithAnimation(
              color: AppColors.appBeigeColor,
              height: 150,
              width: 150,
              topPostion: -50,
              leftPostion: -50,
              beatsPerMinute: 5,
            ),
            CirclesWithAnimation(
              color: AppColors.appLightBlueColor,
              width: 280,
              height: 280,
              topPostion: 150,
              leftPostion: -70,
              beatsPerMinute: 4,
            ),
            CirclesWithAnimation(
              color: AppColors.appBeigeColor,
              width: 90,
              height: 90,
              topPostion: 265,
              leftPostion: -10,
              beatsPerMinute: 7,
            ),
            CirclesWithAnimation(
              color: AppColors.appBeigeColor,
              width: 200,
              height: 200,
              topPostion: 550,
              leftPostion: -30,
              beatsPerMinute: 10,
            ),
            CirclesWithAnimation(
              color: AppColors.appBeigeColor,
              width: 150,
              height: 150,
              topPostion: 100,
              leftPostion: 280,
              beatsPerMinute: 3,
            ),
            CirclesWithAnimation(
              color: AppColors.appLightBlueColor,
              width: 170,
              height: 170,
              topPostion: 400,
              leftPostion: 160,
              beatsPerMinute: 9,
            ),
            CirclesWithAnimation(
              color: AppColors.appLightBlueColor,
              width: 50,
              height: 50,
              topPostion: 600,
              leftPostion: 300,
              beatsPerMinute: 6,
            ),
            BackdropFilter(
              filter: ImageFilter.blur(sigmaX: 10, sigmaY: 10),
              child: Container(),
            ),
          ],
        ),
      ),
    );
  }
}
