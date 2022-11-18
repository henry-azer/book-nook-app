import 'package:book_nook_app/core/utils/app_colors.dart';
import 'package:flutter/material.dart';

class Passtextform extends StatefulWidget {
  const Passtextform({Key? key}) : super(key: key);

  @override
  State<Passtextform> createState() => _PasstextformState();
}

final TextEditingController passcontroller = TextEditingController();
final GlobalKey<FormState> _Formkey = GlobalKey<FormState>();

class _PasstextformState extends State<Passtextform> {
  @override
  Widget build(BuildContext context) {
    return Form(
      key: _Formkey,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Container(
            width: 330,
            height: 50,
            child: TextFormField(
              keyboardType: TextInputType.emailAddress,
              style: TextStyle(
                color: AppColors.white,
              ),
              textInputAction: TextInputAction.next,
              validator: (value) {
                if (value == null || value.isEmpty) {
                  return "Please Enter your Password";
                } else if (value.length < 10) {
                  return "No way Your Password vary weak";
                } else {
                  return null;
                }
              },
              controller: passcontroller,
              obscureText: true,
              decoration: InputDecoration(
                hintText: "Password",
                hintStyle: TextStyle(
                  color: AppColors.white,
                  fontSize: 15,
                  fontWeight: FontWeight.w300,
                  fontFamily: 'Barlow-Black.ttf',
                ),
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(20),
                  borderSide: BorderSide(
                    color: AppColors.textFormBorder,
                  ),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
