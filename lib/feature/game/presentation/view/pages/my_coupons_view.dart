import 'package:flutter/material.dart';
import 'package:weisro/core/styles/app_color.dart';

import 'my_coupons_page_view_body.dart';

class MyCouponsPageView extends StatelessWidget {
  const MyCouponsPageView({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return const Scaffold(
        backgroundColor: AppColors.gameBackGroundColor,
        body: MyCouponsPageViewBody());
  }
}
