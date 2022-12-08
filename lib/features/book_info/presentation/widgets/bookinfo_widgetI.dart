import 'package:book_nook_app/core/utils/app_colors.dart';
import 'package:book_nook_app/core/utils/app_text_style.dart';
import 'package:book_nook_app/core/widgets/shape_widget.dart';
import 'package:book_nook_app/features/book_info/presentation/widgets/card_info.dart';
import 'package:book_nook_app/features/book_info/presentation/widgets/card_infoII.dart';
import 'package:book_nook_app/features/book_info/presentation/widgets/selected_book.dart';
import 'package:flutter/material.dart';

class BookInfo extends StatefulWidget {
  const BookInfo({Key? key}) : super(key: key);

  @override
  State<BookInfo> createState() => _BookInfoState();
}

class _BookInfoState extends State<BookInfo> {
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(
        top: 37,
        right: 20,
        left: 20,
        bottom: 37,
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              IconButton(
                  onPressed: () {},
                  icon: Icon(
                    Icons.arrow_back,
                  ),
                  color: AppColors.white),
              ShapeWidget(
                width: 35,
                height: 35,
              ),
            ],
          ),
          Row(
            children: [
              SelectedBook(
                height: 250,
                width: 180,
              ),
              Column(
                children: [
                  InfoCard(
                      icons: Icon(Icons.star_border),
                      text: "Rating",
                      value: "7.2/10"),
                  SizedBox(
                    height: 13,
                  ),
                  InfoCard(
                      icons: Icon(Icons.lock_clock),
                      text: "Duration",
                      value: "145min"),
                  SizedBox(
                    height: 13,
                  ),
                  InfoCardII(
                    text: "EGP",
                    value: "175",
                  ),
                ],
              ),
            ],
          ),
          Padding(
            padding: const EdgeInsets.only(
              left: 30,
            ),
            child: Center(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    "A Teaspoon of earth   and sea",
                    style: AppTextStyle.cardinfotextprimary,
                  ),
                  TextButton(
                    onPressed: () {},
                    child: Text(
                      "DINA NAYERI",
                      style: AppTextStyle.cardinfotextsecondry,
                    ),
                  )
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
