import 'package:flutter/material.dart';

import 'package:weisro/feature/profile/presentation/view/pages/edit_profile_page_view_body.dart';
import 'package:weisro/feature/profile/presentation/view/widgets/custom_app_bar_in_profile_view.dart';

class EditProfilePageView extends StatelessWidget {
  const EditProfilePageView({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      appBar: CustomAppBarInProfileView(),
      body: EditProfilePageViewBody(),
    );
  }
}
