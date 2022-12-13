import 'package:book_nook_app/core/utils/app_text_style.dart';
import 'package:book_nook_app/core/widgets/app_bar_widget.dart';
import 'package:book_nook_app/core/widgets/navigation_bar_widget.dart';
import 'package:book_nook_app/features/user-rated-books/presentation/widgets/rated_books_widget.dart';
import 'package:flutter/material.dart';

class UserRatedBooksScreen extends StatefulWidget {
  const UserRatedBooksScreen({Key? key}) : super(key: key);

  @override
  State<UserRatedBooksScreen> createState() => _UserRatedBooksScreenState();
}

class _UserRatedBooksScreenState extends State<UserRatedBooksScreen> {
  @override
  Widget build(BuildContext context) {
    return Material(
      child: Scaffold(
        extendBody: true,
        resizeToAvoidBottomInset: true,
        bottomNavigationBar: NavigationBarWidget(path: ModalRoute.of(context)?.settings.name),
        body: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const AppBarWidget(),
              Center(
                child: Text(
                  "Rated Books",
                  style: AppTextStyle.bookmarkTitle,
                ),
              ),
              const Padding(
                padding: EdgeInsets.only(left: 50, right: 50, bottom: 20,),
                child: RatedBooksWidget(),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
