import 'package:book_nook_app/core/utils/app_colors.dart';
import 'package:book_nook_app/core/utils/app_text_style.dart';
import 'package:book_nook_app/core/utils/app_values.dart';
import 'package:book_nook_app/core/validation/validation_types.dart';
import 'package:book_nook_app/core/widgets/forms/text_field_widget.dart';
import 'package:book_nook_app/features/authentication/presentation/cubit/signin_cubit.dart';
import 'package:book_nook_app/features/signup/Presentation/widgets/signupII_form_widget.dart';
import 'package:book_nook_app/features/signup/Presentation/widgets/signup_widget.dart';
import 'package:flutter/material.dart';

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
          children: const [
            SignupWidget(),
            SignupFormIIWidget(),
          ],
        ),
      ),
    ));
  }
}
