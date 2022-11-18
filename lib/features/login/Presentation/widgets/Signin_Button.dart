import 'package:book_nook_app/core/utils/app_colors.dart';
import 'package:book_nook_app/core/utils/assets_manager.dart';
import 'package:book_nook_app/features/login/Presentation/widgets/text_form_field_email.dart';
import 'package:book_nook_app/features/login/Presentation/widgets/text_form_field_password.dart';
import 'package:flutter/material.dart';

class Signinbutton extends StatefulWidget {
  const Signinbutton({Key? key}) : super(key: key);

  @override
  State<Signinbutton> createState() => _SigninbuttonState();
}

class _SigninbuttonState extends State<Signinbutton> {
  @override
  Widget build(BuildContext context) {
    return Container(
        width: 375,
        height: 45,
        child: Stack(
          children: [
            Center(
              child: Container(
                width: 330,
                height: 47,
                child: ElevatedButton(
                  style: ElevatedButton.styleFrom(
                      backgroundColor: AppColors.textFormBorder,
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(29),
                      )),
                  onPressed: () {
                    if (Formkey.currentState!.validate()) {
                      print(emailcontroller);
                      print(passcontroller);
                    } else {
                      return null;
                    }
                  },
                  child: Text(
                    "Sign in",
                    style: TextStyle(
                        fontSize: 25,
                        fontWeight: FontWeight.w500,
                        fontFamily: 'Barlow-Black.ttf'),
                  ),
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(right: 50),
              child: Container(
                height: 120,
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.end,
                  children: [
                    Image.asset(
                      ImgAssets.subtract,
                      height: 120,
                    ),
                  ],
                ),
              ),
            ),
          ],
        ));
  }
}
//ButtonStyle(
//                   backgroundColor:MaterialStateProperty.all(AppColors.textFormBorder),
//                   shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(29))
//                 ),
