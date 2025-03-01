import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:weisro/core/styles/app_color.dart';

/// A customizable button widget with an orange-bordered, lightOrangeColor container.
///
/// This widget creates a button with a rounded rectangular shape,
/// an orange border, and a centered icon. It allows for an optional
/// click action and custom icon color.
///
/// ### Example Usage:
/// ```dart
/// ButtonWithOrangeContainerOrangeBorder(
///   onPressed: () {
///     // Handle button press
///   },
///   icon: 'assets/icons/sample_icon.svg',
///   color: Colors.black, // Custom icon color
/// )
/// ```
///
/// ### Parameters:
/// - [onPressed]: A callback function triggered when the button is pressed.
/// - [icon]: The path to the SVG icon displayed inside the button.
/// - [color]: The color of the icon (default is [AppColors.greyColor]).
///
/// The button has a fixed size of 43x31 and includes a shadow effect.
class ButtonWithOrangeContainerOrangeBorder extends StatelessWidget {
  /// Creates a button with an orange border, white background, and an icon.
  const ButtonWithOrangeContainerOrangeBorder({
    super.key,
    this.onPressed,
    required this.icon,
    this.color = AppColors.greyColor,
  });

  final void Function()? onPressed;
  final String icon;
  final Color color;

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 31,
      width: 43,
      decoration: ShapeDecoration(
        color: AppColors.lightOrangeColor,
        shape: RoundedRectangleBorder(
          side: const BorderSide(width: 1, color: AppColors.orangeColor),
          borderRadius: BorderRadius.circular(20),
        ),
        shadows: const [
          BoxShadow(
            color: AppColors.shadow2Color,
            blurRadius: 4,
            offset: Offset(0, 2),
            spreadRadius: 0,
          ),
        ],
      ),
      child: Center(
        child: IconButton(
          onPressed: onPressed,
          icon: SvgPicture.asset(
            icon,
            colorFilter: ColorFilter.mode(color, BlendMode.srcIn),
          ),
        ),
      ),
    );
  }
}
