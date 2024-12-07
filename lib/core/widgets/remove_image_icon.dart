import 'package:flutter/material.dart';
import 'package:weisro/core/styles/app_color.dart';
import 'package:weisro/core/styles/app_style.dart';

class RemoveImageIcon extends StatelessWidget {
  const RemoveImageIcon({
    super.key,
    required this.onRemoveImage,
  });

  final VoidCallback onRemoveImage;

  @override
  Widget build(BuildContext context) {
    return Align(
      alignment: AlignmentDirectional.topEnd,
      child: GestureDetector(
        onTap: onRemoveImage,
        child: Container(
          width: 21,
          height: 21,
          decoration: const BoxDecoration(
              shape: BoxShape.circle,
              color: AppColors.redColor),
          child: Center(
            child: Text(
              'X',
              style:
                  AppStyles.style14w500White(context),
            ),
          ),
        ),
      ),
    );
  }
}
