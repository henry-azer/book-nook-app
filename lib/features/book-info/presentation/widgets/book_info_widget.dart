import 'package:book_nook_app/core/utils/app_text_style.dart';
import 'package:book_nook_app/features/book-info/presentation/widgets/card_info.dart';
import 'package:book_nook_app/features/book-info/presentation/widgets/card_infoII.dart';
import 'package:book_nook_app/features/book-info/presentation/widgets/book_banner.dart';
import 'package:flutter/material.dart';

import '../../../../core/widgets/buttons/button_form_widget.dart';
import '../../../../data/entities/book/book.dart';

class BookInfo extends StatefulWidget {
  const BookInfo({Key? key}) : super(key: key);

  @override
  State<BookInfo> createState() => _BookInfoState();
}

class _BookInfoState extends State<BookInfo> {
  @override
  Widget build(BuildContext context) {
    Book book = ModalRoute.of(context)!.settings.arguments as Book;

    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 35.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            children: [
              BookBanner(
                height: 250,
                width: 180,
                url: book.imageUrl!,
              ),
              Padding(
                padding: const EdgeInsets.only(left: 10.0),
                child: Column(
                  children: [
                    InfoCard(
                        icons: const Icon(Icons.star_border),
                        text: "Rating",
                        value: "${book.rate}/10"),
                    const SizedBox(
                      height: 13,
                    ),
                    InfoCard(
                        icons: const Icon(Icons.lock_clock),
                        text: "Duration",
                        value: "${book.readingDuration} min"),
                    const SizedBox(
                      height: 13,
                    ),
                    InfoCardII(
                      text: "EGP",
                      value: "${book.price}",
                    ),
                  ],
                ),
              ),
            ],
          ),
          Padding(
            padding: const EdgeInsets.only(
              left: 15,
              top: 15,
            ),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Padding(
                  padding: const EdgeInsets.only(left: 5.0),
                  child: Text(
                    "${book.name}",
                    style: AppTextStyle.cardinfotextprimary,
                  ),
                ),
                TextButton(
                  onPressed: () {
                    // TODO : navigate to author profile
                  },
                  child: Text(
                    "${book.author?.name}",
                    style: AppTextStyle.cardinfotextsecondry,
                  ),
                )
              ],
            ),
          ),
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 25.0),
                child: Text(
                  "${book.description}",
                  style: AppTextStyle.cardDescription,
                ),
              ),
              Padding(
                padding: const EdgeInsets.symmetric(vertical: 15.0),
                child: ButtonFormWidget(
                  child: Text(
                    "Rate Book",
                    style: AppTextStyle.button,
                  ),
                  onPress: () {
                    // TODO : implement rating book flow
                  },
                ),
              ),
              //NavigationBarWidget(),
            ],
          ),
        ],
      ),
    );
  }
}
