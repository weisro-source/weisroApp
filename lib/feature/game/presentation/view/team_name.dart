import 'package:flutter/material.dart';
import 'package:weisro/core/styles/app_color.dart';
import 'package:weisro/feature/game/presentation/game_text_style.dart';

class TeamName extends StatelessWidget {
  const TeamName({
    super.key,
    required this.name,
    this.color,
  });
  final String name;
  final Color? color;
  @override
  Widget build(BuildContext context) {
    return Container(
      height: 23,
      width: 124,
      decoration: const BoxDecoration(
          color: AppColors.blueGameColor,
          borderRadius: BorderRadius.all(Radius.circular(12))),
      child: Center(
        child: Text(
          name,
          style: GameAppStyles.gameTextStyle12wWhiteColorW700(context)
              .copyWith(color: color),
        ),
      ),
    );
  }
}
