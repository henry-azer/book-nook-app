import 'package:book_nook_app/core/utils/app_colors.dart';
import 'package:book_nook_app/features/login/Presentation/widgets/text_form_field.dart';
import 'package:flutter/material.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({Key? key}) : super(key: key);

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.backGroundApp,
      body: Column(
        children: [
          Padding(
            padding: const EdgeInsets.only(left: 92, right: 92, top: 60),
            child: Container(
              child: Image.asset(
                'assets/images/Appbadge.png',
                height: 192,
                width: 192,
              ),
            ),
          ),
          Text(
            "Sign in",
            textAlign: TextAlign.center,
            style: TextStyle(
              color: AppColors.white,
              fontSize: 35.2,
              fontWeight: FontWeight.normal,
              fontFamily: 'Comfortaa-VariableFont_wght.ttf',
            ),
          ),
          SizedBox(
            height: 40,
          ),
          Textform(),
        ],
      ),
    );
  }
}
