import 'package:flutter/material.dart';
import 'package:weisro/core/assets_path/icons_path.dart';
import 'package:weisro/core/utils/sized_box_extension.dart';

import 'package:weisro/core/widgets/custom_dash_line.dart';
import 'package:weisro/core/widgets/custom_dialog.dart';
import 'package:weisro/generated/l10n.dart';

import '../../../data/models/profile_option.dart';
import '../widgets/custom_app_bar_in_profile_view.dart';
import '../widgets/custom_profile_option_widget.dart';

class ProfilePageViewBody extends StatelessWidget {
  const ProfilePageViewBody({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: const CustomAppBarInProfileView(),
        body: SingleChildScrollView(
          child: Column(
            children: [
              36.kh,
              Builder(builder: (context) {
                return ListView.separated(
                    shrinkWrap: true,
                    physics: const NeverScrollableScrollPhysics(),
                    itemBuilder: (context, index) {
                      var item =
                          ProfileOption.profileOptionsList(context)[index];
                      return CustomProfileOptionWidget(item: item);
                    },
                    separatorBuilder: (context, index) {
                      return 24.kh;
                    },
                    itemCount:
                        ProfileOption.profileOptionsList(context).length);
              }),
              25.kh,
              const Padding(
                padding: EdgeInsetsDirectional.symmetric(horizontal: 36),
                child: CustomDashedLine(),
              ),
              20.kh,
              CustomProfileOptionWidget(
                  item: ProfileOption(() {
                CustomDialog.showLanguageDialog(
                  context,
                  "dialogTitle",
                );
              }, title: S.of(context).Language, icon: IconsPath.iconsLanguage)),
              16.kh,
              CustomProfileOptionWidget(
                  item: ProfileOption(() {
                CustomDialog.showLogoutDialog(context);
              }, title: S.of(context).LogOut, icon: IconsPath.iconsLogOut)),
            ],
          ),
        ));
  }
}
