import 'package:book_nook_app/features/authentication/presentation/widgets/signin_form_widget.dart';
import 'package:flutter/material.dart';

import '../widgets/signin_widget.dart';

class SigninScreen extends StatefulWidget {
  const SigninScreen({Key? key}) : super(key: key);

  @override
  State<SigninScreen> createState() => _SigninScreenState();
}

class _SigninScreenState extends State<SigninScreen> {
  @override
  Widget build(BuildContext context) {
    return Material(
        child: Scaffold(
          body: SingleChildScrollView(
            child: Column(
              children: const [SigninWidget(), SigninFormWidget()],
            ),
          ),
        ));
  }
}
