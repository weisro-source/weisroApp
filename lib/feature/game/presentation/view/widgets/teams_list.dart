import 'package:flutter/material.dart';
import 'package:weisro/core/utils/sized_box_extension.dart';
import 'package:weisro/feature/game/presentation/view/widgets/teams_and_result.dart';

class TeamsList extends StatelessWidget {
  const TeamsList({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return ListView.separated(
        padding:
            const EdgeInsetsDirectional.only(bottom: 10),
        itemBuilder: (context, index) {
          return const TeamsAndResult();
        },
        separatorBuilder: (context, index) {
          return 10.kh;
        },
        itemCount: 10);
  }
}
