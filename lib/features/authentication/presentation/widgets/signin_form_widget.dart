import 'package:book_nook_app/core/utils/app_colors.dart';
import 'package:book_nook_app/core/widgets/forms/text_field_widget.dart';
import 'package:flutter/material.dart';

import '../../../../config/routes/app_routes.dart';
import '../../../../core/widgets/buttons/button_form_widget.dart';

class SigninFormWidget extends StatefulWidget {
  const SigninFormWidget({Key? key}) : super(key: key);

  @override
  State<SigninFormWidget> createState() => _SigninFormWidgetState();
}

class _SigninFormWidgetState extends State<SigninFormWidget> {
  GlobalKey<FormState> formkey = GlobalKey<FormState>();

  String? validatePassword(String value) {
    if (value.isEmpty) {
      return "* Required";
    } else if (value.length < 6) {
      return "Password should be at least 8 characters";
    } else {
      return null;
    }
  }

  @override
  Widget build(BuildContext context) {
    return Material(
      color: Colors.transparent,
      child: Form(
        autovalidateMode: AutovalidateMode.onUserInteraction,
        key: formkey,
        child: Column(
          children: <Widget>[
            const Padding(
                padding: EdgeInsets.fromLTRB(22, 10, 22, 0),
                child: TextFieldWidget(
                  label: 'Email',
                  keyboardType: TextInputType.emailAddress,
                )),
            const Padding(
                padding: EdgeInsets.fromLTRB(22, 25, 22, 0),
                child: TextFieldWidget(
                  label: 'Password',
                  keyboardType: TextInputType.visiblePassword,
                )),
            const Padding(
                padding: EdgeInsets.fromLTRB(20, 65, 20, 0),
                child: ButtonFormWidget()),
            Padding(
              padding: const EdgeInsets.only(top: 40),
              child: TextButton(
                  onPressed: () {
                    Navigator.pushReplacementNamed(
                        context, Routes.initialRoute);
                  },
                  child: Text(
                    "Create a new account?",
                    style: TextStyle(
                        color: AppColors.fontPrimary,
                        fontSize: 15,
                        decoration: TextDecoration.underline),
                  )),
            )

            // validator: MultiValidator([
            //   RequiredValidator(errorText: "Required"),
            //   EmailValidator(errorText: "Invalid email"),
            // ])
          ],
        ),
      ),
    );
  }
}
