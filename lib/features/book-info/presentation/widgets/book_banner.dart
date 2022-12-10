import 'package:flutter/material.dart';

class BookBanner extends StatefulWidget {
  final double height;
  final double width;
  final String url;

  const BookBanner(
      {Key? key, required this.height, required this.width, required this.url})
      : super(key: key);

  @override
  State<BookBanner> createState() => _BookBannerState();
}

class _BookBannerState extends State<BookBanner> {
  @override
  Widget build(BuildContext context) {
    return Material(
      color: Colors.transparent,
      child: Container(
        padding: const EdgeInsets.all(18.0),
        decoration: BoxDecoration(
          borderRadius: BorderRadiusDirectional.circular(20),
        ),
        child: Image.network(
          widget.url,
          height: widget.height,
          width: widget.width,
          fit: BoxFit.fill,
        ),
      ),
    );
  }
}
