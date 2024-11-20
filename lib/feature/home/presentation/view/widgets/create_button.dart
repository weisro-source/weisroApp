import 'package:flutter/material.dart';
import 'package:weisro/core/styles/app_color.dart';
import 'package:weisro/core/styles/app_style.dart';

class CreateBotton extends StatelessWidget {
  const CreateBotton({
    super.key,
    this.onPressed,
    required this.title,
  });
  final void Function()? onPressed;
  final String title;
  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
        onPressed: () {},
        style: ElevatedButton.styleFrom(
          minimumSize: const Size(260, 74),
          animationDuration: const Duration(milliseconds: 300),
          backgroundColor: AppColors.second1Color,
          elevation: 0,
          shadowColor: AppColors.shadow3Color,
          shape:
              ContinuousRectangleBorder(borderRadius: BorderRadius.circular(4)),
        ),
        child: Center(
          child: Text(
            title,
            style: AppStyles.style18w400Grey(context)
                .copyWith(color: AppColors.blackColor),
          ),
        ));
  }
}
