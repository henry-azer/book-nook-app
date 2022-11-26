import 'dart:ui';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import '../../../../config/routes/app_routes.dart';
import '../../../../core/utils/app_colors.dart';
import '../../../../core/utils/app_text_style.dart';
import '../../../../core/widgets/buttons/button_form_widget.dart';
import '../../../../core/widgets/circle/positioned_circle_widget.dart';
import 'card.dart';

class CategoriesScreen extends StatefulWidget {
  const CategoriesScreen({Key? key}) : super(key: key);

  @override
  State<CategoriesScreen> createState() => _CategoriesScreenState();
}

late PageController _pageController;
int _postion = 0;

void initstate() {
  super.initState();
  _pageController = PageController(initialPage: 1, viewportFraction: -5);
}

List cards = [
  CardScreen(
    text: 'Art',
    color: AppColors.buttonBackground,
    textColor: AppTextStyle.welcomeTitleSpan,
  ),
  CardScreen(
    text: 'Biography',
    color: AppColors.buttonBackground,
    textColor: null,
  ),
  CardScreen(
    text: 'Art',
    color: AppColors.buttonBackground,
    textColor: null,
  )
];

class _CategoriesScreenState extends State<CategoriesScreen> {
  @override
  Widget build(BuildContext context) {
    _navigateToReadingLevelRoute() =>
        Navigator.pushReplacementNamed(context, Routes.readingLevel);
    return Scaffold(
      body: Stack(
        children: [
          PositionedCircle(
              color: AppColors.circlePrimary,
              top: -80,
              left: -40,
              width: 100,
              height: 100),
          PositionedCircle(
              color: AppColors.circleSecondary,
              top: 640,
              left: 280,
              width: 250,
              height: 250),
          BackdropFilter(
            filter: ImageFilter.blur(sigmaX: 12, sigmaY: 10),
            child: Container(
              child: Column(
                children: [
                  Padding(
                    padding:
                        const EdgeInsets.only(top: 60.0, bottom: 50, left: 20),
                    child: RichText(
                      text: TextSpan(
                        children: [
                          TextSpan(
                            text: 'Choose Your \n',
                            style: AppTextStyle.title,
                          ),
                          const WidgetSpan(
                            child: Padding(
                              padding: EdgeInsets.only(top: 35.0),
                            ),
                          ),
                          TextSpan(
                              text: 'best Categories \n',
                              style: AppTextStyle.title2),
                          const WidgetSpan(
                            child: Padding(
                              padding: EdgeInsets.only(top: 20.0),
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                  Flexible(
                    child: PageView.builder(
                      controller: _pageController,
                      itemCount: cards.length,
                      onPageChanged: (int postion) {
                        setState(() {
                          _postion = postion;
                        });
                      },
                      itemBuilder: (BuildContext context, int postion) {
                        return imageSlider(postion);
                      },
                    ),
                  ),
                  Flexible(
                    child: AnimatedPageIndicatorFb1(
                      currentPage: _postion,
                      numPages: cards.length,
                      gradient: LinearGradient(
                        colors: [
                          Colors.blue.withOpacity(.4),
                          Colors.purple.withOpacity(.4)
                        ],
                      ),
                      activeGradient: const LinearGradient(
                          colors: [Colors.blue, Colors.purple]),
                    ),
                  ),
                  ButtonFormWidget(
                    onPress: _navigateToReadingLevelRoute,
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Text(
                          'Next',
                          style: AppTextStyle.button,
                        ),
                        const Padding(
                          padding: EdgeInsets.only(left: 20),
                          child: Icon(
                            Icons.arrow_forward_outlined,
                            size: 35,
                          ),
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}

Widget imageSlider(int postion) {
  return AnimatedBuilder(
    animation: _pageController,
    builder: (BuildContext context, widget) {
      return Center(
        child: CardScreen(
          text: 'Biography',
          color: AppColors.buttonBackground,
          textColor: null,
        ),
      );
    },
    child: Container(
      child: cards[postion],
    ),
  );
}

class AnimatedPageIndicatorFb1 extends StatelessWidget {
  const AnimatedPageIndicatorFb1(
      {Key? key,
      required this.currentPage,
      required this.numPages,
      this.dotHeight = 10,
      this.activeDotHeight = 10,
      this.dotWidth = 10,
      this.activeDotWidth = 20,
      this.gradient =
          const LinearGradient(colors: [Color(0xff4338CA), Color(0xff6D28D9)]),
      this.activeGradient =
          const LinearGradient(colors: [Color(0xff4338CA), Color(0xff6D28D9)])})
      : super(key: key);

  final int
      currentPage; //the index of the active dot, i.e. the index of the page you're on
  final int
      numPages; //the total number of dots, i.e. the number of pages your displaying

  final double dotWidth; //the width of all non-active dots
  final double activeDotWidth; //the width of the active dot
  final double activeDotHeight; //the height of the active dot
  final double dotHeight; //the height of all dots
  final Gradient gradient; //the gradient of all non-active dots
  final Gradient activeGradient; //the gradient of the active dot

  double _calcRowSize() {
    //Calculates the size of the outer row that creates spacing that is equivalent to the width of a dot
    final int widthFactor = 2; //assuming spacing is equal to the width of a dot
    return (dotWidth * numPages * widthFactor) + activeDotWidth - dotWidth;
  }

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: _calcRowSize(),
      child: Row(
        mainAxisSize: MainAxisSize.max,
        mainAxisAlignment: MainAxisAlignment.spaceAround,
        children: List.generate(
          numPages,
          (index) => AnimatedPageIndicatorDot(
            isActive: currentPage == index,
            gradient: gradient,
            activeGradient: activeGradient,
            activeWidth: activeDotWidth,
            activeHeight: activeDotHeight,
          ),
        ),
      ),
    );
  }
}

class AnimatedPageIndicatorDot extends StatelessWidget {
  const AnimatedPageIndicatorDot(
      {Key? key,
      required this.isActive,
      this.height = 10,
      this.width = 10,
      this.activeWidth = 20,
      this.activeHeight = 10,
      required this.gradient,
      required this.activeGradient})
      : super(key: key);

  final bool isActive;
  final double height;
  final double width;
  final double activeWidth;
  final double activeHeight;
  final Gradient gradient;
  final Gradient activeGradient;

  @override
  Widget build(BuildContext context) {
    return AnimatedContainer(
      width: isActive ? activeWidth : width,
      height: isActive ? activeHeight : height,
      duration: const Duration(milliseconds: 300),
      decoration: BoxDecoration(
          gradient: isActive ? activeGradient : gradient,
          borderRadius: const BorderRadius.all(Radius.circular(30))),
    );
  }
}
