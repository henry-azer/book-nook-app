import 'package:book_nook_app/core/utils/app_colors.dart';
import 'package:book_nook_app/core/utils/app_text_style.dart';
import 'package:book_nook_app/features/book-info/presentation/widgets/book_banner.dart';
import 'package:book_nook_app/features/categories/presentation/widgets/category_name.dart';
import 'package:flutter/material.dart';

class ListOfCategories extends StatefulWidget {
  final double height;
  final double width;
  final String url;
  final String text;
  const ListOfCategories({
    Key? key,
    required this.height,
    required this.width,
    required this.url,
    required this.text,
  }) : super(key: key);

  @override
  State<ListOfCategories> createState() => _ListOfCategoriesState();
}

class _ListOfCategoriesState extends State<ListOfCategories> {
  List<String> categoriesName = [
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
          child:
              CategoryName(categoryName: "Categories", buttonName: "See All"),
        ),
        Container(
          height: 208.5,
          width: 380,
          child: ListView.builder(
              itemCount: categoriesName.length,
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
                                categoriesName[index],
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
