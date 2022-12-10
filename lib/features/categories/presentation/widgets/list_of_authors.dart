import 'package:book_nook_app/core/utils/app_colors.dart';
import 'package:book_nook_app/core/utils/app_text_style.dart';
import 'package:book_nook_app/features/book-info/presentation/widgets/book_banner.dart';
import 'package:book_nook_app/features/categories/presentation/widgets/category_name.dart';
import 'package:flutter/material.dart';

class ListOfAuthors extends StatefulWidget {
  final double height;
  final double width;
  final String url;
  final String text;
  const ListOfAuthors(
      {Key? key,
      required this.height,
      required this.width,
      required this.url,
      required this.text})
      : super(key: key);

  @override
  State<ListOfAuthors> createState() => _ListOfAuthorsState();
}

class _ListOfAuthorsState extends State<ListOfAuthors> {
  List<String> authorsName = [
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
          padding: const EdgeInsets.all(25.0),
          child: CategoryName(
            categoryName: "Authors",
            buttonName: "See All",
          ),
        ),
        Container(
          height: 208.5,
          width: 380,
          child: ListView.builder(
              itemCount: authorsName.length,
              shrinkWrap: true,
              scrollDirection: Axis.horizontal,
              itemBuilder: (BuildContext context, int index) {
                return Column(
                  children: [
                    Stack(
                      children: [
                        BookBanner(
                          height: widget.height,
                          width: widget.width,
                          url: widget.url,
                        ),
                        Padding(
                          padding: const EdgeInsets.all(18.0),
                          child: Container(
                            height: widget.height,
                            width: widget.width,
                            color: AppColors.circlePrimary.withOpacity(0.9),
                            child: Center(
                              child: Text(
                                authorsName[index],
                                style: AppTextStyle.cardvalue,
                              ),
                            ),
                          ),
                        ),
                      ],
                    ),
                  ],
                );
              }),
        ),
      ],
    );
  }
}
