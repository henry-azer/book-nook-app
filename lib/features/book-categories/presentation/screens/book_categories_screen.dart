import 'package:book_nook_app/core/widgets/app_bar_widget.dart';
import 'package:book_nook_app/features/book-categories/presentation/widgets/search_bar_text_field_widget.dart';
import 'package:book_nook_app/features/book-categories/presentation/widgets/authors_list_widget.dart';
import 'package:book_nook_app/features/book-categories/presentation/widgets/books_list_widget.dart';
import 'package:book_nook_app/features/book-categories/presentation/widgets/categories_list_widget.dart';
import 'package:book_nook_app/core/widgets/navigation_bar_widget.dart';
import 'package:flutter/material.dart';

class BookCategoriesScreen extends StatefulWidget {
  const BookCategoriesScreen({Key? key}) : super(key: key);

  @override
  State<BookCategoriesScreen> createState() => _BookCategoriesScreenState();
}

class _BookCategoriesScreenState extends State<BookCategoriesScreen> {
  @override
  Widget build(BuildContext context) {
    return Material(
      child: Scaffold(
        extendBody: true,
        resizeToAvoidBottomInset: true,
        bottomNavigationBar: NavigationBarWidget(path: ModalRoute.of(context)?.settings.name),
        body: SingleChildScrollView(
          child: Center(
            child: Column(
              children: const [
                AppBarWidget(),
                Padding(
                  padding: EdgeInsets.only(left: 40, right: 40, top: 10, bottom: 25),
                  child: SearchBarTextFieldWidget(label: "Search"),
                ),
                BooksListWidget(
                    height: 130.37,
                    width: 87.82,
                    url:
                        'https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcSIc-H9My9FtjycLDSrkfK_rv3vS-tGklB8XFQ4a1yc1WobpJeN'),
                CategoriesListWidget(
                  url:
                      'https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcSIc-H9My9FtjycLDSrkfK_rv3vS-tGklB8XFQ4a1yc1WobpJeN',
                  height: 130.37,
                  width: 87.82,
                  text: 'Biography',
                ),
                AuthorsListWidget(
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
      ),
    );
  }
}
