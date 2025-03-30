import 'package:flutter/material.dart';

import 'package:weisro/core/utils/sized_box_extension.dart';
import 'package:weisro/feature/game/presentation/view/widgets/coupon_list_widget.dart';
import 'package:weisro/feature/game/presentation/view/widgets/pinned_header_widget.dart';
import 'package:weisro/feature/game/presentation/view/widgets/sliver_app_bar_game.dart';

class MyCouponsPageViewBody extends StatefulWidget {
  const MyCouponsPageViewBody({super.key});

  @override
  State<MyCouponsPageViewBody> createState() => _MyCouponsPageViewBodyState();
}

class _MyCouponsPageViewBodyState extends State<MyCouponsPageViewBody> {
  bool isSelectedRunningSpeculation = true;
  List<bool> expandedStates = List.generate(15, (index) => false);

  @override
  Widget build(BuildContext context) {
    return CustomScrollView(
      slivers: [
        const SliverAppBarWidget(
          title: "My Coupons",
        ),
        28.sKh,
        PinnedHeaderWidget(
          isSelectedRunningSpeculation: isSelectedRunningSpeculation,
          onToggle: (isRunning) {
            setState(() => isSelectedRunningSpeculation = isRunning);
          },
        ),
        21.sKh,
        const CouponListWidget(),
      ],
    );
  }
}
