import 'package:book_nook_app/core/utils/app_colors.dart';
import 'package:book_nook_app/core/utils/app_text_style.dart';
import 'package:book_nook_app/features/book-info/presentation/widgets/book_banner.dart';
import 'package:book_nook_app/features/book-categories/presentation/widgets/labeled_see_all_button.dart';
import 'package:flutter/material.dart';

class CategoriesListWidget extends StatefulWidget {
  final double height;
  final double width;
  final String url;
  final String text;

  const CategoriesListWidget({
    Key? key,
    required this.height,
    required this.width,
    required this.url,
    required this.text,
  }) : super(key: key);

  @override
  State<CategoriesListWidget> createState() => _CategoriesListWidgetState();
}

class _CategoriesListWidgetState extends State<CategoriesListWidget> {
  List<String> categoriesName = [
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
          child:
              LabeledSeeAllButton(categoryName: "Categories", buttonName: "See All"),
        ),
        SizedBox(
          height: 208,
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
