import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:weisro/core/assets_path/icons_path.dart';
import 'package:weisro/core/styles/app_color.dart';
import 'package:weisro/core/styles/app_style.dart';

class LocationFlitterDropDown extends StatelessWidget {
  const LocationFlitterDropDown({
    super.key,
    required this.selectedLocation,
    required this.locations,
    this.width = 150,
    this.height = 25,
    this.borderColor = AppColors.whiteColor,
    this.fillColor = AppColors.second1Color,
    this.borderWidth = 2,
    this.borderRadius = 2,
    this.prefixIcon = IconsPath.iconsLocation,
    this.iconColor = AppColors.orangeColor,
    this.iconWidth = 9,
    this.iconHeight = 9,
  });

  final String selectedLocation;
  final String prefixIcon;
  final List<String> locations;
  final double? width, height;
  final double? iconWidth, iconHeight;
  final double borderWidth, borderRadius;

  final Color borderColor, fillColor, iconColor;
  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: height,
      width: width,
      child: DropdownButtonFormField<String>(
        value: selectedLocation,
        items: locations.map((location) {
          return DropdownMenuItem(
            value: location,
            child: Text(
              location,
              style: AppStyles.style10w400Grey(context),
            ),
          );
        }).toList(),
        onChanged: (newValue) {
          // Handle selection changes
        },
        decoration: InputDecoration(
          prefixIcon: SvgPicture.asset(
            fit: BoxFit.scaleDown,
            height: iconHeight,
            width: iconWidth,
            prefixIcon,
            colorFilter: ColorFilter.mode(iconColor, BlendMode.srcIn),
          ),
          fillColor: fillColor,
          filled: true,
          enabledBorder: OutlineInputBorder(
            borderSide: BorderSide(color: borderColor, width: borderWidth),
            borderRadius: BorderRadius.circular(borderRadius),
          ),
          focusedBorder: OutlineInputBorder(
            borderSide: BorderSide(color: borderColor, width: borderWidth),
            borderRadius: BorderRadius.circular(borderRadius),
          ),
          errorBorder: OutlineInputBorder(
            borderSide: BorderSide(color: borderColor, width: borderWidth),
            borderRadius: BorderRadius.circular(borderRadius),
          ),
          disabledBorder: OutlineInputBorder(
            borderSide: BorderSide(color: borderColor, width: borderWidth),
            borderRadius: BorderRadius.circular(borderRadius),
          ),
          contentPadding: const EdgeInsets.symmetric(horizontal: 8),
        ),
      ),
    );
  }
}
