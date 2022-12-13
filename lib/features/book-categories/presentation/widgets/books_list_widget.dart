import 'package:book_nook_app/core/utils/app_text_style.dart';
import 'package:book_nook_app/features/book-info/presentation/widgets/book_banner.dart';
import 'package:book_nook_app/features/book-categories/presentation/widgets/labeled_see_all_button.dart';
import 'package:flutter/material.dart';

class BooksListWidget extends StatefulWidget {
  final double height;
  final double width;
  final String url;

  const BooksListWidget({
    Key? key,
    required this.height,
    required this.width,
    required this.url,
  }) : super(key: key);

  @override
  State<BooksListWidget> createState() => _BooksListWidgetState();
}

class _BooksListWidgetState extends State<BooksListWidget> {
  List<String> booksName = [
    "Flutter",
    "The King",
    "Clean Code",
    "Java EE",
    "Harry Potter",
    "The Ring",
  ];

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        const Padding(
          padding: EdgeInsets.symmetric(horizontal: 35.0, vertical: 10.0),
          child: LabeledSeeAllButton(
            categoryName: "Books",
            buttonName: "See All",
          ),
        ),
        SizedBox(
          height: 208.5,
          width: 380,
          child: ListView.builder(
              itemCount: booksName.length,
              shrinkWrap: true,
              scrollDirection: Axis.horizontal,
              itemBuilder: (BuildContext context, int index) {
                return Column(
                  children: [
                    BookBanner(
                      height: widget.height,
                      width: widget.width,
                      url: widget.url,
                    ),
                    Text(
                      booksName[index],
                      style: AppTextStyle.cardvalue,
                    )
                  ],
                );
              }),
        ),
      ],
    );
  }
}
