import 'package:book_nook_app/config/locale/app_localizations.dart';
import 'package:book_nook_app/core/widgets/shape_widget.dart';
import 'package:flutter/material.dart';

import '../../../../core/utils/app_text_style.dart';

class BeforeHomeWidget extends StatefulWidget {
  const BeforeHomeWidget({Key? key}) : super(key: key);

  @override
  State<BeforeHomeWidget> createState() => _BeforeHomeWidgetState();
}

class _BeforeHomeWidgetState extends State<BeforeHomeWidget> {
  @override
  Widget build(BuildContext context) {
    return Center(
        child: Column(children: [
      Padding(
        padding: const EdgeInsets.only(top: 240),
        child: Column(
          children: [
            const ShapeWidget(
              width: 220,
              height: 220,
            ),
          ],
        ),
      ),
    ]));
  }
}
