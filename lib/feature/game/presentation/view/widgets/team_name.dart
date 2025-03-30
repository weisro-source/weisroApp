import 'package:flutter/material.dart';
import 'package:weisro/feature/game/presentation/game_text_style.dart';

class TextForOrderWinner extends StatelessWidget {
  const TextForOrderWinner({
    super.key,
    required this.order,
  });
  final String order;
  @override
  Widget build(BuildContext context) {
    return Text(
      order,
      style: GameAppStyles.gameTextStyle20wWhiteColorW700(context),
    );
  }
}
