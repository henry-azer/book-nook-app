import 'package:flutter/cupertino.dart';

class Circle extends StatefulWidget {
  final Color color;
  final double width;
  final double height;

  const Circle({
    Key? key,
    required this.color,
    required this.width,
    required this.height,
  }) : super(key: key);

  @override
  State<Circle> createState() => _CircleState();
}

class _CircleState extends State<Circle> {
  @override
  Widget build(BuildContext context) {
    return Container(
      width: widget.width,
      height: widget.height,
      decoration: BoxDecoration(
        color: widget.color,
        shape: BoxShape.circle,
        boxShadow: [
          BoxShadow(
              blurRadius: 6,
              offset: const Offset(2, 7),
              color: widget.color.withOpacity(0.3))
        ],
      ),
    );
  }
}
