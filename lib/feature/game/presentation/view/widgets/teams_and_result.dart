import 'package:flutter/material.dart';
import 'package:weisro/core/utils/sized_box_extension.dart';

import '../team_name.dart';

class TeamsAndResult extends StatelessWidget {
  const TeamsAndResult({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        5.kw,
        const Expanded(
            flex: 2,
            child: TeamName(
              name: 'real madrid',
            )),
        5.kw,
        const Expanded(
            flex: 1,
            child: TeamName(
              name: 'own',
            )),
        5.kw,
        const Expanded(
            flex: 2,
            child: TeamName(
              name: 'barcelona',
            )),
        5.kw,
      ],
    );
  }
}
