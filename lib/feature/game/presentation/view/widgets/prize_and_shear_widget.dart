import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:weisro/core/assets_path/icons_path.dart';
import 'package:weisro/core/utils/sized_box_extension.dart';
import 'package:weisro/feature/game/presentation/game_text_style.dart';

class PrizeAndShearWidget extends StatelessWidget {
  const PrizeAndShearWidget({
    super.key,
    required this.guessValue,
  });
  final String guessValue;
  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        10.kw,
        Text(
          "Guess the prize $guessValue",
          style: GameAppStyles.gameTextStyle16wBlueGameColorW700(context),
        ),
        const Spacer(),
        IconButton(
            onPressed: () {}, icon: SvgPicture.asset(IconsPath.iconsShareGame)),
        10.kw,
      ],
    );
  }
}
