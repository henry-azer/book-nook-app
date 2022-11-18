import 'package:book_nook_app/core/utils/app_colors.dart';
import 'package:flutter/material.dart';

class Textform extends StatefulWidget {
  @override
  State<Textform> createState() => _TextformState();
}

final TextEditingController emailcontroller = TextEditingController();
GlobalKey<FormState> Formkey = GlobalKey<FormState>();

class _TextformState extends State<Textform> {
  @override
  Widget build(BuildContext context) {
    return Form(
      key: Formkey,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          const SizedBox(height: 91),
          Container(
            width: 330,
            height: 50,
            child: TextFormField(
              decoration: InputDecoration(
                hintText: "Email",
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
              style: TextStyle(
                color: AppColors.white,
              ),
              keyboardType: TextInputType.emailAddress,
              textInputAction: TextInputAction.next,
              controller: emailcontroller,
              validator: (value) {
                if (value == null || value.isEmpty) {
                  return "Please Enter your Email";
                } else if (value.contains("@gmail.com") == false &&
                    value.isNotEmpty) {
                  return "No way Your email very weak or missing something";
                } else if (value.contains("@gmail.com") == true &&
                    value.isNotEmpty) {
                  return null;
                }
              },
            ),
          ),
        ],
      ),
    );
  }
}
