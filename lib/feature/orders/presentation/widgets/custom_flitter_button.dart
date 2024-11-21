import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:weisro/core/assets_path/icons_path.dart';
import 'package:weisro/core/styles/app_color.dart';
import 'package:weisro/core/styles/app_style.dart';
import 'package:weisro/core/styles/style_functions.dart';
import 'package:weisro/core/utils/helper_functions.dart';
import 'package:weisro/core/utils/sized_box_extension.dart';
import 'package:weisro/core/widgets/app_button.dart';
import 'package:weisro/generated/l10n.dart';

class CustomFlitterButton extends StatelessWidget {
  const CustomFlitterButton({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
          color: AppColors.second1Color,
          borderRadius: const BorderRadius.all(Radius.circular(4)),
          border: Border.all(width: 0.5, color: AppColors.orangeColor)),
      child: Center(
        child: IconButton(
            onPressed: () {
              HelperFunctions.showCustomDialog(
                context,
                Center(
                  child: Container(
                    width: HelperFunctions.getScreenWidth(context) * 0.9,
                    height: HelperFunctions.getScreenHight(context) * 0.5,
                    padding:
                        const EdgeInsetsDirectional.symmetric(horizontal: 25),
                    decoration: BoxDecoration(
                        color: AppColors.whiteColor,
                        borderRadius: BorderRadiusDirectional.circular(8)),
                    child: SingleChildScrollView(
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          20.kh,
                          FlitterType(
                              iconPath: IconsPath.iconsMoneyBag,
                              typeTitle: S.of(context).date),
                          7.kh,
                          Container(
                            width:
                                HelperFunctions.getScreenWidth(context) * 0.8,
                            height: 30,
                            decoration:
                                StyleFunctions.flitterContainerDecoration(),
                            child: Row(
                              children: [
                                14.kw,
                                SvgPicture.asset(IconsPath.iconsCalender),
                                8.kw,
                                Text(
                                  "MM/DD/YYYY",
                                  style: AppStyles.style10w400Second2(context),
                                ),
                                22.kw,
                                Text(
                                  "12:00",
                                  style: AppStyles.style10w400Second2(context),
                                ),
                              ],
                            ),
                          ),
                          38.kh,
                          FlitterType(
                              iconPath: IconsPath.iconsMoneyBag,
                              typeTitle: S.of(context).Price),
                          8.kh,
                          const SliderWithHandle(),
                          38.kh,
                          FlitterType(
                              iconPath: IconsPath.iconsLocationPin,
                              typeTitle: S.of(context).Price),
                          8.kh,
                          Container(
                            width:
                                HelperFunctions.getScreenWidth(context) * 0.8,
                            height: 30,
                            decoration:
                                StyleFunctions.flitterContainerDecoration(),
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                Text(
                                  "Write your location such as Oberamen , 3216",
                                  style: AppStyles.style10w400Second2(context),
                                ),
                              ],
                            ),
                          ),
                          38.kh,
                          FlitterType(
                              iconPath: IconsPath.iconsStarSecondColor,
                              typeTitle: S.of(context).Price),
                          8.kh,
                          const SliderWithHandle(),
                          38.kh,
                          FlitterType(
                              iconPath: IconsPath.iconsStarSecondColor,
                              iconShow: false,
                              typeTitle: S.of(context).Rate),
                          8.kh,
                          Container(
                            width: 190,
                            height: 30,
                            decoration:
                                StyleFunctions.flitterContainerDecoration(),
                          ),
                          28.kh,
                          AppButton(
                            buttonColor: AppColors.orangeColor,
                            text: S.of(context).Book_Now,
                            onPressed: () {},
                          ),
                          28.kh,
                        ],
                      ),
                    ),
                  ),
                ),
              );
            },
            padding: EdgeInsetsDirectional.zero,
            icon: SvgPicture.asset(IconsPath.iconsFilter)),
      ),
    );
  }
}

class FlitterType extends StatelessWidget {
  const FlitterType(
      {super.key,
      required this.iconPath,
      required this.typeTitle,
      this.iconShow = true});
  final String iconPath;
  final String typeTitle;
  final bool iconShow;
  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Visibility(
          visible: iconShow,
          child: SvgPicture.asset(
            iconPath,
            width: 18,
            height: 18,
          ),
        ),
        10.kw,
        Expanded(
            child: Text(
          "${S.of(context).Filtering_By} $typeTitle : ",
          style: AppStyles.style12w400Orange(context),
        ))
      ],
    );
  }
}

class SliderWithHandle extends StatefulWidget {
  const SliderWithHandle({super.key});

  @override
  SliderWithHandleState createState() => SliderWithHandleState();
}

class SliderWithHandleState extends State<SliderWithHandle> {
  double position = 0;

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Stack(
          fit: StackFit.loose,
          clipBehavior: Clip.none,
          children: [
            Container(
              width: 190,
              height: 30,
              decoration: StyleFunctions.flitterContainerDecoration(),
            ),
            Positioned(
              left: position,
              bottom: -4,
              top: -4,
              child: GestureDetector(
                onHorizontalDragUpdate: (details) {
                  setState(() {
                    position += details.primaryDelta ?? 0;
                    position = position.clamp(0.0, 185.0);
                  });
                },
                child: Container(
                  width: 10,
                  height: 40,
                  decoration: ShapeDecoration(
                    color: AppColors.orangeColor,
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(29),
                    ),
                    shadows: const [
                      BoxShadow(
                        color: Color(0x3F000000),
                        blurRadius: 4,
                        offset: Offset(0, 2),
                        spreadRadius: 0,
                      ),
                    ],
                  ),
                ),
              ),
            ),
          ],
        ),
        Container(
          height: 30,
          width: 56,
          decoration: BoxDecoration(
            color: AppColors.orangeColor,
            border: Border.all(color: AppColors.blackColor, width: 1),
            borderRadius: const BorderRadius.all(Radius.circular(4)),
          ),
          child: Center(
            child: Text(
              "${position.round()}",
              style: AppStyles.style14w500White(context),
            ),
          ),
        ),
      ],
    );
  }
}
