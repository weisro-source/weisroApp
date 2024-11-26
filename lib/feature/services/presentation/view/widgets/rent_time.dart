import 'package:flutter/material.dart';
import 'package:weisro/core/utils/sized_box_extension.dart';
import 'package:weisro/generated/l10n.dart';

import 'rent_widget.dart';

class RentTime extends StatelessWidget {
  const RentTime({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        24.kw,
        Expanded(
          child: RentWidget(
            rentTime: S.of(context).Daily,
          ),
        ),
        6.kw,
        Expanded(
          child: RentWidget(
            rentTime: S.of(context).Hours,
          ),
        ),
        6.kw,
        Expanded(
          child: RentWidget(
            rentTime: S.of(context).Both,
          ),
        ),
        24.kw,
      ],
    );
  }
}
