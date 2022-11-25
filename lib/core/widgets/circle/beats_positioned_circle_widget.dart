import 'package:book_nook_app/core/widgets/circle/circle_widget.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:im_animations/im_animations.dart';

class BeatsPositionedCircle extends StatefulWidget {
  final Color color;
  final double width;
  final double height;
  final double top;
  final double left;
  final int beatsPerMinute;

  const BeatsPositionedCircle({
    Key? key,
    required this.color,
    required this.width,
    required this.height,
    required this.top,
    required this.left,
    required this.beatsPerMinute,
  }) : super(key: key);

  @override
  State<BeatsPositionedCircle> createState() => _BeatsPositionedCircleState();
}

class _BeatsPositionedCircleState extends State<BeatsPositionedCircle> {
  @override
  Widget build(BuildContext context) {
    return Positioned(
      top: widget.top,
      left: widget.left,
      child: HeartBeat(
        beatsPerMinute: widget.beatsPerMinute,
        child: Circle(
          color: widget.color,
          width: widget.width,
          height: widget.height,
        ),
      ),
    );
  }
}
