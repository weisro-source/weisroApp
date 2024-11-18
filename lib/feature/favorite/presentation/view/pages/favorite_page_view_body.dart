import 'package:flutter/material.dart';

import 'package:weisro/core/utils/sized_box_extension.dart';
import 'package:weisro/core/widgets/service_item_list.dart';
import 'package:weisro/generated/l10n.dart';

import '../../../../../core/widgets/custom_app_bar.dart';

class FavoritePageViewBody extends StatelessWidget {
  const FavoritePageViewBody({super.key});
//todo: add favorite Empty page I translate the empty page
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: CustomScrollView(
        slivers: [
          CustomAppBar(
            title: S.of(context).Favorite_page,
          ),
          SliverToBoxAdapter(
            child: 36.kh,
          ),
          const ServiceItemList(),
          SliverToBoxAdapter(
            child: 50.kh,
          )
        ],
      ),
    );
  }
}
