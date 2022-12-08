import 'package:book_nook_app/core/utils/app_text_style.dart';
import 'package:book_nook_app/core/widgets/buttons/button_form_widget.dart';
import 'package:flutter/material.dart';

class BookInfoWidget extends StatefulWidget {
  const BookInfoWidget({Key? key}) : super(key: key);

  @override
  State<BookInfoWidget> createState() => _BookInfoWidgetState();
}

class _BookInfoWidgetState extends State<BookInfoWidget> {
  @override
  Widget build(BuildContext context) {
    return Container(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            """
          Lorem Ipsum is simply dummy text of the 
          printing and typesetting industry.Lorem 
          Ipsum has been the industry's standard 
          dummy text ever since the 1500s, when an 
          unknown printer took a galley of type and 
          scrambled it to make a type specimen 
          book. It has survived not only five 
          centuries, but also the leap into electronic 
          typesetting, remaining essentially 
          unchanged.
          """,
            style: AppTextStyle.authorTitlePrimary,
          ),
          ButtonFormWidget(
            child: Text(
              "Rate Book",
              style: AppTextStyle.button,
            ),
            onPress: () {},
          ),
          //NavigationBarWidget(),
        ],
      ),
    );
  }
}
