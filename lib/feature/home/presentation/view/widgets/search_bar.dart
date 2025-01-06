import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_svg/svg.dart';
import 'package:weisro/core/assets_path/icons_path.dart';
import 'package:weisro/core/styles/app_color.dart';
import 'package:weisro/core/utils/helper_functions.dart';
import 'package:weisro/core/utils/sized_box_extension.dart';
import 'package:weisro/feature/home/presentation/managers/bottom_nav_bar_cubit.dart';
import 'package:weisro/feature/home/presentation/view/pages/home_page_view.dart';
import 'package:weisro/feature/home/presentation/view/widgets/custom_search_text_field.dart';

class SearchBar extends StatelessWidget {
  const SearchBar({
    super.key,
    required this.isNotificationShow,
  });
  final bool isNotificationShow;
  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        25.kw,
        Visibility(
            visible: !isNotificationShow,
            child: IconButton(
                onPressed: () {
                  HelperFunctions.navigateToBack(context);
                },
                icon: SvgPicture.asset(IconsPath.iconsArrowRight))),
        Visibility(visible: !isNotificationShow, child: 23.kw),
        Expanded(
          flex: 3,
          child: GestureDetector(
            onTap: () {
              HelperFunctions.navigateToScreenAndRemove(
                context,
                (context) => const HomePageView(),
              );
              context.read<BottomNavCubit>().changeIndex(3);
            },
            child: const SizedBox(
              height: 33,
              child: CustomSearchTextField(),
            ),
          ),
        ),
        Visibility(visible: isNotificationShow, child: 33.kw),
        Visibility(
          visible: isNotificationShow,
          child: SvgPicture.asset(
            IconsPath.iconsNotification,
            colorFilter:
                const ColorFilter.mode(AppColors.greyColor, BlendMode.srcIn),
          ),
        ),
        25.kw,
      ],
    );
  }
}
