import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:loading_animation_widget/loading_animation_widget.dart';

import '../../../../config/locale/app_localizations.dart';
import '../../../../config/routes/app_routes.dart';
import '../../../../core/utils/app_text_style.dart';
import '../../../../core/utils/constants.dart';
import '../../../../core/widgets/shape_widget.dart';
import '../../../user-profile/presentation/cubit/user_profile_cubit.dart';

class UserWelcomeScreen extends StatefulWidget {
  const UserWelcomeScreen({Key? key}) : super(key: key);

  @override
  State<UserWelcomeScreen> createState() => _UserWelcomeScreenState();
}

class _UserWelcomeScreenState extends State<UserWelcomeScreen> {
  late Timer _timer;

  @override
  void initState() {
    super.initState();
    _startDelay();
    _getCurrentUser();
  }

  @override
  void dispose() {
    _timer.cancel();
    super.dispose();
  }

  _startDelay() {
    _timer = Timer(const Duration(milliseconds: 4000), () => _goNext());
  }

  _goNext() => {Navigator.pushReplacementNamed(context, Routes.appHome)};

  _getCurrentUser() =>
      BlocProvider.of<UserProfileCubit>(context).findCurrentUser();

  @override
  Widget build(BuildContext context) {
    return Material(
        child: Scaffold(
      body: SingleChildScrollView(
        child: Center(
          child: Padding(
            padding: const EdgeInsets.only(top: 220),
            child: Column(
              children: [
                const ShapeWidget(
                  width: 220,
                  height: 220,
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text(
                      "Hello, ",
                      style: AppTextStyle.helloTitle,
                    ),
                    BlocConsumer<UserProfileCubit, UserProfileState>(
                      builder: ((context, state) {
                        if (state is UserProfileLoading) {
                          return Padding(
                            padding: const EdgeInsets.only(top: 5),
                            child: LoadingAnimationWidget.staggeredDotsWave(
                              color: Colors.white,
                              size: 30,
                            ),
                          );
                        } else if (state is UserProfileSuccess) {
                          return Text(
                            "${state.user.firstName} ${state.user.lastName}",
                            style: AppTextStyle.helloTitleSecondary,
                          );
                        } else {
                          return Text(
                            AppLocalizations.of(context)!.translate('guest')!,
                            style: AppTextStyle.helloTitleSecondary,
                          );
                        }
                      }),
                      listener: ((context, state) {
                        if (state is UserProfileError) {
                          Constants.showSnackBar(
                              context: context,
                              message: AppLocalizations.of(context)!
                                  .translate('something_wrong')!);
                          Navigator.pushReplacementNamed(
                              context, Routes.signin);
                        }
                      }),
                    ),
                  ],
                ),
                Padding(
                  padding: const EdgeInsets.only(top: 10.0),
                  child: Column(
                    children: [
                      Text(
                        "We choose our books specially for you",
                        style: AppTextStyle.fieldLabel,
                      ),
                      Text(
                        "with all our careness.",
                        style: AppTextStyle.fieldLabel,
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    ));
  }
}
