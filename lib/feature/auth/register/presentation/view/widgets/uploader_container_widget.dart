import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:weisro/core/assets_path/icons_path.dart';
import 'package:weisro/core/styles/app_color.dart';
import 'package:weisro/core/styles/app_style.dart';
import 'package:weisro/core/utils/sized_box_extension.dart';

class UploaderContainerWidget extends StatelessWidget {
  const UploaderContainerWidget({
    super.key,
    this.hintText,
  });
  final String? hintText;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {},
      child: Container(
        width: 314,
        height: 88,
        decoration: BoxDecoration(
          // boxShadow: [
          //   BoxShadow(color: AppColors.blackColor.withOpacity(0.1))
          // ],
          border: Border.all(width: 1, color: AppColors.orangeColor),
          borderRadius: const BorderRadius.all(Radius.circular(4)),
        ),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            10.kh,
            Align(
              alignment: AlignmentDirectional.topStart,
              child: Padding(
                padding: const EdgeInsetsDirectional.only(start: 10),
                child: Text(
                  hintText ?? "",
                  style: AppStyles.style10w400Second2(context),
                ),
              ),
            ),
            10.kh,
            SvgPicture.asset(IconsPath.iconsPhoto)
          ],
        ),
      ),
    );
  }
}
