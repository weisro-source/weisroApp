import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_svg/svg.dart';
import 'package:weisro/core/assets_path/icons_path.dart';
import 'package:weisro/core/styles/app_color.dart';
import 'package:weisro/core/styles/app_style.dart';
import 'package:weisro/core/utils/sized_box_extension.dart';
import 'package:weisro/feature/search/presentation/managers/search_cubit/search_cubit.dart';
import 'package:weisro/feature/search/presentation/managers/search_history_cubit/search_history_cubit.dart';

class SearchResultItem extends StatelessWidget {
  final String query;

  const SearchResultItem({super.key, required this.query});

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        24.kw,
        SvgPicture.asset(IconsPath.iconsLocation),
        4.kw,
        Text(query, style: AppStyles.style12w400Grey(context)),
        const Spacer(),
        IconButton(
            onPressed: () {
              context.read<SearchCubit>().searchController.text = query;
            },
            icon: SvgPicture.asset(IconsPath.iconsArrowUp)),
        IconButton(
            onPressed: () {
              context.read<SearchHistoryCubit>().deleteSearchQuery(query);
            },
            icon: const Icon(
              Icons.delete,
              color: AppColors.redColor,
            )),
        24.kw,
      ],
    );
  }
}
