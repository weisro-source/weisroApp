import 'package:flutter/material.dart';
import 'package:weisro/core/styles/app_style.dart';
import 'package:weisro/core/utils/sized_box_extension.dart';
import 'package:weisro/core/widgets/custom_dash_line.dart';
import 'package:weisro/core/widgets/custom_text_form_filed.dart';
import 'package:weisro/feature/profile/presentation/view/widgets/title_filed_edit_account.dart';
import 'package:weisro/generated/l10n.dart';

class EditProfilePageViewBody extends StatelessWidget {
  const EditProfilePageViewBody({super.key});

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Column(
        children: [
          39.kh,
          Center(
            child: Text(
              S.of(context).Personal_Information,
              style: AppStyles.style18w500Grey(context),
            ),
          ),
          Padding(
            padding: const EdgeInsetsDirectional.symmetric(horizontal: 33),
            child: Column(
              children: [
                TitleFiledEditAccount(
                  title: S.of(context).Full_Name,
                ),
                15.kh,
                CustomTextFormFiled(
                  hintText: S.of(context).Full_Name,
                ),
                20.kh,
                const CustomDashedLine(),
                20.kh,
                CustomTextFormFiled(
                  hintText: S.of(context).Country,
                ),
                15.kh,
                const CustomDashedLine(),
                20.kh,
                CustomTextFormFiled(
                  hintText: S.of(context).City,
                ),
                15.kh,
                const CustomDashedLine(),
                20.kh,
                CustomTextFormFiled(
                  hintText: S.of(context).Postal_Code,
                ),
                15.kh,
                const CustomDashedLine(),
                20.kh,
                CustomTextFormFiled(
                  hintText: S.of(context).Street,
                ),
                15.kh,
                const CustomDashedLine(),
                20.kh,
                CustomTextFormFiled(
                  hintText: S.of(context).House_Number,
                ),
                60.kh,
              ],
            ),
          )
        ],
      ),
    );
  }
}
