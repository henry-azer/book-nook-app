import 'package:book_nook_app/core/utils/app_colors.dart';
import 'package:flutter/material.dart';

class Textform extends StatefulWidget {
  @override
  State<Textform> createState() => _TextformState();
}

class _TextformState extends State<Textform> {
  final TextEditingController emailcontroller = TextEditingController();
  final GlobalKey<FormState> _Formkey = GlobalKey<FormState>();
  @override
  Widget build(BuildContext context) {
    return Form(
      key: _Formkey,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Container(
            width: 330,
            height: 37,
            child: TextFormField(
              style: TextStyle(
                color: AppColors.white,
              ),
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
              keyboardType: TextInputType.emailAddress,
              textInputAction: TextInputAction.next,
              controller: emailcontroller,
            ),
          ),
        ],
      ),
    );
  }
}
