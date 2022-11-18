import 'dart:async';
import 'dart:ui';

import 'package:book_nook_app/core/utils/app_colors.dart';
import 'package:flutter/material.dart';
import 'package:simple_animations/animation_builder/custom_animation_builder.dart';
import 'package:simple_animations/animation_builder/play_animation_builder.dart';

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
    return Scaffold(
      backgroundColor: AppColors.appBackgroundColor,
      body: Center(
        child: Stack(
          children: [
            CustomAnimationBuilder(
              builder: (context, value, child) {
                return Positioned(
                  top: -value / 2,
                  left: -value / 2.5,
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
              duration: const Duration(seconds: 1),
              tween: Tween(begin: 100.0, end: 200.0),
              startPosition: 0,
            ),
            CustomAnimationBuilder(
              builder: (context, value, child) {
                return Positioned(
                  top: value / 1.3,
                  left: -value / 3.0,
                  child: Container(
                    width: size.width / 1.5,
                    height: size.width / 1.5,
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
              duration: const Duration(seconds: 2),
              tween: Tween(begin: 100.0, end: 200.0),
              startPosition: 0,
            ),
            CustomAnimationBuilder(
              builder: (BuildContext context, value, Widget? child) {
                return Positioned(
                  top: value / 1.1,
                  left: -value / 40,
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
              duration: const Duration(seconds: 2),
              tween: Tween(begin: 100.0, end: 200.0),
              startPosition: 0,
            ),
            CustomAnimationBuilder(
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
              duration: const Duration(seconds: 2),
              tween: Tween(begin: 100.0, end: 200.0),
              startPosition: 0,
            ),
            CustomAnimationBuilder(
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
              duration: const Duration(seconds: 2),
              tween: Tween(begin: 100.0, end: 200.0),
              startPosition: 0,
            ),
            CustomAnimationBuilder(
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
              duration: const Duration(seconds: 2),
              tween: Tween(begin: 100.0, end: 200.0),
              startPosition: 0,
            ),
            CustomAnimationBuilder(
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
              duration: const Duration(seconds: 2),
              tween: Tween(begin: 100.0, end: 200.0),
              startPosition: 0,
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
