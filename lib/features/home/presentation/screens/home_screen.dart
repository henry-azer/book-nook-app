import 'package:book_nook_app/core/utils/app_text_style.dart';
import 'package:book_nook_app/core/widgets/navigation_bar_widget.dart';
import 'package:book_nook_app/features/home/presentation/cubit/recommended_books_cubit.dart';
import 'package:book_nook_app/features/home/presentation/cubit/recommended_books_state.dart';
import 'package:book_nook_app/features/home/presentation/widgets/book_slider_widget.dart';
import 'package:book_nook_app/features/user-profile/presentation/cubit/user_profile_cubit.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:loading_animation_widget/loading_animation_widget.dart';

import '../../../../config/locale/app_localizations.dart';
import '../../../../config/routes/app_routes.dart';
import '../../../../core/utils/assets_manager.dart';
import '../../../../core/utils/constants.dart';
import '../widgets/book_outlined_card_widget.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  @override
  void initState() {
    super.initState();
    _getCurrentUser();
    _getRecommendedBooks();
  }

  _getCurrentUser() =>
      BlocProvider.of<UserProfileCubit>(context).findCurrentUser();

  _getRecommendedBooks() =>
      BlocProvider.of<RecommendedBooksCubit>(context).findRecommendedBooks();

  @override
  Widget build(BuildContext context) {
    return Material(
      child: Scaffold(
        appBar: AppBar(
          centerTitle: false,
          title: Padding(
            padding: const EdgeInsets.only(top: 30.0, left: 30.0),
            child: BlocConsumer<UserProfileCubit, UserProfileState>(
              builder: ((context, state) {
                if (state is UserProfileLoading) {
                  return Padding(
                    padding: const EdgeInsets.only(top: 5),
                    child: LoadingAnimationWidget.staggeredDotsWave(
                      color: Colors.white,
                      size: 40,
                    ),
                  );
                } else if (state is UserProfileSuccess) {
                  return Text("${AppLocalizations.of(context)!.translate('hello')!}, ${state.user.firstName} ${state.user.lastName}",
                    style: AppTextStyle.appbarTitle,
                  );
                } else {
                  return Text(AppLocalizations.of(context)!.translate('hello_guest')!,
                    style: AppTextStyle.appbarTitle,
                  );
                }
              }),
              listener: ((context, state) {
                if (state is UserProfileError) {
                  Constants.showSnackBar(context: context, message: AppLocalizations.of(context)!.translate('something_wrong')!);
                  Navigator.pushReplacementNamed(context, Routes.signin);
                }
              }),
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
        extendBody: true,
        resizeToAvoidBottomInset: true,
        bottomNavigationBar: NavigationBarWidget(path: ModalRoute.of(context)?.settings.name),
        body: SingleChildScrollView(
          padding: const EdgeInsets.only(bottom: 80.0),
          child: Column(
            children: [
              Padding(
                padding: const EdgeInsets.only(left: 15.0, right: 15.0, top: 40.0),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text(
                          AppLocalizations.of(context)!.translate('book')!,
                          style: AppTextStyle.homeTitle,
                        ),
                        Padding(
                          padding: const EdgeInsets.only(left: 10.0),
                          child: Text(
                            AppLocalizations.of(context)!.translate('of_the_day')!,
                            style: AppTextStyle.homeSubtitle,
                          ),
                        )
                      ],
                    ),
                  ],
                ),
              ),
              // TODO : implement book of the day cubit
              BlocConsumer<RecommendedBooksCubit, RecommendedBooksState>(
                builder: ((context, state) {
                  if (state is RecommendedBooksLoading) {
                    return Padding(
                      padding: const EdgeInsets.symmetric(vertical: 60),
                      child: LoadingAnimationWidget.staggeredDotsWave(
                        color: Colors.white,
                        size: 40,
                      ),
                    );
                  } else if (state is RecommendedBooksSuccess) {
                    return BookOutlinedCardWidget(book: state.recommendedBooksResponse.body.elementAt(8));
                  } else {
                    return Container();
                  }
                }),
                listener: ((context, state) {
                  if (state is RecommendedBooksError) {
                    Constants.showErrorDialog(context: context, message: state.message);
                  }
                }),
              ),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 15.0, vertical: 10.0),
                child: Row(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                      AppLocalizations.of(context)!.translate('books_for_you')!,
                      style: AppTextStyle.categoryTitle,
                    ),
                    TextButton(
                      onPressed: () {
                        // TODO : navigate to all recommended books screen
                      },
                      child: Text(
                        AppLocalizations.of(context)!.translate('more')!,
                        style: AppTextStyle.categoryDecoratedTitle,
                      ),
                    )
                  ],
                ),
              ),
              BlocConsumer<RecommendedBooksCubit, RecommendedBooksState>(
                builder: ((context, state) {
                  if (state is RecommendedBooksLoading) {
                    return Padding(
                      padding: const EdgeInsets.only(top: 110),
                      child: LoadingAnimationWidget.threeArchedCircle(
                        color: Colors.white,
                        size: 100,
                      ),
                    );
                  } else if (state is RecommendedBooksSuccess) {
                    return BookSliderWidget(
                      books:
                          state.recommendedBooksResponse.body.sublist(0, 7),
                    );
                  } else {
                    return Container();
                  }
                }),
                listener: ((context, state) {
                  if (state is RecommendedBooksError) {
                    Constants.showErrorDialog(
                        context: context, message: state.message);
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
