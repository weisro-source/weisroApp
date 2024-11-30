import 'package:flutter/material.dart';
import 'package:weisro/core/assets_path/icons_path.dart';
import 'package:weisro/core/styles/app_color.dart';
import 'package:weisro/core/styles/app_style.dart';
import 'package:weisro/core/utils/sized_box_extension.dart';
import '../../../../../core/widgets/button_with_container_orange_border.dart';
import 'button_with_container_orange_border_shimmer.dart';

class ServiceNameRowWidget extends StatelessWidget {
  final String serviceName;
  final VoidCallback onFavPressed;
  final VoidCallback onSharePressed;
  final bool isFavLoading;
  final bool isFav;

  const ServiceNameRowWidget({
    Key? key,
    required this.serviceName,
    required this.onFavPressed,
    required this.onSharePressed,
    required this.isFavLoading,
    required this.isFav,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        25.kw,
        Text(
          serviceName,
          style: AppStyles.style16w400Grey(context),
        ),
        const Spacer(),
        Visibility(
          visible: !isFavLoading,
          child: ButtonWithContainerOrangeBorder(
            icon: IconsPath.iconsFavService,
            onPressed: onFavPressed,
            color: isFav ? AppColors.orangeColor : AppColors.greyColor,
          ),
        ),
        Visibility(
            visible: isFavLoading,
            child: const ButtonWithContainerOrangeBorderShimmer()),
        8.kw,
        ButtonWithContainerOrangeBorder(
          icon: IconsPath.iconsShare,
          onPressed: onSharePressed,
        ),
        24.kw,
      ],
    );
  }
}
