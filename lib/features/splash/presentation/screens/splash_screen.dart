import 'dart:async';
import 'dart:ui';

import 'package:book_nook_app/core/utils/app_colors.dart';
import 'package:book_nook_app/core/utils/media_query_values.dart';
import 'package:book_nook_app/core/widgets/circle/beats_positioned_circle_widget.dart';
import 'package:flutter/material.dart';

import '../../../../config/routes/app_routes.dart';
import '../../../../core/widgets/logo_widget.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({Key? key}) : super(key: key);

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen>
    with TickerProviderStateMixin {
  late AnimationController _controller;
  late Animation<double> _animation;
  late Timer _timer;

  _goNext() => Navigator.pushReplacementNamed(context, Routes.welcome);

  _startDelay() {
    _timer = Timer(const Duration(milliseconds: 8000), () => _goNext());
  }

  @override
  void initState() {
    super.initState();
    _startDelay();
    _controller = AnimationController(
        duration: const Duration(milliseconds: 5000),
        vsync: this,
        value: 0,
        lowerBound: 0,
        upperBound: 1);
    _animation =
        CurvedAnimation(parent: _controller, curve: Curves.fastOutSlowIn);
    _controller.forward();
  }

  @override
  void dispose() {
    _controller.dispose();
    _timer.cancel();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Material(
      child: Scaffold(
        body: Stack(children: <Widget>[
          BeatsPositionedCircle(
              color: AppColors.circleSecondary,
              top: -72,
              left: -109,
              width: 176,
              height: 176,
              beatsPerMinute: 10),
          BeatsPositionedCircle(
              color: AppColors.circleSecondary,
              top: 132,
              left: context.width - 90,
              width: 107,
              height: 107,
              beatsPerMinute: 8),
          BeatsPositionedCircle(
              color: AppColors.circlePrimary,
              top: 186,
              left: -71,
              width: 280,
              height: 280,
              beatsPerMinute: 7),
          BeatsPositionedCircle(
              color: AppColors.circleSecondary,
              top: 330,
              left: 0,
              width: 76,
              height: 76,
              beatsPerMinute: 8),
          BeatsPositionedCircle(
              color: AppColors.circlePrimary,
              top: context.height - 340,
              left: 150,
              width: 170,
              height: 170,
              beatsPerMinute: 12),
          BeatsPositionedCircle(
              color: AppColors.circleSecondary,
              top: context.height - 130,
              left: -35,
              width: 176,
              height: 176,
              beatsPerMinute: 10),
          BeatsPositionedCircle(
              color: AppColors.circlePrimary,
              top: context.height - 80,
              left: 280,
              width: 40,
              height: 40,
              beatsPerMinute: 8),
          BackdropFilter(
            filter: ImageFilter.blur(sigmaX: 15, sigmaY: 15),
            child: Container(),
          ),
          Padding(
              padding: EdgeInsets.only(top: context.height / 4.5),
              child: FadeTransition(
                opacity: _animation,
                child: const LogoWidget(width: 400, height: 400),
              )),
        ]),
      ),
    );
  }
}
