import 'package:flutter/material.dart';
import 'package:weisro/core/styles/app_color.dart';
import 'package:weisro/feature/game/presentation/view/pages/main_page_game_body.dart';

class MainPageGame extends StatelessWidget {
  const MainPageGame({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return const Scaffold(
        backgroundColor: AppColors.gameBackGroundColor,
        body: SafeArea(child: MainPageGameBody()));
  }
}
