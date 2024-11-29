import 'package:dropdown_search/dropdown_search.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:weisro/core/assets_path/icons_path.dart';
import 'package:weisro/core/styles/app_color.dart';

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
    this.onChanged,
  });

  final String selectedLocation;
  final String prefixIcon;
  final List<String> locations;
  final double? width, height;
  final double? iconWidth, iconHeight;
  final double borderWidth, borderRadius;

  final Color borderColor, fillColor, iconColor;
  final void Function(String?)? onChanged;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: height,
      width: width,
      child: DropdownSearch<String>(
        selectedItem: selectedLocation,
        items: (filter, loadProps) {
          return locations;
        },
        decoratorProps: DropDownDecoratorProps(
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
        onChanged: onChanged,
        popupProps: PopupProps.menu(
          showSearchBox: true,
          searchFieldProps: TextFieldProps(
            decoration: InputDecoration(
              hintText: "Search location",
              border: OutlineInputBorder(
                borderSide: BorderSide(color: borderColor, width: borderWidth),
                borderRadius: BorderRadius.circular(borderRadius),
              ),
            ),
          ),
        ),
      ),
    );
  }
}
