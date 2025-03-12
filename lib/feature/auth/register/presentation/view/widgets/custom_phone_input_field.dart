import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:intl_phone_field/countries.dart';
import 'package:intl_phone_field/country_picker_dialog.dart';
import 'package:intl_phone_field/intl_phone_field.dart';
import 'package:intl_phone_field/phone_number.dart';

import 'package:weisro/core/styles/app_color.dart';
import 'package:weisro/core/styles/app_style.dart';
import 'package:weisro/core/utils/constant.dart';
import 'package:weisro/core/utils/validate.dart';

class CustomPhoneInput extends StatefulWidget {
  const CustomPhoneInput({
    super.key,
    required this.phoneController,
    this.phoneNumberFocusNode,
    this.countryCode = 'DE',
    this.onChanged,
    this.onSubmitted,
    this.onCountryChanged,
  });
  final TextEditingController phoneController;
  final FocusNode? phoneNumberFocusNode;
  final String countryCode;
  final void Function(PhoneNumber)? onChanged;
  final void Function(String)? onSubmitted;
  final void Function(Country)? onCountryChanged;

  @override
  State<CustomPhoneInput> createState() => _CustomPhoneInputState();
}

class _CustomPhoneInputState extends State<CustomPhoneInput> {
  String countryCodeIso = "DE";
  @override
  void initState() {
    super.initState();
    if (widget.countryCode != "DE") {
      countryCodeIso = Constants.countryCodeMap[widget.countryCode] ?? "DE";
    }
  }

  @override
  Widget build(BuildContext context) {
    return IntlPhoneField(
      controller: widget.phoneController,
      focusNode: widget.phoneNumberFocusNode,
      // invalidNumberMessage: S.of(context).invalid_mobile_number,

      disableLengthCheck: false,
      // auto validateMode: Auto validateMode.always,
      autovalidateMode: AutovalidateMode.always,

      validator: (value) =>
          Validate.validatePhoneNumber(value?.number ?? "", context),
      inputFormatters: [FilteringTextInputFormatter.digitsOnly],
      dropdownIcon: const Icon(Icons.keyboard_arrow_down_outlined),
      onSubmitted: widget.onSubmitted,
      pickerDialogStyle: PickerDialogStyle(
          countryNameStyle:
              AppStyles.style10w400Second2(context).copyWith(fontSize: 16),
          searchFieldInputDecoration: InputDecoration(
            // hintText: S.of(context).find_the_country,
            // hintStyle: AppStyles.style16w600(context).copyWith(
            //     fontWeight: FontWeight.w400,
            //     color: AppColors.grey50Color,
            //     fontSize: 16.sp),
            prefixIcon: const Padding(
              padding: EdgeInsetsDirectional.only(start: 18, end: 5),
            ),
            suffixIcon: const Padding(
              padding: EdgeInsetsDirectional.only(start: 18, end: 18),
              child: Icon(CupertinoIcons.search),
            ),
            focusedBorder: OutlineInputBorder(
              borderRadius: BorderRadius.circular(20),
              borderSide: const BorderSide(
                color: AppColors.orangeColor,
                width: 1,
              ),
            ),
            enabledBorder: OutlineInputBorder(
              borderRadius: BorderRadius.circular(20),
              borderSide: const BorderSide(
                color: AppColors.orangeColor,
                width: 1,
              ),
            ),
          ),
          searchFieldCursorColor: AppColors.greyColor,
          countryCodeStyle: AppStyles.style12w400Second2(context).copyWith(
              color: AppColors.greyColor, fontWeight: FontWeight.w700)),
      showCountryFlag: true,
      dropdownTextStyle: AppStyles.style16w400Grey(context).copyWith(
          fontWeight: FontWeight.w400,
          color: AppColors.orangeColor,
          fontSize: 13),

      style: AppStyles.style16w400Grey(context).copyWith(
          fontWeight: FontWeight.w400,
          color: AppColors.greyColor,
          fontSize: 16),
      decoration: InputDecoration(
        fillColor: AppColors.whiteColor,
        filled: true,
        // prefixIcon: const Padding(
        //   padding: EdgeInsetsDirectional.only(start: 18, end: 5),
        // ),
        // suffixIcon: const Padding(
        //   padding: EdgeInsetsDirectional.only(start: 18, end: 18),
        // ),
        hintStyle: AppStyles.style16w400Grey(context).copyWith(
            fontWeight: FontWeight.w400,
            color: AppColors.greyColor,
            fontSize: 16),
        contentPadding: const EdgeInsets.all(10),
        enabledBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(20),
          borderSide: const BorderSide(
            color: AppColors.orangeColor,
            width: 1,
          ),
        ),
        focusedBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(20),
          borderSide: const BorderSide(
            color: AppColors.orangeColor,
            width: 1,
          ),
        ),
        errorBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(20),
          borderSide: const BorderSide(
            color: AppColors.redColor,
            width: 1,
          ),
        ),
        focusedErrorBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(20),
          borderSide: const BorderSide(
            color: AppColors.redColor,
            width: 1,
          ),
        ),
      ),
      initialCountryCode: countryCodeIso,

      onCountryChanged: widget.onCountryChanged,
      onChanged: widget.onChanged,
    );
  }
}
