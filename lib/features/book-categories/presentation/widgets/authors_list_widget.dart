import 'package:book_nook_app/core/utils/app_colors.dart';
import 'package:book_nook_app/core/utils/app_text_style.dart';
import 'package:book_nook_app/features/book-info/presentation/widgets/book_banner.dart';
import 'package:book_nook_app/features/book-categories/presentation/widgets/labeled_see_all_button.dart';
import 'package:flutter/material.dart';

class AuthorsListWidget extends StatefulWidget {
  final double height;
  final double width;
  final String url;
  final String text;
  const AuthorsListWidget(
      {Key? key,
      required this.height,
      required this.width,
      required this.url,
      required this.text})
      : super(key: key);

  @override
  State<AuthorsListWidget> createState() => _AuthorsListWidgetState();
}

class _AuthorsListWidgetState extends State<AuthorsListWidget> {
  List<String> authorsName = [
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
            categoryName: "Authors",
            buttonName: "See All",
          ),
        ),
        SizedBox(
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
