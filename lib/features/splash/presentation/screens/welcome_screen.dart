import 'dart:async';
import 'dart:ui';

import 'package:book_nook_app/core/utils/app_colors.dart';
import 'package:flutter/material.dart';

import '../../../../core/widgets/circles_widget.dart';

class WelcomeScreen extends StatefulWidget {
  const WelcomeScreen({super.key});

  @override
  State<WelcomeScreen> createState() => _WelcomeScreenState();
}

class _WelcomeScreenState extends State<WelcomeScreen> {
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
              width: 200,
              height: 200,
              topPostion: -60,
              leftPostion: -90,
            ),
            Circles(
              color: AppColors.appLightBlueColor,
              width: 100,
              height: 100,
              topPostion: 430,
              leftPostion: -70,
            ),
            Circles(
              color: AppColors.appLightBlueColor,
              width: 100,
              height: 100,
              topPostion: 90,
              leftPostion: 380,
            ),
            BackdropFilter(
              filter: ImageFilter.blur(sigmaX: 10, sigmaY: 10),
              child: Container(),
            ),
            Padding(
              padding: const EdgeInsets.only(top: 290.0, left: 30),
              child: Row(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  RichText(
                    text: TextSpan(
                      children: [
                        TextSpan(
                          text: 'Enjoy Watching \n',
                          style: TextStyle(
                            color: AppColors.appBeigeColor,
                            fontWeight: FontWeight.bold,
                            fontSize: 38,
                          ),
                        ),
                        TextSpan(
                          text: 'the Whole World\n',
                          style: TextStyle(
                            color: AppColors.appBeigeColor,
                            fontWeight: FontWeight.bold,
                            fontSize: 38,
                          ),
                        ),
                        TextSpan(
                          text:
                              'Enjoy the best recommenditions, books collection,\n',
                          style: TextStyle(
                            color: AppColors.white,
                            fontWeight: FontWeight.bold,
                            fontSize: 14,
                          ),
                        ),
                        TextSpan(
                          text: 'books authors\' and all books inforamtions.',
                          style: TextStyle(
                            color: AppColors.white,
                            fontWeight: FontWeight.bold,
                            fontSize: 14,
                          ),
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ),
            const Spacer(),
            Padding(
              padding: const EdgeInsets.only(bottom: 130.0, left: 30),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.end,
                children: [
                  Text(
                    'Discover the whole world',
                    style: TextStyle(
                      color: AppColors.white,
                      fontWeight: FontWeight.bold,
                      fontSize: 16,
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
