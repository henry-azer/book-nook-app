import 'package:book_nook_app/config/routes/app_routes.dart';
import 'package:book_nook_app/core/utils/app_colors.dart';
import 'package:book_nook_app/core/utils/assets_manager.dart';
import 'package:flutter/material.dart';

class AppBarWidget extends StatefulWidget {
  const AppBarWidget({Key? key}) : super(key: key);

  @override
  State<AppBarWidget> createState() => _AppBarWidgetState();
}

class _AppBarWidgetState extends State<AppBarWidget> {
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(left: 40, right: 40, top: 65, bottom: 20),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          IconButton(
            icon: Icon(Icons.arrow_back, color: AppColors.white),
            onPressed: () => Navigator.pop(context),
          ),
          GestureDetector(
            onTap: () {
              Navigator.pushReplacementNamed(context, Routes.userProfile);
            },
            child: Image.asset(
              ImgAssets.user,
              width: 35,
              height: 50,
            ),
          ),
        ],
      ),
    );
  }
}
