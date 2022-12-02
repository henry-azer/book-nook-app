import 'package:book_nook_app/features/signup/Presentation/widgets/signupII_form_widget.dart';
import 'package:book_nook_app/features/signup/Presentation/widgets/signup_widget.dart';
import 'package:flutter/material.dart';
import 'package:book_nook_app/features/authentication/presentation/widgets/signin_form_widget.dart';
import 'package:book_nook_app/features/signup/Presentation/widgets/signup_form_widget.dart';
import 'package:flutter/material.dart';

import '../widgets/signup_widget.dart';

class SignupIIScreen extends StatefulWidget {
  const SignupIIScreen({Key? key}) : super(key: key);

  @override
  State<SignupIIScreen> createState() => _SignupIIScreenState();
}

class _SignupIIScreenState extends State<SignupIIScreen> {
  @override
  Widget build(BuildContext context) {
    return Material(
        child: Scaffold(
      body: SingleChildScrollView(
        child: Column(
          children:<Widget>[
            SignupWidget(),
            SignupFormIIWidget(),
          ],
        ),
      ),
    ));
  }
}
