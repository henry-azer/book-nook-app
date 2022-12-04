// ignore_for_file: file_names
import 'package:book_nook_app/features/signup/Presentation/widgets/signup_account_form_widget.dart';
import 'package:book_nook_app/features/signup/Presentation/widgets/signup_widget.dart';
import 'package:flutter/material.dart';

class SignupAccountInfoScreen extends StatefulWidget {
  const SignupAccountInfoScreen({Key? key}) : super(key: key);

  @override
  State<SignupAccountInfoScreen> createState() => _SignupAccountInfoScreenState();
}

class _SignupAccountInfoScreenState extends State<SignupAccountInfoScreen> {
  @override
  Widget build(BuildContext context) {
    return Material(
        child: Scaffold(
      extendBody: true,
      extendBodyBehindAppBar: true,
      appBar: AppBar(
        leading: IconButton(
          icon: const Icon(Icons.arrow_back),
          onPressed: () {
            Navigator.pop(context);
          },
        ),
      ),
      body: SingleChildScrollView(
        child: Column(
          children: const [
            SignupWidget(),
            SignupAccountFormWidget(),
          ],
        ),
      ),
    ));
  }
}
