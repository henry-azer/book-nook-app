import 'package:book_nook_app/features/book-info/presentation/widgets/book_info_widget.dart';
import 'package:flutter/material.dart';

import '../../../../core/widgets/app_bar_widget.dart';

class BookInfoScreen extends StatefulWidget {
  const BookInfoScreen({Key? key}) : super(key: key);

  @override
  State<BookInfoScreen> createState() => _BookInfoScreenState();
}

class _BookInfoScreenState extends State<BookInfoScreen> {

  @override
  Widget build(BuildContext context) {
    return Material(
      child: Scaffold(
        extendBody: true,
        resizeToAvoidBottomInset: true,
        body: SingleChildScrollView(
          child: Column(
            children: const [
              AppBarWidget(),
              BookInfo(),
            ],
          ),
        ),
      ),
    );
  }
}