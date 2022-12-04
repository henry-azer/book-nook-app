import 'package:book_nook_app/features/signup/Presentation/widgets/signup_user_form_widget.dart';
import 'package:flutter/material.dart';

import '../widgets/signup_widget.dart';

class SignupUserInfoScreen extends StatefulWidget {
  const SignupUserInfoScreen({Key? key}) : super(key: key);

  @override
  State<SignupUserInfoScreen> createState() => _SignupUserInfoScreenState();
}

class _SignupUserInfoScreenState extends State<SignupUserInfoScreen> {
  @override
  Widget build(BuildContext context) {
    return Material(
        child: Scaffold(
      body: SingleChildScrollView(
        child: Column(
          children: const <Widget>[
            SignupWidget(),
            SignupUserFormWidget(),
          ],
        ),
      ),
    ));
  }
}
