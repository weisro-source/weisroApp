import 'package:flutter/material.dart';
import 'package:weisro/core/styles/app_color.dart';

import 'you_win_page_view.dart';

class YouWinPage extends StatelessWidget {
  const YouWinPage({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return const Scaffold(
        backgroundColor: AppColors.gameBackGroundColor, body: YouWinPageView());
  }
}
