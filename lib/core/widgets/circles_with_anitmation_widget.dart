import 'package:flutter/cupertino.dart';
import 'package:im_animations/im_animations.dart';

class CirclesWithAnimation extends StatefulWidget {
  final Color color;
  final double width;
  final double height;
  final double topPostion;
  final double leftPostion;
  final int beatsPerMinute;

  const CirclesWithAnimation({
    super.key,
    required this.color,
    required this.width,
    required this.height,
    required this.topPostion,
    required this.leftPostion,
    required this.beatsPerMinute,
  });

  @override
  State<CirclesWithAnimation> createState() => _CirclesWithAnimationState();
}

class _CirclesWithAnimationState extends State<CirclesWithAnimation>
    with SingleTickerProviderStateMixin {
  @override
  Widget build(BuildContext context) {
    return Positioned(
      top: widget.topPostion,
      left: widget.leftPostion,
      child: HeartBeat(
        beatsPerMinute: widget.beatsPerMinute,
        child: Container(
          width: widget.width,
          height: widget.height,
          decoration: BoxDecoration(
            color: widget.color,
            shape: BoxShape.circle,
            boxShadow: [
              BoxShadow(
                blurRadius: 6,
                offset: const Offset(2, 7),
                color: widget.color.withOpacity(0.3),
              )
            ],
          ),
        ),
      ),
    );
  }
}
