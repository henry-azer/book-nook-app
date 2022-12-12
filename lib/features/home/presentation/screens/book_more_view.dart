import 'package:book_nook_app/core/utils/app_colors.dart';
import 'package:flutter/material.dart';

import '../../../../core/utils/app_text_style.dart';

class Book_More_View extends StatefulWidget {
  final String image;
  final String title;
  final VoidCallback? press;

  const Book_More_View(
      {Key? key, required this.image, required this.title, required this.press})
      : super(key: key);

  @override
  State<Book_More_View> createState() => _Book_More_ViewState();
}

class _Book_More_ViewState extends State<Book_More_View> {
  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.only(
        top: 50,
        bottom: 30,
      ),
      color: AppColors.background,
      child: Column(
        children: [
          Image.asset(
            widget.image,
            fit: BoxFit.fill,
            width: 100,
            height: 150,
          ),
          Container(
            padding: const EdgeInsets.all(10),
            decoration: const BoxDecoration(
              borderRadius: BorderRadius.only(
                  bottomLeft: Radius.circular(20),
                  bottomRight: Radius.circular(20)),
              color: Colors.transparent,
            ),
            child: Row(
              children: [
                RichText(
                  text: TextSpan(
                    children: [
                      TextSpan(
                        text: '${widget.title}\n',
                        style: AppTextStyle.welcomeTitleSpan,
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}