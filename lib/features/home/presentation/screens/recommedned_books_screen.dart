import 'package:book_nook_app/core/utils/app_text_style.dart';
import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';

// import '../../../../config/routes/app_routes.dart';
import '../../../../config/routes/app_routes.dart';
import '../../../../core/utils/app_colors.dart';
import '../../../../core/utils/assets_manager.dart';
import '../../../../core/widgets/navigation_bar_widget.dart';
import 'book_more_view.dart';

class RecommendedBooksScreen extends StatefulWidget {
  const RecommendedBooksScreen({Key? key}) : super(key: key);

  @override
  State<RecommendedBooksScreen> createState() => _RecommendedBooksScreenState();
}

class _RecommendedBooksScreenState extends State<RecommendedBooksScreen> {
  late PageController _pageController;

  @override
  void initState() {
    _pageController = PageController(initialPage: 0, viewportFraction: 0.85);
    super.initState();
  }

  @override
  void dispose() {
    _pageController.dispose();
    super.dispose();
  }

  List books = [
    Book_More_View(
        image: 'https://template.canva'
            '.com/EADaopxBna4/1/0/251w-ujD6UPGa9hw.jpg',
        title: 'A Teaspoon \n of earth and sea',
        press: () {}),
    Book_More_View(
        image: 'https://template.canva'
            '.com/EADaopxBna4/1/0/251w-ujD6UPGa9hw.jpg',
        title: 'A Teaspoon \n of earth and sea',
        press: () {}),
    Book_More_View(
        image: 'https://template.canva'
            '.com/EADaopxBna4/1/0/251w-ujD6UPGa9hw.jpg',
        title: 'A Teaspoon \n of earth and sea',
        press: () {}),
    Book_More_View(
        image: 'https://template.canva'
            '.com/EADaopxBna4/1/0/251w-ujD6UPGa9hw.jpg',
        title: 'A Teaspoon \n of earth and sea',
        press: () {}),
    Book_More_View(
        image: 'https://template.canva'
            '.com/EADaopxBna4/1/0/251w-ujD6UPGa9hw.jpg',
        title: 'A Teaspoon \n of earth and sea',
        press: () {}),
    Book_More_View(
        image: 'https://template.canva'
            '.com/EADaopxBna4/1/0/251w-ujD6UPGa9hw.jpg',
        title: '  A Teaspoon \n of earth and sea',
        press: () {}),
    Book_More_View(
        image: 'https://template.canva'
            '.com/EADaopxBna4/1/0/251w-ujD6UPGa9hw.jpg',
        title: 'Book Title',
        press: () {}),
    Book_More_View(
        image: 'https://template.canva'
            '.com/EADaopxBna4/1/0/251w-ujD6UPGa9hw.jpg',
        title: 'A Teaspoon \n of earth and sea',
        press: () {}),
  ];

  @override
  Widget build(BuildContext context) {
    return Material(
      child: Scaffold(
        extendBody: true,
        resizeToAvoidBottomInset: true,
        appBar: PreferredSize(
          preferredSize: const Size.fromHeight(80.0), // here the desired height
          child: AppBar(
            centerTitle: false,
            leading: Padding(
              padding: const EdgeInsets.only(top: 22.0, left: 35.0),
              child: IconButton(
                icon: Icon(Icons.arrow_back, color: AppColors.white),
                onPressed: () => Navigator.of(context).pop(),
              ),
            ),
            actions: [
              Padding(
                padding: const EdgeInsets.only(top: 25.0, right: 35.0),
                child: GestureDetector(
                  onTap: () {
                    Navigator.pushReplacementNamed(context, Routes.userProfile);
                  },
                  child: Image.asset(
                    ImgAssets.user,
                    width: 50,
                    height: 50,
                  ),
                ),
              ),
            ],
          ),
        ),
        body: SafeArea(
          child: Stack(
            children: <Widget>[
              Row(
                children: [
                  Padding(
                    padding: const EdgeInsets.only(
                        top: 22.0, bottom: 20, left: 30),
                    child: Text(
                      'Book for you',
                      style: AppTextStyle.categoryTitle,
                    ),
                  ),
                ],
              ),
              Padding(
                padding:
                const EdgeInsets.only(top: 70.0, left: 20, right: 20),
                child: SizedBox(
                  height: 480,
                  width: 550,
                  child: CarouselSlider(
                    options: CarouselOptions(
                        padEnds: true,
                        height: 450,
                        enlargeFactor: 4,
                        enlargeCenterPage: true,
                        pageSnapping: true,
                        scrollDirection: Axis.horizontal,
                        onPageChanged: (index, reason) {
                          setState(() {
                            _pageController = index as PageController;
                          });
                        }),
                    items: [
                      PageView.builder(
                        itemBuilder: (_, index) {
                          return AnimatedBuilder(
                            animation: _pageController,
                            builder: (ctx, child) {
                              return child!;
                            },
                            child: Padding(
                              padding: const EdgeInsets.only(
                                  left: 5.0, right: 5),
                              child: GridView.builder(
                                physics:
                                const NeverScrollableScrollPhysics(),
                                shrinkWrap: true,
                                itemCount: 4,
                                gridDelegate:
                                const SliverGridDelegateWithFixedCrossAxisCount(
                                    crossAxisCount: 2,
                                    crossAxisSpacing: 12,
                                    mainAxisSpacing: 22,
                                    mainAxisExtent: 220),
                                itemBuilder: (_, index) {
                                  return Container(
                                    decoration: const BoxDecoration(
                                      borderRadius: BorderRadius.only(
                                        topRight: Radius.circular(20),
                                        topLeft: Radius.circular(20),
                                        bottomRight: Radius.circular(20),
                                        bottomLeft: Radius.circular(20),
                                      ),
                                    ),
                                    child: Column(
                                      children: [
                                        ClipRRect(
                                          borderRadius:
                                          const BorderRadius.only(
                                            topRight: Radius.circular(20),
                                            topLeft: Radius.circular(20),
                                            bottomRight:
                                            Radius.circular(20),
                                            bottomLeft: Radius.circular(20),
                                          ),
                                          child: Image.network(
                                            books[index].image,
                                            height: 135,
                                            width: double.infinity,
                                            fit: BoxFit.fill,
                                          ),
                                        ),
                                        Center(
                                          child: Padding(
                                            padding: const EdgeInsets.only(
                                                top: 8.0),
                                            child: Text(
                                              books[index].title,
                                              textAlign: TextAlign.center,
                                              style: AppTextStyle.cardvalue,
                                            ),
                                          ),
                                        ),
                                      ],
                                    ),
                                  );
                                },
                              ),
                            ),
                          );
                        },
                      ),

                    ],
                  ),
                ),
              ),
            ],
          ),
        ),
        bottomNavigationBar:
        NavigationBarWidget(path: ModalRoute.of(context)?.settings.name),
      ),
    );
  }
}