import 'package:flutter/material.dart';
import 'package:weisro/core/assets_path/image_path.dart';
import 'package:weisro/core/styles/app_color.dart';

import 'success_win_page_view_body.dart';

class SuccessWinPageView extends StatelessWidget {
  const SuccessWinPageView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.gameBackGroundColor,
      body: Stack(
        children: [
          // Background Image
          Container(
            decoration: const BoxDecoration(
              image: DecorationImage(
                image: AssetImage(ImagePath.imagesGameBackground),
                fit: BoxFit.fill,
              ),
            ),
          ),
          // SafeArea with Main Content
          const SafeArea(
            child: SuccessWinPageViewBody(),
          ),
        ],
      ),
    );
  }
}
