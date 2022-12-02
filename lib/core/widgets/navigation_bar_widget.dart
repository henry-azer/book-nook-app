import 'package:book_nook_app/core/utils/app_colors.dart';

import 'package:flutter/material.dart';
import 'package:flutter_snake_navigationbar/flutter_snake_navigationbar.dart';

class NavigationBarWidget extends StatefulWidget {
  const NavigationBarWidget({Key? key}) : super(key: key);

  @override
  NavigationBarWidgetState createState() => NavigationBarWidgetState();
}

class NavigationBarWidgetState extends State<NavigationBarWidget> {
  int _selectedItemPosition = 0;
  final double _selectedItemSize = 28.0;
  final double _defaultItemSize = 24.0;
  final double _navigationHeight = 42;

  @override
  Widget build(BuildContext context) {
    return SnakeNavigationBar.color(
      height: _navigationHeight,
      backgroundColor: AppColors.black,
      padding: const EdgeInsets.only(bottom: 30, left: 60, right: 60),

      behaviour: SnakeBarBehaviour.floating,
      shape: const RoundedRectangleBorder(
        borderRadius: BorderRadius.all(Radius.circular(25)),
      ),

      snakeShape: SnakeShape.rectangle,
      selectedItemColor: AppColors.white,
      unselectedItemColor: AppColors.grey,
      snakeViewColor: AppColors.primary.withOpacity(0.9),

      currentIndex: _selectedItemPosition,
      onTap: (index) => setState(() => _selectedItemPosition = index),
      items: [
        BottomNavigationBarItem(
            icon: Icon(Icons.home_outlined,
            size: _selectedItemPosition == 0 ? _selectedItemSize : _defaultItemSize),
            label: 'home'),
        BottomNavigationBarItem(
            icon: Icon(Icons.search_outlined,
            size: _selectedItemPosition == 1 ? _selectedItemSize : _defaultItemSize),
            label: 'search'),
        BottomNavigationBarItem(
            icon: Icon(Icons.star_border_sharp,
            size: _selectedItemPosition == 2 ? _selectedItemSize : _defaultItemSize),
            label: 'rated'),
        BottomNavigationBarItem(
            icon: Icon(Icons.account_circle_outlined,
            size: _selectedItemPosition == 3 ? _selectedItemSize : _defaultItemSize),
            label: 'profile'),
      ],
    );
  }
}
