import 'package:flutter/material.dart';
import 'package:weisro/core/assets_path/image_path.dart';
import 'package:weisro/core/styles/app_color.dart';
import 'package:weisro/core/utils/constant.dart';

class YouWinPageView extends StatelessWidget {
  const YouWinPageView({super.key});

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;

    return Center(
      child: Stack(
        children: [
          _buildBackgroundImage(),
          _buildWinAmountText(size),
        ],
      ),
    );
  }

  Widget _buildBackgroundImage() {
    return Image.asset(
      ImagePath.imagesYouWin,
      fit: BoxFit.cover,
    );
  }
 
  Widget _buildWinAmountText(Size size) {
    return Positioned(
      top: size.height * 0.3,
      left: size.width * 0.25,
      child: Text(
        "600\$",
        style: TextStyle(
          fontSize: size.width * 0.1,
          color: AppColors.whiteColor,
          fontFamily: Constants.gameFont2Family,
          fontWeight: FontWeight.w700,
        ),
      ),
    );
  }
}
