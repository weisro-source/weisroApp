import 'package:country_code_picker/country_code_picker.dart';
import 'package:flutter/material.dart';
import 'package:weisro/core/styles/app_color.dart';
import 'package:weisro/core/styles/app_style.dart';
import 'package:weisro/core/widgets/custom_text_form_filed.dart';
import 'package:weisro/feature/auth/register/presentation/manager/register_cubit/register_cubit.dart';

class CountrySelectedWidget extends StatelessWidget {
  const CountrySelectedWidget({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        const CustomTextFormFiled(
          hintText: "",
          enabled: false,
        ),
        Padding(
          padding: const EdgeInsetsDirectional.only(top: 5),
          child: Align(
            alignment: Alignment.centerLeft,
            child: FittedBox(
              fit: BoxFit.scaleDown,
              child: CountryCodePicker(
                onChanged: (CountryCode countryCode) {
                  RegisterCubit.get(context).countryName =
                      countryCode.name ?? "";
                },
                showCountryOnly: true,
                showOnlyCountryWhenClosed: true,
                showFlagDialog: true,
                initialSelection: "de",
                searchStyle: AppStyles.style12w400Grey(context),
                searchDecoration: InputDecoration(
                  enabledBorder: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(4),
                    borderSide: const BorderSide(
                      color: AppColors.orangeColor,
                      width: 1,
                    ),
                  ),
                  focusedBorder: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(4),
                    borderSide: const BorderSide(
                      color: AppColors.orangeColor,
                      width: 1,
                    ),
                  ),
                ),
                flagDecoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(4),
                ),
                flagWidth: MediaQuery.of(context).size.width * 0.08,
              ),
            ),
          ),
        ),
      ],
    );
  }
}
