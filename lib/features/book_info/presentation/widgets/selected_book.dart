import 'package:flutter/material.dart';

class SelectedBook extends StatefulWidget {
  final double height;
  final double width;
  const SelectedBook({
    Key? key,
    required this.height,
    required this.width,
  }) : super(key: key);

  @override
  State<SelectedBook> createState() => _SelectedBookState();
}

class _SelectedBookState extends State<SelectedBook> {
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
          'https://res.cloudinary.com/bookbub/image/upload/t_ci_ar_6:9_padded,f_auto,q_auto,dpr_1/v1599443818/pro_pbid_4287670.jpg',
          height: widget.height,
          width: widget.width,
          fit: BoxFit.fill,
        ),
      ),
    );
  }
}
