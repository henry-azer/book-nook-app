import 'package:book_nook_app/core/utils/app_text_style.dart';
import 'package:book_nook_app/core/widgets/buttons/button_form_widget.dart';
import 'package:flutter/material.dart';

class BookInfoWidgetII extends StatefulWidget {
  const BookInfoWidgetII({Key? key}) : super(key: key);

  @override
  State<BookInfoWidgetII> createState() => _BookInfoWidgetIIState();
}

class _BookInfoWidgetIIState extends State<BookInfoWidgetII> {
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
            style: AppTextStyle.text,
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
