import 'package:book_nook_app/core/widgets/appbar_widget.dart';
import 'package:book_nook_app/features/categories/presentation/widgets/list_of_authors.dart';
import 'package:book_nook_app/features/categories/presentation/widgets/list_of_books.dart';
import 'package:book_nook_app/features/categories/presentation/widgets/list_of_categories.dart';
import 'package:book_nook_app/core/widgets/navigation_bar_widget.dart';
import 'package:flutter/material.dart';

class CategoriesScreen extends StatefulWidget {
  const CategoriesScreen({Key? key}) : super(key: key);

  @override
  State<CategoriesScreen> createState() => _CategoriesScreenState();
}

class _CategoriesScreenState extends State<CategoriesScreen> {
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Material(
        child: Scaffold(
          extendBody: true,
          resizeToAvoidBottomInset: true,
          bottomNavigationBar:
              NavigationBarWidget(path: ModalRoute.of(context)?.settings.name),
          body: ListView(
            children:const [
              AppBarWidget(),
              ListOfCategories(
                url:
                    'https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcSIc-H9My9FtjycLDSrkfK_rv3vS-tGklB8XFQ4a1yc1WobpJeN',
                height: 130.37,
                width: 87.82,
                text: 'Biography',
              ),
              ListBooks(
                  height: 130.37,
                  width: 87.82,
                  url:
                      'https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcSIc-H9My9FtjycLDSrkfK_rv3vS-tGklB8XFQ4a1yc1WobpJeN'),
              ListOfAuthors(
                url:
                    'https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcSIc-H9My9FtjycLDSrkfK_rv3vS-tGklB8XFQ4a1yc1WobpJeN',
                height: 130.37,
                width: 87.82,
                text: 'Biography',
              )
            ],
          ),
        ),
      ),
    );
  }
}
