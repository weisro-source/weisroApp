import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:weisro/core/assets_path/icons_path.dart';
import 'package:weisro/core/cache/cache_helper.dart';
import 'package:weisro/core/cache/cache_keys.dart';

import 'package:weisro/core/styles/app_color.dart';
import 'package:weisro/core/styles/app_style.dart';
import 'package:weisro/core/utils/helper_functions.dart';
import 'package:weisro/core/utils/sized_box_extension.dart';
import 'package:weisro/core/widgets/custom_dash_line.dart';
import 'package:weisro/core/widgets/custom_text_form_filed.dart';
import 'package:weisro/feature/auth/data/models/countries_model.dart';
import 'package:weisro/feature/auth/register/presentation/manager/get_all_countries_cubit/get_all_countries_cubit.dart';
import 'package:weisro/feature/auth/register/presentation/manager/get_cities_of_a_specified_country_cubit/get_cities_of_a_specified_country_cubit.dart';
import 'package:weisro/feature/auth/register/presentation/view/widgets/custom_country_dropdown.dart';
import 'package:weisro/feature/auth/register/presentation/view/widgets/loading_filed.dart';
import 'package:weisro/feature/home/presentation/view/widgets/location_flitter_drop_down.dart';
import 'package:weisro/feature/profile/presentation/manager/edit_user_info_cubit/edit_user_info_cubit.dart';
import 'package:weisro/feature/profile/presentation/view/widgets/title_filed_edit_account.dart';
import 'package:weisro/generated/l10n.dart';

class EditProfilePageViewBody extends StatelessWidget {
  const EditProfilePageViewBody({super.key});

  @override
  Widget build(BuildContext context) {
    EditUserInfoCubit editUserInfoCubit = EditUserInfoCubit.get(context);
    return SingleChildScrollView(
      child: Column(
        children: [
          39.kh,
          Center(
            child: Text(
              S.of(context).Personal_Information,
              style: AppStyles.style18w500Grey(context),
            ),
          ),
          Padding(
            padding: const EdgeInsetsDirectional.symmetric(horizontal: 33),
            child: Column(
              children: [
                TitleFiledEditAccount(
                  title: S.of(context).Full_Name,
                ),
                15.kh,
                CustomTextFormFiled(
                  hintText: S.of(context).Full_Name,
                  controller: editUserInfoCubit.fullNameController,
                ),
                20.kh,
                const CustomDashedLine(),
                15.kh,
                TitleFiledEditAccount(
                  title: S.of(context).Country,
                ),
                20.kh,
                BlocBuilder<GetAllCountriesCubit, GetAllCountriesState>(
                  builder: (context, getAllCountriesState) {
                    if (getAllCountriesState is GetAllCountriesSuccess) {
                      final countries = getAllCountriesState.countries;
                      return CountryDropdown(
                        countries: countries,
                        selectedCountry:
                            GetAllCountriesCubit.get(context).selectedCountry,
                        onChanged: (newCountry) async {
                          GetAllCountriesCubit.get(context).selectCountry(
                              newCountry ??
                                  Country(id: "", flag: "", name: ""));
                          await GetCitiesOfASpecifiedCountryCubit.get(context)
                              .getAllCitiesOfASpecifiedCountry(
                                  newCountry?.id ?? "");
                        },
                      );
                    } else if (getAllCountriesState is GetAllCountriesLoading) {
                      return const LoadingFiled();
                    } else if (getAllCountriesState
                        is GetAllCountriesFailures) {
                      return const Center(
                          child: Text("Failed to load countries"));
                    }

                    return const SizedBox();
                  },
                ),
                15.kh,
                const CustomDashedLine(),
                15.kh,
                TitleFiledEditAccount(
                  title: S.of(context).City,
                ),
                20.kh,
                BlocBuilder<GetCitiesOfASpecifiedCountryCubit,
                    GetCitiesOfASpecifiedCountryState>(
                  builder: (context, state) {
                    if (state is GetCitiesOfASpecifiedCountrySuccess) {
                      List<String> cityNameList =
                          state.cities.cities.map((e) => e.name).toList();
                      // String firstCity = cityNameList.firstWhere((cityName) =>
                      //     cityName ==
                      //     CacheHelper.getData(key: CacheKeys.kCityName));
                      String firstCity = cityNameList.first;
                      // String firstCity = cityNameList.first;
                      return LocationFlitterDropDown(
                        fillColor: AppColors.whiteColor,
                        borderColor: AppColors.greyColor,
                        iconColor: AppColors.greyColor,
                        height: 50,
                        width: HelperFunctions.getScreenWidth(context),
                        iconHeight: 24,
                        iconWidth: 10,
                        borderWidth: 1,
                        borderRadius: 8,
                        selectedLocation: firstCity,
                        locations: cityNameList,
                        prefixIcon: IconsPath.iconsLocation,
                        onChanged: (selectedCategory) async {
                          CacheHelper.setData(
                              key: CacheKeys.kCityName,
                              value: selectedCategory);
                        },
                      );
                    } else if (state is GetCitiesOfASpecifiedCountryLoading) {
                      return const LoadingFiled();
                    } else {
                      return const SizedBox();
                    }
                  },
                ),
                15.kh,
                const CustomDashedLine(),
                15.kh,
                TitleFiledEditAccount(
                  title: S.of(context).Postal_Code,
                ),
                20.kh,
                CustomTextFormFiled(
                  hintText: S.of(context).Postal_Code,
                  focusNode: editUserInfoCubit.postalCodeFocusNode,
                  controller: editUserInfoCubit.postalCodeController,
                  onFieldSubmitted: (p0) {
                    HelperFunctions.requestNextFocus(
                        editUserInfoCubit.postalCodeFocusNode,
                        editUserInfoCubit.streetFocusNode,
                        context);
                  },
                ),
                15.kh,
                const CustomDashedLine(),
                15.kh,
                TitleFiledEditAccount(
                  title: S.of(context).Street,
                ),
                20.kh,
                CustomTextFormFiled(
                  hintText: S.of(context).Street,
                  focusNode: editUserInfoCubit.streetFocusNode,
                  controller: editUserInfoCubit.streetController,
                  onFieldSubmitted: (p0) {
                    HelperFunctions.requestNextFocus(
                        editUserInfoCubit.streetFocusNode,
                        editUserInfoCubit.houseNumberFocusNode,
                        context);
                  },
                ),
                15.kh,
                const CustomDashedLine(),
                15.kh,
                TitleFiledEditAccount(
                  title: S.of(context).House_Number,
                ),
                20.kh,
                CustomTextFormFiled(
                  hintText: S.of(context).House_Number,
                  focusNode: editUserInfoCubit.houseNumberFocusNode,
                  controller: editUserInfoCubit.houseNumberController,
                ),
                60.kh,
              ],
            ),
          )
        ],
      ),
    );
  }
}
