import 'package:flutter/material.dart';
import 'package:weisro/core/assets_path/icons_path.dart';
import 'package:weisro/core/utils/helper_functions.dart';
import 'package:weisro/feature/profile/presentation/view/pages/edit_profile_page_view.dart';
import 'package:weisro/generated/l10n.dart';

class ProfileOption {
  final String title;
  final String icon;
  final void Function()? onTap;
  ProfileOption(this.onTap, {required this.title, required this.icon});
  static List<ProfileOption> profileOptionsList(BuildContext context) {
    return [
      ProfileOption(() {
        HelperFunctions.navigateToScreen(
          context,
          (context) => const EditProfilePageView(),
        );
      },
          title: S.of(context).EditPersonalInformation,
          icon: IconsPath.iconsEdit),
      ProfileOption(() {},
          title: S.of(context).ChangeMobileNumber, icon: IconsPath.iconsPhone),
      ProfileOption(() {},
          title: S.of(context).ChangePassword, icon: IconsPath.iconsLock),
      ProfileOption(() {},
          title: S.of(context).ChangeEmail, icon: IconsPath.iconsMail),
      ProfileOption(() {},
          title: S.of(context).YourFavorite, icon: IconsPath.iconsFavService),
      ProfileOption(() {},
          title: S.of(context).YourOrder, icon: IconsPath.iconsTaks),
      ProfileOption(() {},
          title: S.of(context).YourPosts, icon: IconsPath.iconsPost),
      ProfileOption(() {},
          title: S.of(context).TermsCondition, icon: IconsPath.iconsPost),
      ProfileOption(() {},
          title: S.of(context).PrivacyPolicy, icon: IconsPath.iconsAlert),
      ProfileOption(() {},
          title: S.of(context).PrivacyPolicy, icon: IconsPath.iconsAlert),
    ];
  }
}
