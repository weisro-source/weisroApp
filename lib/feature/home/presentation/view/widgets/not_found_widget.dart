import 'package:flutter/material.dart';
import 'package:weisro/core/assets_path/image_path.dart';
import 'package:weisro/core/styles/app_style.dart';
import 'package:weisro/core/utils/sized_box_extension.dart';
import 'package:weisro/generated/l10n.dart';

class NotFoundWidget extends StatelessWidget {
  const NotFoundWidget({
    super.key,
    this.title,
  });
  final String? title;
  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        20.kh,
        Center(
          child: Image.asset(
              width: 137,
              height: 133,
              fit: BoxFit.scaleDown,
              ImagePath.imagesNotFound),
        ),
        20.kh,
        Text(
          title ?? S.of(context).No_Services_Available,
          style: AppStyles.style16w400Grey(context),
        )
      ],
    );
  }
}
