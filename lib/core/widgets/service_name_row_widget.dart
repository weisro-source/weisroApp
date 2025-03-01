import 'package:flutter/material.dart';
import 'package:weisro/core/assets_path/icons_path.dart';
import 'package:weisro/core/styles/app_color.dart';
import 'package:weisro/core/styles/app_style.dart';
import 'package:weisro/core/utils/sized_box_extension.dart';
import 'package:weisro/core/widgets/button_with_orange_container_orange_border.dart';
import '../../../../../core/widgets/button_with_container_orange_border.dart';
import 'button_with_container_orange_border_shimmer.dart';

class ServiceNameRowWidget extends StatelessWidget {
  final String serviceName;
  final VoidCallback onFavPressed;
  final VoidCallback onSharePressed;
  final bool isFavLoading;
  final bool isFav;
  final bool isNameVisible;

  const ServiceNameRowWidget({
    Key? key,
    required this.serviceName,
    required this.onFavPressed,
    required this.onSharePressed,
    required this.isFavLoading,
    required this.isFav,
    this.isNameVisible = true,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Visibility(visible: isNameVisible, child: 25.kw),
        Visibility(
          visible: isNameVisible,
          child: Text(
            serviceName,
            style: AppStyles.style16w400Grey(context),
          ),
        ),
        Visibility(visible: isNameVisible, child: const Spacer()),
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

class NewServiceNameRowWidget extends StatelessWidget {
  final String serviceName;
  final VoidCallback onFavPressed;
  final VoidCallback onSharePressed;
  final bool isFavLoading;
  final bool isFav;
  final bool isNameVisible;

  const NewServiceNameRowWidget({
    Key? key,
    required this.serviceName,
    required this.onFavPressed,
    required this.onSharePressed,
    required this.isFavLoading,
    required this.isFav,
    this.isNameVisible = true,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Visibility(visible: isNameVisible, child: 25.kw),
        Visibility(
          visible: isNameVisible,
          child: Text(
            serviceName,
            style: AppStyles.style16w400Grey(context),
          ),
        ),
        Visibility(visible: isNameVisible, child: const Spacer()),
        Visibility(
          visible: !isFavLoading,
          child: ButtonWithOrangeContainerOrangeBorder(
            icon: IconsPath.iconsFavService,
            onPressed: onFavPressed,
            color: isFav ? AppColors.orangeColor : AppColors.greyColor,
          ),
        ),
        Visibility(
            visible: isFavLoading,
            child: const ButtonWithContainerOrangeBorderShimmer()),
        8.kw,
        ButtonWithOrangeContainerOrangeBorder(
          icon: IconsPath.iconsShare,
          onPressed: onSharePressed,
        ),
        24.kw,
      ],
    );
  }
}
