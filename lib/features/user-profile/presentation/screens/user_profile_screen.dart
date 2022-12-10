import 'package:book_nook_app/core/widgets/buttons/button_form_widget.dart';
import 'package:book_nook_app/core/widgets/navigation_bar_widget.dart';
import 'package:book_nook_app/features/user-profile/presentation/cubit/user_profile_cubit.dart';
import 'package:book_nook_app/features/user-profile/presentation/widgets/user_profile_bar.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:loading_animation_widget/loading_animation_widget.dart';

import '../../../../config/locale/app_localizations.dart';
import '../../../../config/routes/app_routes.dart';
import '../../../../core/utils/app_text_style.dart';
import '../../../../core/utils/constants.dart';
import '../cubit/signout_cubit.dart';
import '../cubit/signout_state.dart';
import '../widgets/user_profile_form.dart';

class UserProfileScreen extends StatefulWidget {
  const UserProfileScreen({Key? key}) : super(key: key);

  @override
  State<UserProfileScreen> createState() => _UserProfileScreenState();
}

class _UserProfileScreenState extends State<UserProfileScreen> {
  @override
  void initState() {
    super.initState();
    _getCurrentUser();
  }

  _getCurrentUser() =>
      BlocProvider.of<UserProfileCubit>(context).findCurrentUser();

  @override
  Widget build(BuildContext context) {
    return Material(
      child: Scaffold(
        extendBody: true,
        resizeToAvoidBottomInset: true,
        bottomNavigationBar:
            NavigationBarWidget(path: ModalRoute.of(context)?.settings.name),
        body: SingleChildScrollView(
          child: Column(
            children: [
              BlocConsumer<UserProfileCubit, UserProfileState>(
                builder: ((context, state) {
                  if (state is UserProfileLoading) {
                    return Column(
                      children: [
                        const Padding(
                          padding: EdgeInsets.only(top: 50),
                          child: UserProfileBar(
                            user: null,
                            loading: true,
                          ),
                        ),
                        Padding(
                          padding:
                              const EdgeInsets.only(top: 20.0, bottom: 30.0),
                          child: SizedBox(
                            height: 419,
                            child: LoadingAnimationWidget.threeArchedCircle(
                              color: Colors.white,
                              size: 80,
                            ),
                          ),
                        ),
                      ],
                    );
                  } else if (state is UserProfileSuccess) {
                    return Column(
                      children: [
                        Padding(
                          padding: const EdgeInsets.only(top: 50),
                          child:
                              UserProfileBar(user: state.user, loading: false),
                        ),
                        Padding(
                          padding: const EdgeInsets.only(bottom: 30.0),
                          child: UserProfileForm(user: state.user),
                        ),
                        BlocConsumer<SignoutCubit, SignoutState>(
                          builder: ((context, state) {
                            if (state is SignoutLoading) {
                              return ButtonFormWidget(
                                  child:
                                      LoadingAnimationWidget.staggeredDotsWave(
                                    color: Colors.white,
                                    size: 40,
                                  ),
                                  onPress: () {});
                            } else {
                              return ButtonFormWidget(
                                  child: Text(
                                    AppLocalizations.of(context)!
                                        .translate('logout')!,
                                    style: AppTextStyle.button,
                                  ),
                                  onPress: () {
                                    BlocProvider.of<SignoutCubit>(context)
                                        .signout();
                                  });
                            }
                          }),
                          listener: ((context, state) {
                            if (state is SignoutSuccess) {
                              Constants.showSnackBar(
                                  context: context,
                                  message: state.signoutResponse.message);
                              Navigator.pushReplacementNamed(
                                  context, Routes.signin);
                            }
                            if (state is SignoutError) {
                              Constants.showSnackBar(
                                  context: context, message: state.message);
                            }
                          }),
                        ),
                      ],
                    );
                  } else {
                    return Container();
                  }
                }),
                listener: ((context, state) {
                  if (state is UserProfileError) {
                    Constants.showSnackBar(
                        context: context,
                        message: AppLocalizations.of(context)!
                            .translate('something_wrong')!);
                    Navigator.pushReplacementNamed(context, Routes.signin);
                  }
                }),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
