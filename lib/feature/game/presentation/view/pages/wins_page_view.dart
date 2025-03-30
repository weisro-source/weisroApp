import 'package:flutter/material.dart';

import 'wins_page_view_body.dart';

class WinsPageView extends StatelessWidget {
  const WinsPageView({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return const Scaffold(
        // backgroundColor: AppColors.gameBackGroundColor,
        body: WinsPageViewBody());
  }
}
