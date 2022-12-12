import 'package:book_nook_app/core/utils/app_text_style.dart';
import 'package:book_nook_app/core/widgets/appbar_widget.dart';
import 'package:book_nook_app/core/widgets/navigation_bar_widget.dart';
import 'package:book_nook_app/features/bookmark/presentation/widgets/rated_books.dart';
import 'package:flutter/material.dart';

class BookMarkScreen extends StatefulWidget {
  const BookMarkScreen({Key? key}) : super(key: key);

  @override
  State<BookMarkScreen> createState() => _BookMarkScreenState();
}

class _BookMarkScreenState extends State<BookMarkScreen> {
  @override
  Widget build(BuildContext context) {
    return Material(
      child: Scaffold(
        extendBody: true,
        resizeToAvoidBottomInset: true,
        bottomNavigationBar:
            NavigationBarWidget(path: ModalRoute.of(context)?.settings.name),
        body: SafeArea(
          child: SingleChildScrollView(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                AppBarWidget(),
                Padding(
                  padding: const EdgeInsets.only(left: 18),
                  child: Text(
                    "Rated Books",
                    style: AppTextStyle.bookmarkTitle,
                  ),
                ),
                SizedBox(
                  height: 37,
                ),
                Padding(
                  padding: const EdgeInsets.only(
                    left: 40,
                    right: 20,
                    bottom: 20,
                    top: 20,
                  ),
                  child: RatedBooks(),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
