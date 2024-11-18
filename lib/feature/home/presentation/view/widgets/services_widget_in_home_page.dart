import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:weisro/core/assets_path/icons_path.dart';
import 'package:weisro/core/assets_path/image_path.dart';
import 'package:weisro/core/styles/app_color.dart';
import 'package:weisro/core/styles/app_style.dart';
import 'package:weisro/core/utils/sized_box_extension.dart';

class ServicesWidgetInHomePage extends StatelessWidget {
  const ServicesWidgetInHomePage({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 162,
      width: 172,
      decoration: const BoxDecoration(
          borderRadius: BorderRadius.all(Radius.circular(4)),
          image: DecorationImage(
              fit: BoxFit.cover,
              image: AssetImage(ImagePath.imagesService))),
      child: Column(
        children: [
          Align(
            alignment: AlignmentDirectional.topEnd,
            child: Padding(
              padding:
                  const EdgeInsetsDirectional.only(top: 10, end: 10),
              child: InkWell(
                onTap: () {},
                child: Container(
                    width: 20,
                    height: 20,
                    decoration: const ShapeDecoration(
                        shape: CircleBorder(
                            side: BorderSide(
                                color: AppColors.orangeColor)),
                        color: AppColors.whiteColor),
                    child: Center(
                        child: SvgPicture.asset(
                            IconsPath.iconsFavService))),
              ),
            ),
          ),
          const Spacer(),
          Container(
            height: 22,
            decoration: BoxDecoration(
              color: AppColors.whiteColor,
              borderRadius:
                  BorderRadius.circular(4), // Add border radius here
              boxShadow: const [
                BoxShadow(
                  color: AppColors.orangeColor,
                  offset: Offset(0, 2),
                  blurRadius: 0,
                  spreadRadius: 0,
                ),
              ],
            ),
            child: Row(
              children: [
                10.kw,
                Text(
                  "\$530  ST",
                  style: AppStyles.style10w500Red(context),
                ),
                const Spacer(),
                Row(
                  children: [
                    SvgPicture.asset(IconsPath.iconsLocation),
                    Text(
                      "October ,3322",
                      style: AppStyles.style8w400Grey2(context)
                          .copyWith(color: AppColors.greyColor),
                    ),
                    7.kw,
                  ],
                ),
              ],
            ),
          )
        ],
      ),
    );
  }
}
