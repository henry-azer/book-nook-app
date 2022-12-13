import 'package:book_nook_app/core/utils/app_colors.dart';
import 'package:book_nook_app/core/utils/app_text_style.dart';
import 'package:flutter/material.dart';

class RatedBooksWidget extends StatefulWidget {
  const RatedBooksWidget({Key? key}) : super(key: key);

  @override
  State<RatedBooksWidget> createState() => _RatedBooksWidgetState();
}

class _RatedBooksWidgetState extends State<RatedBooksWidget> {
  List<String> bookNames = [
    "1984",
    "Macbeth",
    "Emma",
    "Next",
    "opal",
    "Echo",
    "Flutter",
    "Clean Code"
  ];

  @override
  Widget build(BuildContext context) {
    return GridView.builder(
        physics: const ScrollPhysics(),
        itemCount: bookNames.length,
        gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
          crossAxisCount: 2,
          crossAxisSpacing: 20,
          mainAxisSpacing: 30,
          childAspectRatio: 0.85,
        ),
        shrinkWrap: true,
        itemBuilder: (BuildContext context, int index) {
          return Center(
            child: Stack(
              children: [
                Container(
                  decoration: BoxDecoration(
                    border:
                        Border.all(width: 4, color: AppColors.circlePrimary),
                    borderRadius: BorderRadius.circular(20),
                  ),
                  child: Image.network(
                    'https://res.cloudinary.com/bookbub/image/upload/t_ci_ar_6:9_padded,f_auto,q_auto,dpr_1/v1503321406/pro_pbid_3987537.jpg',
                    width: 120,
                    height: 195,
                  ),
                ),
                InkWell(
                  onTap: () {},
                  child: Container(
                    decoration: BoxDecoration(
                      borderRadius: BorderRadiusDirectional.circular(20),
                      color: AppColors.circlePrimary.withOpacity(0.75),
                    ),
                    width: 130,
                    height: 196,
                    child: Center(
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.center,
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Text(
                            bookNames[index],
                            maxLines: 6,
                            textAlign: TextAlign.center,
                            style: AppTextStyle.bookmarkcard,
                          ),
                          TextButton(
                              onPressed: () {},
                              child: Text(
                                "Rate",
                                style: AppTextStyle.containertext,
                              )),
                          Text(
                            "4.3",
                            style: AppTextStyle.textbutbookmark,
                          )
                        ],
                      ),
                    ),
                  ),
                ),
              ],
            ),
          );
        });
  }
}
