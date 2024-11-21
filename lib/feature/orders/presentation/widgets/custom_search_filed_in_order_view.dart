import 'package:flutter/material.dart';
import 'package:weisro/core/styles/app_color.dart';
import 'package:weisro/core/styles/style_functions.dart';
import 'package:weisro/core/utils/helper_functions.dart';
import 'package:weisro/core/widgets/custom_text_form_filed.dart';
import 'package:weisro/core/widgets/search_icon.dart';
import 'package:weisro/generated/l10n.dart';

class CustomSearchFiledInOrderView extends StatelessWidget {
  const CustomSearchFiledInOrderView({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      width: HelperFunctions.getScreenWidth(context) * 0.7,
      height: 36,
      decoration: StyleFunctions.searchContainerDecoration(),
      margin: const EdgeInsetsDirectional.only(start: 24, end: 12),
      child: CustomTextFormFiled(
        hintText: S.of(context).Search_In,
        borderColor: AppColors.orangeColor,
        prefixIcon: const SearchIcon(),
      ),
    );
  }
}
