import 'package:book_nook_app/core/utils/app_text_style.dart';
import 'package:flutter/material.dart';
import 'package:loading_animation_widget/loading_animation_widget.dart';

import '../../../../core/utils/app_colors.dart';
import '../../../../core/utils/assets_manager.dart';
import '../../../../data/entities/user/user.dart';

class ProfileBar extends StatefulWidget {
  final User? user;
  final bool loading;

  const ProfileBar({Key? key, required this.user, required this.loading})
      : super(key: key);

  @override
  State<ProfileBar> createState() => _ProfileBarState();
}

class _ProfileBarState extends State<ProfileBar> {
  @override
  Widget build(BuildContext context) {
    return Container(
      height: 200,
      decoration: BoxDecoration(
        color: AppColors.profileBarPrimary,
        borderRadius: const BorderRadius.only(
          bottomLeft: Radius.circular(150),
        ),
        border: Border.all(
          width: 3,
          color: AppColors.profileBarPrimary,
          style: BorderStyle.solid,
        ),
      ),
      child: Center(
        child: Padding(
          padding: const EdgeInsets.only(top: 20.0),
          child: Column(
            children: [
              Image.asset(
                ImgAssets.user,
                width: 100,
                height: 100,
              ),
              Padding(
                padding: const EdgeInsets.only(top: 20.0),
                child: widget.user == null
                    ? LoadingAnimationWidget.staggeredDotsWave(
                        color: Colors.white,
                        size: 40,
                      )
                    : Text(
                        "${widget.user?.firstName} ${widget.user?.lastName}",
                        style: AppTextStyle.profileName,
                      ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
