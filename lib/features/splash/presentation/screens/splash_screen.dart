import 'dart:async';
import 'dart:ui';

import 'package:book_nook_app/core/utils/app_colors.dart';
import 'package:flutter/material.dart';

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
            Positioned(
              top: -size.width / 4,
              left: -size.width / 6,
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
            ),
            Positioned(
              top: size.width / 2.7,
              left: -size.width / 4.5,
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
            ),
            Positioned(
              top: size.width / 2,
              left: -size.width / 50,
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
            ),
            Positioned(
              bottom: -size.width / 6,
              left: -size.width / 9,
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
            ),
            Positioned(
              bottom: size.width / 3.5,
              right: -size.width / 4,
              left: size.width / 25,
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
            ),
            Positioned(
              bottom: size.width / 15,
              right: -size.width / 1.5,
              left: size.width / 25,
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
            ),
            Positioned(
              top: size.width / 3,
              right: -size.width / 1.5,
              left: size.width / 25,
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
