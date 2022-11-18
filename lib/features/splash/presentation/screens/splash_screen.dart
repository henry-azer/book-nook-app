import 'dart:async';
import 'dart:ui';

import 'package:book_nook_app/core/utils/app_colors.dart';
import 'package:flutter/material.dart';
import 'package:simple_animations/animation_builder/custom_animation_builder.dart';
import 'package:simple_animations/animation_builder/loop_animation_builder.dart';
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
    Size size = MediaQuery.of(context).size;

    //way of moving the big blue ball
    final MovieTween tween1 = MovieTween()
      ..scene(
              begin: const Duration(seconds: 0),
              end: const Duration(seconds: 3))
          .tween('width', Tween(begin: 20.0, end: 260.0))
      ..scene(
              begin: const Duration(seconds: 0),
              end: const Duration(seconds: 3))
          .tween('width', Tween(begin: 20.0, end: 260.0))
      ..scene(
              begin: const Duration(seconds: 1),
              duration: const Duration(seconds: 5))
          .tween('height', Tween(begin: 0.0, end: 240.0));
    // ..scene(
    //         begin: const Duration(milliseconds: 0),
    //         duration: const Duration(milliseconds: 3000))
    //     .tween('color', ColorTween(begin: Colors.red, end: Colors.blue));
    return Scaffold(
      backgroundColor: AppColors.appBackgroundColor,
      body: Center(
        child: Stack(
          children: [
            CustomAnimationBuilder<double>(
              control: Control.mirror,
              tween: Tween(begin: 170.0, end: 280.0),
              duration: const Duration(seconds: 2),
              startPosition: 0,
              // control: Control.mirror,
              // tween: Tween(begin: 130.0, end: 230.0),
              // duration: const Duration(seconds: 2),
              // startPosition: 0,
              builder: (context, value, child) {
                return Positioned(
                  top: -value / 3,
                  left: -value / 3,
                  child: Container(
                    width: size.width / 2.5,
                    height: size.width / 2,
                    decoration: BoxDecoration(
                      color: AppColors.appBeigeColor,
                      shape: BoxShape.circle,
                      boxShadow: [
                        BoxShadow(
                            blurRadius: 6,
                            offset: const Offset(2, 7),
                            color: const Color.fromRGBO(232, 195, 158, 1)
                                .withOpacity(0.3))
                      ],
                    ),
                  ),
                );
              },
              // duration: const Duration(seconds: 20),
              // startPosition: 0,
            ),
            PlayAnimationBuilder<Movie>(
              tween: tween1,
              duration: tween1.duration,
              builder: (context, value, child) {
                return Positioned(
                  top: 150,
                  left: -50,
                  child: Container(
                    width: value.get('width'),
                    height: value.get('height'),
                    decoration: BoxDecoration(
                      color: AppColors.appLightBlueColor,
                      shape: BoxShape.circle,
                      boxShadow: [
                        BoxShadow(
                            blurRadius: 6,
                            offset: const Offset(2, 7),
                            color: AppColors.appLightBlueColor.withOpacity(0.3))
                      ],
                    ),
                  ),
                );
              },
            ),
            CustomAnimationBuilder<double>(
              control: Control.mirror,
              tween: Tween(begin: 150.0, end: 160.0),
              duration: const Duration(seconds: 2),
              startPosition: 0,
              builder: (BuildContext context, value, Widget? child) {
                return Positioned(
                  top: value / 1,
                  left: value / 80,
                  child: Container(
                    width: size.width / 5.5,
                    height: size.width / 1.5,
                    decoration: BoxDecoration(
                      color: AppColors.appBeigeColor,
                      shape: BoxShape.circle,
                      boxShadow: [
                        BoxShadow(
                            blurRadius: 6,
                            offset: const Offset(2, 7),
                            color: AppColors.appBeigeColor.withOpacity(0.3))
                      ],
                    ),
                  ),
                );
              },
              // duration: const Duration(seconds: 5),
              // tween: Tween(begin: 100.0, end: 200.0),
              // startPosition: 0,
            ),
            CustomAnimationBuilder<double>(
              control: Control.mirror,
              tween: Tween(begin: 100.0, end: 200.0),
              duration: const Duration(seconds: 2),
              delay: const Duration(seconds: 1),
              curve: Curves.easeInOut,
              startPosition: 0.5,
              animationStatusListener: (status) {
                debugPrint('status updated: $status');
              },
              builder: (BuildContext context, value, Widget? child) {
                return Positioned(
                  bottom: -value / 4,
                  left: -value / 9,
                  child: Container(
                    width: size.width / 2.5,
                    height: size.width / 2,
                    decoration: BoxDecoration(
                      color: AppColors.appBeigeColor,
                      shape: BoxShape.circle,
                      boxShadow: [
                        BoxShadow(
                            blurRadius: 6,
                            offset: const Offset(2, 7),
                            color: const Color.fromRGBO(232, 195, 158, 1)
                                .withOpacity(0.3))
                      ],
                    ),
                  ),
                );
              },
              // duration: const Duration(seconds: 9),
              // tween: Tween(begin: 100.0, end: 200.0),
              // startPosition: 0,
            ),
            CustomAnimationBuilder<double>(
              control: Control.mirror,
              tween: Tween(begin: 170.0, end: 270.0),
              duration: const Duration(seconds: 2),
              startPosition: 0,
              builder: (BuildContext context, value, Widget? child) {
                return Positioned(
                  bottom: value / 1.5,
                  right: -value / 1.5,
                  left: value / 25,
                  child: Container(
                    width: size.width / 5,
                    height: size.width / 3,
                    decoration: BoxDecoration(
                      color: AppColors.appLightBlueColor,
                      shape: BoxShape.circle,
                      boxShadow: [
                        BoxShadow(
                            blurRadius: 6,
                            offset: const Offset(2, 7),
                            color: AppColors.appLightBlueColor.withOpacity(0.3))
                      ],
                    ),
                  ),
                );
              },
            ),
            CustomAnimationBuilder<double>(
              control: Control.mirror,
              duration: const Duration(seconds: 2),
              startPosition: 0,
              builder: (BuildContext context, value, Widget? child) {
                return Positioned(
                  bottom: value / 6.5,
                  right: -value / 10,
                  child: Container(
                    width: size.width / 2,
                    height: size.width / 10,
                    decoration: BoxDecoration(
                      color: AppColors.appLightBlueColor,
                      shape: BoxShape.circle,
                      boxShadow: [
                        BoxShadow(
                            blurRadius: 6,
                            offset: const Offset(2, 7),
                            color: AppColors.appLightBlueColor.withOpacity(0.3))
                      ],
                    ),
                  ),
                );
              },
              tween: Tween(begin: 100.0, end: 250.0),
              // startPosition: 0,
            ),
            CustomAnimationBuilder<double>(
              control: Control.mirror,
              tween: Tween(begin: 170.0, end: 230.0),
              duration: const Duration(seconds: 2),
              startPosition: 0,
              builder: (BuildContext context, value, Widget? child) {
                return Positioned(
                  top: value / 2,
                  right: -value / 6.5,
                  // left: value / 25,
                  child: Container(
                    width: size.width / 2.5,
                    height: size.width / 3.5,
                    decoration: BoxDecoration(
                      color: AppColors.appBeigeColor,
                      shape: BoxShape.circle,
                      boxShadow: [
                        BoxShadow(
                            blurRadius: 6,
                            offset: const Offset(2, 7),
                            color: AppColors.appLightBlueColor.withOpacity(0.3))
                      ],
                    ),
                  ),
                );
              },
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
