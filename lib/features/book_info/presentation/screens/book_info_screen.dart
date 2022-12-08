import 'package:book_nook_app/features/book_info/presentation/widgets/bookinfo_widgetI.dart';
import 'package:book_nook_app/features/book_info/presentation/widgets/bookinfo_widgetII.dart';
import 'package:flutter/material.dart';

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
        extendBodyBehindAppBar: true,
        body: Column(
          children: const [
            BookInfoWidgetI(),
            BookInfoWidgetII(),
          ],
        ),
      ),
    );
  }
}
/*
 PositionedCircle(
          color: AppColors.circlePrimary,
          top: -119,
          left: -119,
          width: 442,
          height: 655,
        ),
*/
