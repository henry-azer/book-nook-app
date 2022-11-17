import 'package:flutter/cupertino.dart';

import '../utils/assets_manager.dart';

class LogoWidget extends StatefulWidget {
  final double width;
  final double height;

  const LogoWidget({super.key, required this.width, required this.height});

  @override
  State<LogoWidget> createState() => _LogoWidgetState();
}

class _LogoWidgetState extends State<LogoWidget> {
  @override
  Widget build(BuildContext context) {
    return Image.asset(ImgAssets.logo,
        width: widget.width, height: widget.height);
  }
}
