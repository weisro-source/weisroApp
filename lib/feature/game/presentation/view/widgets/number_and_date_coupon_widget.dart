import 'package:flutter/material.dart';
import 'package:weisro/core/styles/app_color.dart';
import 'package:weisro/core/utils/sized_box_extension.dart';
import 'package:weisro/feature/game/presentation/game_text_style.dart';

class NumberAndDateCouponWidget extends StatelessWidget {
  const NumberAndDateCouponWidget({
    super.key,
    required this.number,
    required this.date,
  });
  final String number, date;
  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        10.kw,
        Text("Number $number",
            style: GameAppStyles.gameTextStyle16wBlueGameColorW700(context)),
        const Spacer(),
        Text(date,
            style: GameAppStyles.gameTextStyle16wBlueGameColorW700(context)
                .copyWith(color: AppColors.greyGameColor)),
        10.kw,
      ],
    );
  }
}
