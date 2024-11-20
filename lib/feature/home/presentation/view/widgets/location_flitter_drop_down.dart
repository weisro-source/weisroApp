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
  });

  final String selectedLocation;
  final List<String> locations;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 25,
      width: 150,
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
            height: 9,
            width: 9,
            IconsPath.iconsLocation,
            colorFilter: const ColorFilter.mode(
                AppColors.orangeColor, BlendMode.srcIn),
          ),
          fillColor: AppColors.second1Color,
          filled: true,
          enabledBorder: OutlineInputBorder(
            borderSide: const BorderSide(
                color: AppColors.whiteColor, width: 2),
            borderRadius: BorderRadius.circular(2),
          ),
          focusedBorder: OutlineInputBorder(
            borderSide: const BorderSide(
                color: AppColors.whiteColor, width: 2),
            borderRadius: BorderRadius.circular(2),
          ),
          errorBorder: OutlineInputBorder(
            borderSide: const BorderSide(
                color: AppColors.whiteColor, width: 2),
            borderRadius: BorderRadius.circular(2),
          ),
          disabledBorder: OutlineInputBorder(
            borderSide: const BorderSide(
                color: AppColors.whiteColor, width: 2),
            borderRadius: BorderRadius.circular(2),
          ),
          contentPadding: const EdgeInsets.symmetric(horizontal: 8),
        ),
      ),
    );
  }
}
