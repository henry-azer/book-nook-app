import 'dart:math';

import 'package:flutter/cupertino.dart';
import 'package:book_nook_app/core/utils/app_colors.dart';
import 'package:flutter/material.dart';

import '../../../../config/routes/app_routes.dart';
import '../../../../data/entities/book/book.dart';

class BookSliderWidget extends StatefulWidget {
  final List<Book> books;

  const BookSliderWidget({Key? key, required this.books}) : super(key: key);

  @override
  State<BookSliderWidget> createState() => _BookSliderWidgetState();
}

class _BookSliderWidgetState extends State<BookSliderWidget> {
  late final PageController _pageController;
  late final int _currentPage = widget.books.length ~/ 2;

  @override
  void initState() {
    super.initState();
    _pageController =
        PageController(initialPage: _currentPage, viewportFraction: 0.7);
  }

  @override
  void dispose() {
    super.dispose();
    _pageController.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return AspectRatio(
        aspectRatio: 1.2,
        child: PageView.builder(
            itemCount: widget.books.length,
            physics: const ClampingScrollPhysics(),
            controller: _pageController,
            itemBuilder: (context, index) {
              return carouselView(index, widget.books);
            }));
  }

  Widget carouselView(int index, List<Book> recommendedBooks) {
    return AnimatedBuilder(
      animation: _pageController,
      builder: (context, child) {
        double value = 0.0;
        if (_pageController.position.haveDimensions) {
          value = index.toDouble() - (_pageController.page ?? 0);
          value = (value * 0.120).clamp(-1, 1);
        }
        return Transform.rotate(
          angle: pi * value,
          child: carouselCard(recommendedBooks[index]),
        );
      },
    );
  }

  Widget carouselCard(Book book) {
    return Column(
      children: <Widget>[
        Expanded(
          child: Container(
            padding: const EdgeInsets.symmetric(vertical: 30.0),
            width: 210,
            child: Hero(
              tag: book.name!,
              child: GestureDetector(
                onTap: () {
                  Navigator.pushNamed(context, Routes.bookInfo, arguments: book);
                },
                child: Container(
                  decoration: BoxDecoration(
                      color: AppColors.white,
                      borderRadius: BorderRadius.circular(30),
                      image: DecorationImage(
                          image: Image.network(
                            book.imageUrl!,
                          ).image,
                          fit: BoxFit.fill),
                      boxShadow: [
                        BoxShadow(
                            offset: const Offset(0, 2),
                            blurRadius: 2,
                            color: AppColors.white)
                      ]
                  ),
                ),
              ),
            ),
          ),
        ),
      ],
    );
  }
}
