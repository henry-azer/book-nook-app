import 'package:book_nook_app/features/signup/Presentation/widgets/signup_form_II_widget.dart';
import 'package:book_nook_app/features/signup/Presentation/widgets/signup_widget.dart';
import 'package:flutter/material.dart';

class SignupScreenII extends StatefulWidget {
  const SignupScreenII({Key? key}) : super(key: key);

  @override
  State<SignupScreenII> createState() => _SignupScreenIIState();
}

class _SignupScreenIIState extends State<SignupScreenII> {
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
            SignupFormIIWidget(),
          ],
        ),
      ),
    ));
  }
}
