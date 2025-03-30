import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:weisro/core/assets_path/icons_path.dart';
import 'package:weisro/core/assets_path/image_path.dart';
import 'package:weisro/core/styles/app_color.dart';
import 'package:weisro/core/styles/app_style.dart';
import 'package:weisro/core/utils/helper_functions.dart';
import 'package:weisro/core/utils/sized_box_extension.dart';
import 'package:weisro/core/widgets/my_pinned_header_delegate.dart';
import 'package:weisro/feature/game/presentation/game_text_style.dart';
import 'package:weisro/feature/game/presentation/view/widgets/sliver_app_bar_game.dart';

import '../widgets/gradient_border_circle_avatar.dart';
import '../widgets/team_name.dart';

class WinsPageViewBody extends StatefulWidget {
  const WinsPageViewBody({super.key});

  @override
  WinsPageViewBodyState createState() => WinsPageViewBodyState();
}

class WinsPageViewBodyState extends State<WinsPageViewBody> {
  String selectedOption = "This month";

  @override
  Widget build(BuildContext context) {
    // print(HelperFunctions.getScreenHight(context));
    return CustomScrollView(
      slivers: [
        const SliverAppBarWidget(
          title: "wines List",
        ),
        SliverPersistentHeader(
            pinned: true,
            delegate: MyPinnedHeaderDelegate(
                height: HelperFunctions.getScreenHight(context) * 0.31,
                child: Container(
                  height: HelperFunctions.getScreenHight(context) * 0.31,
                  width: HelperFunctions.getScreenWidth(context),
                  decoration: const BoxDecoration(
                      image: DecorationImage(
                          fit: BoxFit.cover,
                          alignment: Alignment.bottomLeft,
                          image: AssetImage(ImagePath.imagesWhitePoints)),
                      color: AppColors.blueGameColor,
                      borderRadius: BorderRadiusDirectional.only(
                        bottomEnd: Radius.circular(20),
                        bottomStart: Radius.circular(20),
                      )),
                  child: Column(
                    children: [
                      10.kh,
                      Container(
                        height: 28,
                        width: HelperFunctions.getScreenWidth(context) * 0.6,
                        decoration: BoxDecoration(
                          color: AppColors.blackGameColor,
                          backgroundBlendMode: BlendMode.overlay,
                          borderRadius: BorderRadius.circular(20),
                        ),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            _buildOption("This month"),
                            _buildOption("This week"),
                            _buildOption("All"),
                          ],
                        ),
                      ),
                      40.kh,
                      SizedBox(
                        height: 130,
                        child: Stack(
                          clipBehavior: Clip.none,
                          alignment: Alignment.center,
                          children: [
                            // Winner 1 crown Icon
                            Positioned(
                                top: -40,
                                child: SvgPicture.asset(IconsPath.iconsCrown)),

                            // Winner 2 (Left)
                            const Positioned(
                              top: 12,
                              left: 110,
                              child: TextForOrderWinner(
                                order: "2",
                              ),
                            ),

                            // Winner 3 (Right)
                            const Positioned(
                              top: 20,
                              right: 70,
                              child: TextForOrderWinner(
                                order: "3",
                              ),
                            ),

                            // Avatars
                            const Positioned(
                              top: 40,
                              left: 70,
                              child: GradientBorderCircleAvatar(
                                radius: 45,
                                backgroundColor: AppColors.blue2GameColor,
                              ),
                            ),
                            const Positioned(
                              top: 40,
                              right: 70,
                              child: GradientBorderCircleAvatar(
                                radius: 45,
                                backgroundColor: AppColors.blue2GameColor,
                              ),
                            ),
                            const Positioned(
                              top: 0,
                              child: GradientBorderCircleAvatar(
                                radius: 62,
                                backgroundColor: AppColors.blue2GameColor,
                              ),
                            ),
                          ],
                        ),
                      ),
                    ],
                  ),
                ))),
        15.sKh,
        SliverList.separated(
          itemCount: 10,
          itemBuilder: (context, index) {
            return WinnerPlayerWidget(
                playerIndex: index + 4,
                playerName: "Player ${index + 4}",
                prizeValue: 200);
          },
          separatorBuilder: (context, index) {
            return 14.kh;
          },
        )
      ],
    );
  }

  Widget _buildOption(String option) {
    bool isSelected = selectedOption == option;
    return GestureDetector(
      onTap: () {
        setState(() {
          selectedOption = option;
        });
      },
      child: Container(
        height: 28,
        alignment: Alignment.center,
        padding: const EdgeInsets.symmetric(horizontal: 8),
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(20),
          color: isSelected ? AppColors.goldGameColor : Colors.transparent,
          border: isSelected
              ? Border.all(color: AppColors.goldGameColor, width: 2)
              : null,
        ),
        child: Text(option,
            style: GameAppStyles.gameTextStyle10wWhiteColorW700(context)
                .copyWith(color: isSelected ? AppColors.blackColor : null)),
      ),
    );
  }
}

class WinnerPlayerWidget extends StatelessWidget {
  const WinnerPlayerWidget(
      {super.key,
      required this.playerIndex,
      required this.playerName,
      required this.prizeValue});
  final int playerIndex;
  final String playerName;
  final double prizeValue;
  @override
  Widget build(BuildContext context) {
    return Container(
      height: HelperFunctions.getScreenHight(context) * 0.08,
      width: HelperFunctions.getScreenWidth(context),
      margin: EdgeInsetsDirectional.symmetric(
          horizontal: HelperFunctions.getScreenWidth(context) * 0.08),
      decoration: const BoxDecoration(
        borderRadius: BorderRadiusDirectional.all(Radius.circular(5)),
        color: AppColors.blue3GameColor,
      ),
      child: Padding(
        padding: const EdgeInsetsDirectional.symmetric(horizontal: 13),
        child: Row(
          children: [
            Text(
              playerIndex.toString(),
              style: AppStyles.style12w500Grey(context).copyWith(
                color: AppColors.whiteColor,
                fontWeight: FontWeight.w700,
              ),
            ),
            10.kw,
            Container(
              width: 35,
              height: 30,
              decoration: const ShapeDecoration(
                shape: CircleBorder(),
                color: AppColors.whiteColor,
              ),
              child: Image.asset(
                IconsPath.iconsGoldPerson,
                width: 35,
                height: 35,
                fit: BoxFit.scaleDown,
              ),
            ),
            13.kw,
            Text(
              playerName,
              style: AppStyles.style12w500Grey(context).copyWith(
                color: AppColors.whiteColor,
                fontWeight: FontWeight.w700,
              ),
            ),
            const Spacer(),
            Text(prizeValue.toString(),
                style: AppStyles.style24w400Orange(context).copyWith(
                  color: AppColors.goldColor2,
                  fontWeight: FontWeight.w700,
                )),
          ],
        ),
      ),
    );
  }
}
