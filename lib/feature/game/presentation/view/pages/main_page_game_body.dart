import 'package:flutter/material.dart';
import 'package:weisro/core/assets_path/image_path.dart';
import 'package:weisro/core/styles/app_color.dart';
import 'package:weisro/core/utils/helper_functions.dart';
import 'package:weisro/core/utils/sized_box_extension.dart';

class MainPageGameBody extends StatelessWidget {
  const MainPageGameBody({super.key});

  @override
  Widget build(BuildContext context) {
    return CustomScrollView(
      slivers: [
        SliverToBoxAdapter(
            child: ClipRRect(
          borderRadius: const BorderRadius.only(
            bottomLeft: Radius.circular(20),
            bottomRight: Radius.circular(20),
          ),
          child: Image.asset(ImagePath.imagesHeaderImage),
        )),
        40.sKh,
        SliverList.separated(
            itemCount: 8,
            itemBuilder: (context, index) {
              return Container(
                width: HelperFunctions.getScreenWidth(context),
                height: 220,
                margin: EdgeInsetsDirectional.symmetric(
                    horizontal: HelperFunctions.getScreenWidth(context) * 0.05),
                decoration: const BoxDecoration(
                    image: DecorationImage(
                        image: AssetImage(ImagePath.imagesWinImage))),
              );
            },
            separatorBuilder: (context, index) => 25.kh),
        30.sKh
      ],
    );
  }
}
