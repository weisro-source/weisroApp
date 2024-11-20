import 'package:flutter/material.dart';
import 'package:weisro/core/styles/app_style.dart';
import 'package:weisro/core/utils/sized_box_extension.dart';
import 'package:weisro/core/widgets/custom_app_bar.dart';
import 'package:weisro/core/widgets/service_item_list.dart';
import 'package:weisro/generated/l10n.dart';

class SearchResultPageViewBody extends StatelessWidget {
  const SearchResultPageViewBody({super.key});

  @override
  Widget build(BuildContext context) {
    return CustomScrollView(
      slivers: [
        CustomAppBar(title: S.of(context).Search_Page),
        SliverToBoxAdapter(
          child: 44.kh,
        ),
        SliverPadding(
          padding: const EdgeInsetsDirectional.symmetric(horizontal: 24),
          sliver: SliverToBoxAdapter(
            child: Text(
              "12 ${S.of(context).Result_Found}",
              style: AppStyles.style14w500Orange(context),
            ),
          ),
        ),
        SliverToBoxAdapter(
          child: 10.kh,
        ),
        const ServiceItemList()
      ],
    );
  }
}
