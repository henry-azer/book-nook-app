import 'package:book_nook_app/core/utils/app_text_style.dart';
import 'package:book_nook_app/features/book-info/presentation/widgets/book_banner.dart';
import 'package:book_nook_app/features/categories/presentation/widgets/category_name.dart';
import 'package:flutter/material.dart';

class ListBooks extends StatefulWidget {
  final double height;
  final double width;
  final String url;
  const ListBooks({
    Key? key,
    required this.height,
    required this.width,
    required this.url,
  }) : super(key: key);

  @override
  State<ListBooks> createState() => _ListBooksState();
}

class _ListBooksState extends State<ListBooks> {
  List<String> booksName = [
    "Mohamed",
    "Ahmed",
    "Hassan",
    "Anwar",
    "Sayed",
    "Amr",
  ];
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Padding(
          padding: const EdgeInsets.only(left: 25.0),
          child: CategoryName(
            categoryName: "Books for you",
            buttonName: "See All",
          ),
        ),
        Container(
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
