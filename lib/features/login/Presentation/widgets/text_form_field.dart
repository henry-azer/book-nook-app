import 'package:book_nook_app/core/utils/app_colors.dart';
import 'package:flutter/material.dart';

class Textform extends StatefulWidget {
  const Textform({Key? key}) : super(key: key);

  @override
  State<Textform> createState() => _TextformState();
}

class _TextformState extends State<Textform> {
  final TextEditingController emailcontroller = TextEditingController();
  final TextEditingController passcontroller = TextEditingController();
  final GlobalKey<FormState> _Formkey = GlobalKey<FormState>();
  @override
  Widget build(BuildContext context) {
    return Form(
      key: _Formkey,
      child: Column(
        children: [
          Container(
            width: 330,
            height: 37,
            decoration: BoxDecoration(borderRadius: BorderRadiusDirectional.circular(20)),
            child: TextFormField(
              decoration: InputDecoration(
                hintText: "Email",
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
              minLines: 1,
              controller: emailcontroller,
            ),
          ),
        ],
      ),
    );
  }
}
