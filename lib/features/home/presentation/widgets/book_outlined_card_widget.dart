import 'package:book_nook_app/core/utils/app_text_style.dart';
import 'package:flutter/cupertino.dart';

import '../../../../config/locale/app_localizations.dart';
import '../../../../config/routes/app_routes.dart';
import '../../../../core/utils/app_colors.dart';
import '../../../../data/entities/book/book.dart';

class BookOutlinedCardWidget extends StatefulWidget {
  final Book book;

  const BookOutlinedCardWidget({Key? key, required this.book})
      : super(key: key);

  @override
  State<BookOutlinedCardWidget> createState() => _BookOutlinedCardWidgetState();
}

class _BookOutlinedCardWidgetState extends State<BookOutlinedCardWidget> {
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 20.0, vertical: 15.0),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Padding(
            padding: const EdgeInsets.only(top: 20.0),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  widget.book.name!,
                  style: AppTextStyle.bookHighlightName,
                ),
                RichText(
                  text: TextSpan(
                    children: <TextSpan>[
                      TextSpan(
                          text: AppLocalizations.of(context)!.translate('day_book_author')!,
                          style: AppTextStyle.bookHighlightTitle),
                      TextSpan(
                          text: widget.book.author!.name,
                          style: AppTextStyle.bookHighlightSubtitle),
                    ],
                  ),
                ),
                RichText(
                  text: TextSpan(
                    children: <TextSpan>[
                      TextSpan(
                          text: AppLocalizations.of(context)!.translate('day_book_category')!,
                          style: AppTextStyle.bookHighlightTitle),
                      TextSpan(
                          text: widget.book.category!.name,
                          style: AppTextStyle.bookHighlightSubtitle),
                    ],
                  ),
                ),
              ],
            ),
          ),
          GestureDetector(
            onTap: () {
              Navigator.pushNamed(context, Routes.bookInfo, arguments: widget.book);
            },
            child: Container(
              height: 145,
              width: 110,
              decoration: BoxDecoration(
                  color: AppColors.white,
                  borderRadius: BorderRadius.circular(30),
                  image: DecorationImage(
                      image: Image.network(
                        widget.book.imageUrl!,
                      ).image,
                      fit: BoxFit.fill),
                  boxShadow: [
                    BoxShadow(
                        offset: const Offset(0, 2),
                        blurRadius: 2,
                        color: AppColors.white)
                  ]),
            ),
          ),
        ],
      ),
    );
  }
}
