import 'dart:async';
import 'dart:ui';

import 'package:book_nook_app/core/utils/app_colors.dart';
import 'package:book_nook_app/core/widgets/circle_widget.dart';
import 'package:flutter/material.dart';
import 'package:im_animations/im_animations.dart';
import 'package:simple_animations/animation_builder/custom_animation_builder.dart';
import 'package:simple_animations/animation_builder/play_animation_builder.dart';
import 'package:simple_animations/movie_tween/movie_tween.dart';

import '../../../../config/routes/app_routes.dart';
import '../../../../core/utils/assets_manager.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({Key? key}) : super(key: key);

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  late Timer _timer;

  _goNext() => {};

  _startDelay() {
    _timer = Timer(const Duration(milliseconds: 2000), () => _goNext());
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
            Circles(
              color: AppColors.appBeigeColor,
              height: 150,
              width: 150,
              topPostion: -50,
              leftPostion: -50,
            ),
            Circles(
              color: AppColors.appLightBlueColor,
              width: 280,
              height: 280,
              topPostion: 150,
              leftPostion: -70,
            ),
            Circles(
              color: AppColors.appBeigeColor,
              width: 90,
              height: 90,
              topPostion: 265,
              leftPostion: -10,
            ),
            Circles(
              color: AppColors.appBeigeColor,
              width: 200,
              height: 200,
              topPostion: 550,
              leftPostion: -30,
            ),
            Circles(
              color: AppColors.appBeigeColor,
              width: 150,
              height: 150,
              topPostion: 100,
              leftPostion: 280,
            ),
            Circles(
              color: AppColors.appLightBlueColor,
              width: 170,
              height: 170,
              topPostion: 400,
              leftPostion: 160,
            ),
            Circles(
              color: AppColors.appLightBlueColor,
              width: 50,
              height: 50,
              topPostion: 600,
              leftPostion: 300,
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
