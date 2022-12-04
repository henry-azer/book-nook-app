import 'package:flutter/cupertino.dart';

import '../utils/assets_manager.dart';

class ShapeWidget extends StatefulWidget {
  final double width;
  final double height;
  const ShapeWidget({Key? key, required this.width, required this.height})
      : super(key: key);

  @override
  State<ShapeWidget> createState() => _ShapeWidgetState();
}

class _ShapeWidgetState extends State<ShapeWidget> {
  @override
  Widget build(BuildContext context) {
    return Image.asset(
      ImgAssets.user,
      width: widget.width,
      height: widget.height,
    );
  }
}
