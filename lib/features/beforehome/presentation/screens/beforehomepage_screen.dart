import 'package:book_nook_app/features/beforehome/presentation/widgets/before_home_widget.dart';
import 'package:book_nook_app/features/beforehome/presentation/widgets/beforehome_widget.dart';
import 'package:flutter/material.dart';

class BeforeHomePageScreen extends StatefulWidget {
  const BeforeHomePageScreen({Key? key}) : super(key: key);

  @override
  State<BeforeHomePageScreen> createState() => _BeforeHomePageScreenState();
}

class _BeforeHomePageScreenState extends State<BeforeHomePageScreen> {
  @override
  Widget build(BuildContext context) {
    return Material(
        child: Scaffold(
      body: SingleChildScrollView(
        child: Column(
          children: const [
            BeforeHomeWidget(),
            BeforeWidget(),
          ],
        ),
      ),
    ));
  }
}
