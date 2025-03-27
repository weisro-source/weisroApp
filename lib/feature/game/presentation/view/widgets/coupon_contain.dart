import 'package:flutter/material.dart';
import 'package:weisro/core/utils/sized_box_extension.dart';
import 'package:weisro/feature/game/presentation/view/pages/my_coupons_page_view_body.dart';
import 'package:weisro/feature/game/presentation/view/widgets/number_and_date_coupon_widget.dart';

import 'prize_and_shear_widget.dart';

class CouponContain extends StatelessWidget {
  const CouponContain({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        10.kh,
        const NumberAndDateCouponWidget(
          date: '01.01.2025',
          number: "232025",
        ),
        const PrizeAndShearWidget(
          guessValue: '150',
        )
      ],
    );
  }
}
