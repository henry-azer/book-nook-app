import 'package:book_nook_app/core/utils/app_colors.dart';
import 'package:book_nook_app/core/utils/app_text_style.dart';
import 'package:book_nook_app/core/utils/app_values.dart';
import 'package:book_nook_app/core/validation/validation_types.dart';
import 'package:book_nook_app/core/widgets/forms/text_field_widget.dart';
import 'package:book_nook_app/features/authentication/presentation/cubit/signin_cubit.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:loading_animation_widget/loading_animation_widget.dart';

import '../../../../config/locale/app_localizations.dart';
import '../../../../config/routes/app_routes.dart';
import '../../../../core/utils/app_strings.dart';
import '../../../../core/utils/constants.dart';
import '../../../../core/widgets/buttons/button_form_widget.dart';

class BeforeWidget extends StatefulWidget {
  const BeforeWidget({Key? key}) : super(key: key);

  @override
  State<BeforeWidget> createState() => _BeforeWidgetState();
}

class _BeforeWidgetState extends State<BeforeWidget> {
  @override
  Widget build(BuildContext context) {
    return Material(
      color: Colors.transparent,
      child: Column(
        //mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Text("Hello," , style: AppTextStyle.title,),
          Text(
            "We choose our books specially for you \n                  with all our careness",
            style: AppTextStyle.fieldLabel,
          )
        ],
      ),
    );
  }
}
