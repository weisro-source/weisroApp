import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:weisro/core/assets_path/icons_path.dart';
import 'package:weisro/core/styles/app_color.dart';
import 'package:weisro/core/styles/app_style.dart';
import 'package:weisro/core/utils/sized_box_extension.dart';
import 'package:weisro/core/widgets/app_button.dart';
import 'package:weisro/core/widgets/new_app_button.dart';
import 'package:weisro/generated/l10n.dart';

class GoogleAuthButtonWidget extends StatelessWidget {
  const GoogleAuthButtonWidget({
    super.key,
    this.onPressed,
  });
  final void Function()? onPressed;
  @override
  Widget build(BuildContext context) {
    return NewAppButton(
      onPressed: onPressed,
      height: 41,
      buttonColor: AppColors.orangeWithOpacity,
      borderColor: AppColors.orangeColor,
      title: '',
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.center,
        mainAxisAlignment: MainAxisAlignment.center,
        mainAxisSize: MainAxisSize.min,
        children: [
          SvgPicture.asset(
            IconsPath.iconsGoogle,
            fit: BoxFit.scaleDown,
          ),
          8.kw,
          Flexible(
            child: Text(
              S.of(context).Sign_Up_with_Google,
              style: AppStyles.style14w500Grey(context)
                  .copyWith(fontWeight: FontWeight.w700),
            ),
          )
        ],
      ),
    );
  }
}
