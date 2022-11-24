import 'package:flutter/cupertino.dart';

import 'circle_widget.dart';

class PositionedCircle extends StatefulWidget {
  final Color color;
  final double top;
  final double left;
  final double width;
  final double height;

  const PositionedCircle({
    Key? key,
    required this.color,
    required this.top,
    required this.left,
    required this.width,
    required this.height,
  }) : super(key: key);

  @override
  State<PositionedCircle> createState() => _PositionedCircleState();
}

class _PositionedCircleState extends State<PositionedCircle> {
  @override
  Widget build(BuildContext context) {
    return Positioned(
      top: widget.top,
      left: widget.left,
      child: Circle(
        color: widget.color,
        width: widget.width,
        height: widget.height,
      ),
    );
  }
}
