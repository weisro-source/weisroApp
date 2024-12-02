import 'package:flutter/material.dart';
import 'package:lottie/lottie.dart';
import 'package:weisro/core/assets_path/icons_path.dart';
import 'package:weisro/core/styles/app_style.dart';
import 'package:weisro/core/utils/sized_box_extension.dart';
import 'package:weisro/generated/l10n.dart';

class AddServiceLoadingPage extends StatelessWidget {
  const AddServiceLoadingPage({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        Center(
          child: Lottie.asset(
            IconsPath.iconsLoadingAnmation,
            width: 200,
            height: 200,
            fit: BoxFit.contain,
          ),
        ),
        25.kh,
        Text(
          S.of(context).please_wait_publishing,
          style: AppStyles.style18w500Green(context),
        )
      ],
    );
  }
}
