import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import '../../../../config/routes/app_routes.dart';
import '../../../../core/utils/app_colors.dart';
import '../../../../core/utils/assets_manager.dart';

class UserRecommendedBooksScreen extends StatefulWidget {
  const UserRecommendedBooksScreen({Key? key}) : super(key: key);

  @override
  State<UserRecommendedBooksScreen> createState() => _UserRecommendedBooksScreenState();
}

class _UserRecommendedBooksScreenState extends State<UserRecommendedBooksScreen> {

    @override
    Widget build(BuildContext context) {
    return Material(
      child: Scaffold(
        extendBody: true,
        resizeToAvoidBottomInset: true,
        appBar: PreferredSize(
          preferredSize: const Size.fromHeight(80.0), // here the desired height
          child: AppBar(
            centerTitle: false,
            leading: Padding(
              padding: const EdgeInsets.only(top: 22.0, left: 35.0),
              child: IconButton(
                icon: Icon(Icons.arrow_back, color: AppColors.white),
                onPressed: () => Navigator.of(context).pop(),
              ),
            ),
            actions: [
              Padding(
                padding: const EdgeInsets.only(top: 25.0, right: 35.0),
                child: GestureDetector(
                  onTap: () {
                    Navigator.pushReplacementNamed(context, Routes.userProfile);
                  },
                  child: Image.asset(
                    ImgAssets.user,
                    width: 50,
                    height: 50,
                  ),
                ),
              ),
            ],
          ),
        ),
        body: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: const <Widget>[
              // TODO : implement grid view recommended books
            ],
          ),
        ),
      ),
    );
  }
}
