import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:weisro/core/assets_path/icons_path.dart';
import 'package:weisro/core/cache/cache_helper.dart';
import 'package:weisro/core/cache/cache_keys.dart';

import 'package:weisro/core/styles/app_color.dart';
import 'package:weisro/core/styles/app_style.dart';
import 'package:weisro/core/utils/helper_functions.dart';
import 'package:weisro/core/utils/sized_box_extension.dart';
import 'package:weisro/core/utils/validate.dart';
import 'package:weisro/core/widgets/custom_dash_line.dart';
import 'package:weisro/core/widgets/custom_loading.dart';
import 'package:weisro/core/widgets/custom_text_form_filed.dart';
import 'package:weisro/core/widgets/material_banner.dart';
import 'package:weisro/feature/auth/data/models/cities_model.dart';
import 'package:weisro/feature/auth/data/models/countries_model.dart';
import 'package:weisro/feature/auth/register/presentation/manager/get_all_countries_cubit/get_all_countries_cubit.dart';
import 'package:weisro/feature/auth/register/presentation/manager/get_cities_of_a_specified_country_cubit/get_cities_of_a_specified_country_cubit.dart';
import 'package:weisro/feature/auth/register/presentation/view/widgets/city_in_state_drop_down.dart';
import 'package:weisro/feature/auth/register/presentation/view/widgets/custom_country_dropdown.dart';
import 'package:weisro/feature/auth/register/presentation/view/widgets/loading_filed.dart';
import 'package:weisro/feature/booking/presentation/view/widgets/cancel_and_button.dart';
import 'package:weisro/feature/home/presentation/view/widgets/location_flitter_drop_down.dart';
import 'package:weisro/feature/profile/presentation/manager/edit_user_info_cubit/edit_user_info_cubit.dart';
import 'package:weisro/feature/profile/presentation/view/widgets/title_filed_edit_account.dart';
import 'package:weisro/generated/l10n.dart';

class EditProfilePageViewBody extends StatefulWidget {
  const EditProfilePageViewBody({super.key});

  @override
  State<EditProfilePageViewBody> createState() =>
      _EditProfilePageViewBodyState();
}

class _EditProfilePageViewBodyState extends State<EditProfilePageViewBody> {
  String newCity = "";
  String newCityInState = "";
  @override
  void initState() {
    BlocProvider.of<EditUserInfoCubit>(context).initControllers();
    newCity = CacheHelper.getData(key: CacheKeys.kCityName);

    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    EditUserInfoCubit editUserInfoCubit = EditUserInfoCubit.get(context);
    Country newCountrySelected =
        GetAllCountriesCubit.get(context).selectedCountry;
    return SingleChildScrollView(
      child: Form(
        key: editUserInfoCubit.editAccountFormKey,
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
                    title: S.of(context).First_Name,
                  ),
                  15.kh,
                  CustomTextFormFiled(
                    hintText: S.of(context).First_Name,
                    borderRadius: 20,
                    borderColor: AppColors.orangeColor,
                    controller: editUserInfoCubit.firstNameController,
                    validator: (value) => Validate.validateFieldWithTitle(
                        value, S.of(context).First_Name, context),
                  ),
                  20.kh,
                  const CustomDashedLine(),
                  15.kh,
                  TitleFiledEditAccount(
                    title: S.of(context).Last_Name,
                  ),
                  15.kh,
                  CustomTextFormFiled(
                    hintText: S.of(context).Last_Name,
                    borderRadius: 20,
                    borderColor: AppColors.orangeColor,
                    controller: editUserInfoCubit.lastNameController,
                    validator: (value) => Validate.validateFieldWithTitle(
                        value, S.of(context).Last_Name, context),
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
                        newCountrySelected =
                            GetAllCountriesCubit.get(context).selectedCountry;
                        return CountryDropdown(
                          countries: countries,
                          selectedCountry:
                              GetAllCountriesCubit.get(context).selectedCountry,
                          onChanged: (newCountry) async {
                            newCountrySelected = newCountry ??
                                Country(id: "", flag: "", name: "name");
                            await GetCitiesOfASpecifiedCountryCubit.get(context)
                                .getAllCitiesOfASpecifiedCountry(
                                    newCountry?.id ?? "");
                          },
                        );
                      } else if (getAllCountriesState
                          is GetAllCountriesLoading) {
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
                            state.cities.states.map((e) => e.name).toList();
                        final cachedCityName =
                            CacheHelper.getData(key: CacheKeys.kCityName);
                        final cachedStateName =
                            CacheHelper.getData(key: CacheKeys.kState);
                        String firstCity = cityNameList.firstWhere(
                            (cityName) => cityName == cachedCityName,
                            orElse: () => cityNameList.isNotEmpty
                                ? cityNameList.first
                                : '');
                        firstCity = newCity;

                        // for new city ;;
                        CityState cityOfState = state.cities.states.firstWhere(
                          (element) => element.name == firstCity,
                          orElse: () => state.cities.states.first,
                        );
                        City firstCityForState = cityOfState.cities.firstWhere(
                          (element) => element.name == cachedStateName,
                          orElse: () => cityOfState.cities.first,
                        );
                        return Column(
                          children: [
                            LocationFlitterDropDown(
                              fillColor: AppColors.whiteColor,
                              borderColor: AppColors.orangeColor,
                              iconColor: AppColors.greyColor,
                              height: 50,
                              width: HelperFunctions.getScreenWidth(context),
                              iconHeight: 24,
                              iconWidth: 10,
                              borderWidth: 1,
                              borderRadius: 20,
                              selectedLocation: firstCity,
                              locations: cityNameList,
                              prefixIcon: IconsPath.iconsLocation,
                              onChanged: (selectedCategory) async {
                                newCity = selectedCategory ?? "";
                                GetCitiesOfASpecifiedCountryCubit.get(context)
                                    .updateCitiesState(state.cities);
                              },
                            ),
                            15.kh,
                            const CustomDashedLine(),
                            15.kh,
                            TitleFiledEditAccount(
                              title: S.of(context).City,
                            ),
                            20.kh,
                            CityInStateDropdown(
                              cityList: cityOfState.cities,
                              selectedCity: firstCityForState,
                              onChanged: (newCity) {
                                // registerCubit.cityOfStateName =
                                //     newCity?.name ?? "";
                              },
                            ),
                          ],
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
                    borderRadius: 20,
                    borderColor: AppColors.orangeColor,
                    focusNode: editUserInfoCubit.postalCodeFocusNode,
                    controller: editUserInfoCubit.postalCodeController,
                    validator: (value) => Validate.validateFieldWithTitle(
                        value, S.of(context).Postal_Code, context),
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
                    borderRadius: 20,
                    borderColor: AppColors.orangeColor,
                    focusNode: editUserInfoCubit.streetFocusNode,
                    controller: editUserInfoCubit.streetController,
                    validator: (value) => Validate.validateFieldWithTitle(
                        value, S.of(context).Street, context),
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
                    borderRadius: 20,
                    borderColor: AppColors.orangeColor,
                    focusNode: editUserInfoCubit.houseNumberFocusNode,
                    controller: editUserInfoCubit.houseNumberController,
                    validator: (value) => Validate.validateFieldWithTitle(
                        value, S.of(context).House_Number, context),
                  ),
                  30.kh,
                  BlocConsumer<EditUserInfoCubit, EditUserInfoState>(
                    listener: (context, editUserState) async {
                      final messenger = ScaffoldMessenger.of(context);

                      if (editUserState is EditUserInfoSuccess) {
                        await editUserInfoCubit.updateCacheData(
                          newCity,
                          newCountrySelected,
                          editUserInfoCubit.firstNameController.text,
                          editUserInfoCubit.lastNameController.text,
                          editUserInfoCubit.postalCodeController.text,
                          editUserInfoCubit.streetController.text,
                          editUserInfoCubit.houseNumberController.text,
                        );
                        if (context.mounted) {
                          MaterialBanner materialBanner =
                              CustomMaterialBanner.successMaterialBanner(
                                  S.of(context).Update_Successful,
                                  S
                                      .of(context)
                                      .Information_Updated_Successfully);
                          ScaffoldMessenger.of(context)
                            ..hideCurrentMaterialBanner()
                            ..showMaterialBanner(materialBanner);
                          Future.delayed(const Duration(seconds: 3), () {
                            if (mounted) {
                              messenger.hideCurrentMaterialBanner();
                            }
                          });
                        }
                      } else if (editUserState is EditUserInfoFailures) {
                        MaterialBanner materialBanner =
                            CustomMaterialBanner.failureMaterialBanner(
                                S.of(context).Update_Failed,
                                S.of(context).Error_Updating_Information);
                        ScaffoldMessenger.of(context)
                          ..hideCurrentMaterialBanner()
                          ..showMaterialBanner(materialBanner);
                        Future.delayed(const Duration(seconds: 3), () {
                          if (mounted) {
                            messenger.hideCurrentMaterialBanner();
                          }
                        });
                      }
                    },
                    builder: (context, editUserState) {
                      if (editUserState is EditUserInfoLoading) {
                        return const Center(
                          child: CustomLoading(
                            size: 30,
                            animationType: "discreteCircular",
                          ),
                        );
                      } else {
                        return CancelAndButton(
                          secondButton: S.of(context).Save,
                          onBookPressed: () async {
                            if (!HelperFunctions.validateForm(
                                editUserInfoCubit.editAccountFormKey)) {
                              return;
                            } else {
                              await editUserInfoCubit.editUser(
                                editUserInfoCubit.prepareUserData(
                                  firstName: editUserInfoCubit
                                      .firstNameController.text,
                                  lastName:
                                      editUserInfoCubit.lastNameController.text,
                                  city: newCity,
                                  country: newCountrySelected.name,
                                  postalCode: editUserInfoCubit
                                      .postalCodeController.text,
                                  houseNumber: editUserInfoCubit
                                      .houseNumberController.text,
                                  street:
                                      editUserInfoCubit.streetController.text,
                                ),
                              );
                            }
                          },
                          onCancelPressed: () {
                            HelperFunctions.navigateToBack(context);
                          },
                        );
                      }
                    },
                  ),
                  60.kh,
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}
