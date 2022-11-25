import 'package:book_nook_app/features/authentication/presentation/widgets/signin_form_widget.dart';
import 'package:book_nook_app/features/signup/Presentation/widgets/signup_form_widget.dart';
import 'package:flutter/material.dart';

import '../widgets/signup_widget.dart';

class SignupScreen extends StatefulWidget {
  const SignupScreen({Key? key}) : super(key: key);

  @override
  State<SignupScreen> createState() => _SignupScreenState();
}

class _SignupScreenState extends State<SignupScreen> {
  @override
  Widget build(BuildContext context) {
    return Material(
        child: Scaffold(
          body: SingleChildScrollView(
            child: Column(
              children: const [
                SignupWidget(),
                SignupFormWidget(),
              ],
            ),
          ),
        ));
  }
}