import 'dart:async';

import 'package:book_nook_app/core/utils/app_colors.dart';
import 'package:flutter/material.dart';

import '../../../../config/routes/app_routes.dart';
import '../../../../core/widgets/logo_widget.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({Key? key}) : super(key: key);

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  late Timer _timer;

  _goNext() => Navigator.pushReplacementNamed(context, Routes.signin);

  _startDelay() {
    _timer = Timer(const Duration(milliseconds: 0), () => _goNext());
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
      backgroundColor: AppColors.background,
      body: const Padding(
        padding: EdgeInsets.symmetric(horizontal: 0, vertical: 190),
        child: LogoWidget(width: 400, height: 400),
      ),
    );
  }
}
