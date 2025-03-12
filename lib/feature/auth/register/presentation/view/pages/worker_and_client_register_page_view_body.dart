import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:weisro/core/styles/app_color.dart';
import 'package:weisro/core/styles/app_style.dart';
import 'package:weisro/core/utils/helper_functions.dart';
import 'package:weisro/core/utils/sized_box_extension.dart';
import 'package:weisro/core/utils/validate.dart';
import 'package:weisro/core/widgets/custom_loading.dart';
import 'package:weisro/core/widgets/logo_image_widget.dart';
import 'package:weisro/core/widgets/new_app_button.dart';
import 'package:weisro/feature/auth/data/models/countries_model.dart';
import 'package:weisro/feature/auth/google_auth/google_auth.dart';
import 'package:weisro/feature/auth/google_auth/google_auth_state.dart';
import 'package:weisro/feature/auth/login/presentation/view/pages/login_page_view.dart';
import 'package:weisro/feature/auth/register/presentation/manager/get_all_countries_cubit/get_all_countries_cubit.dart';
import 'package:weisro/feature/auth/register/presentation/manager/get_cities_of_a_specified_country_cubit/get_cities_of_a_specified_country_cubit.dart';
import 'package:weisro/feature/auth/register/presentation/manager/register_cubit/register_cubit.dart';
import 'package:weisro/feature/auth/register/presentation/view/pages/second_worker_and_client_register_page_view.dart';
import 'package:weisro/feature/auth/register/presentation/view/pages/worker_and_client_register_page_view.dart';
import 'package:weisro/feature/auth/register/presentation/view/widgets/city_drop_down.dart';
import 'package:weisro/feature/auth/register/presentation/view/widgets/city_in_state_drop_down.dart';
import 'package:weisro/feature/auth/register/presentation/view/widgets/custom_country_dropdown.dart';
import 'package:weisro/generated/l10n.dart';
import '../../../../../../core/widgets/custom_text_form_filed.dart';
import '../widgets/google_auth_button_widget.dart';
import '../widgets/have_an_account.dart';
import '../widgets/loading_filed.dart';
import '../widgets/or_text_widget.dart';

class WorkerAndClientRegisterPageViewBody extends StatefulWidget {
  const WorkerAndClientRegisterPageViewBody(
      {super.key, required this.isWorkerAuth, this.isGoogleAuth = false});
  final bool isWorkerAuth;
  final bool isGoogleAuth;

  @override
  State<WorkerAndClientRegisterPageViewBody> createState() =>
      _WorkerAndClientRegisterPageViewBodyState();
}

class _WorkerAndClientRegisterPageViewBodyState
    extends State<WorkerAndClientRegisterPageViewBody> {
  @override
  Widget build(BuildContext context) {
    RegisterCubit registerCubit = RegisterCubit.get(context);
    return Padding(
      padding: const EdgeInsetsDirectional.only(start: 32, end: 32),
      child: Form(
        key: registerCubit.registerFormKey,
        child: CustomScrollView(
          slivers: [
            34.sKh,
            const SliverToBoxAdapter(
              child: Align(
                alignment: AlignmentDirectional.topStart,
                child: LogoImageWidget(),
              ),
            ),
            24.sKh,
            SliverToBoxAdapter(
              child: Text(
                S.of(context).Login_Information,
                style: AppStyles.style18w500Grey(context).copyWith(
                    color: AppColors.orangeColor, fontWeight: FontWeight.w700),
              ),
            ),
            6.sKh,
            SliverToBoxAdapter(
              child: Text(
                S.of(context).Fill_Registration_Info,
                style: AppStyles.style10w400Grey(context),
              ),
            ),
            //* this a steeper widget
            //! this steeper in old design ....
            // const SliverToBoxAdapter(
            //     child: CustomSteeperWidget(
            //   isTowStepActive: false,
            // )),
            SliverToBoxAdapter(
              child: 53.kh,
            ),
            //!
            // SliverToBoxAdapter(
            //     child: Visibility(
            //   visible: !widget.isGoogleAuth,
            //   child: TitleForTextFromFiled(
            //     title: S.of(context).First_Name,
            //   ),
            // )),
            // SliverToBoxAdapter(
            //   child: Visibility(visible: !widget.isGoogleAuth, child: 5.kh),
            // ),
            SliverToBoxAdapter(
              child: Visibility(
                visible: !widget.isGoogleAuth,
                child: CustomTextFormFiled(
                  hintText: S.of(context).First_Name,
                  controller: registerCubit.firstNameController,
                  focusNode: registerCubit.firstNameFocusNode,
                  keyboardType: TextInputType.name,
                  borderColor: AppColors.orangeColor,
                  borderRadius: 20,
                  validator: (value) => Validate.validateFieldWithTitle(
                      value, S.of(context).First_Name, context),
                  onFieldSubmitted: (p0) {
                    HelperFunctions.requestNextFocus(
                        registerCubit.firstNameFocusNode,
                        registerCubit.lastNameFocusNode,
                        context);
                  },
                ),
              ),
            ),
            SliverToBoxAdapter(
              child: Visibility(visible: !widget.isGoogleAuth, child: 20.kh),
            ),
            // SliverToBoxAdapter(
            //     child: Visibility(
            //   visible: !widget.isGoogleAuth,
            //   child: TitleForTextFromFiled(
            //     title: S.of(context).Last_Name,
            //   ),
            // )),
            // SliverToBoxAdapter(
            //   child: Visibility(visible: !widget.isGoogleAuth, child: 5.kh),
            // ),
            SliverToBoxAdapter(
              child: Visibility(
                visible: !widget.isGoogleAuth,
                child: CustomTextFormFiled(
                  hintText: S.of(context).Last_Name,
                  controller: registerCubit.lastNameController,
                  focusNode: registerCubit.lastNameFocusNode,
                  borderColor: AppColors.orangeColor,
                  borderRadius: 20,
                  validator: (value) => Validate.validateFieldWithTitle(
                      value, S.of(context).Last_Name, context),
                  keyboardType: TextInputType.name,
                  onFieldSubmitted: (p0) {
                    HelperFunctions.requestNextFocus(
                        registerCubit.lastNameFocusNode,
                        registerCubit.lastNameFocusNode,
                        context);
                  },
                ),
              ),
            ),
            SliverToBoxAdapter(
              child: Visibility(visible: !widget.isGoogleAuth, child: 20.kh),
            ),
            // SliverToBoxAdapter(
            //     child: TitleForTextFromFiled(
            //   title: S.of(context).Country,
            // )),
            // SliverToBoxAdapter(
            //   child: 5.kh,
            // ),

            SliverToBoxAdapter(
              child: BlocBuilder<GetAllCountriesCubit, GetAllCountriesState>(
                builder: (context, getAllCountriesState) {
                  if (getAllCountriesState is GetAllCountriesSuccess) {
                    final countries = getAllCountriesState.countries;
                    registerCubit.cityName =
                        GetAllCountriesCubit.get(context).selectedCountry.name;
                    return SizedBox(
                      height: 50,
                      child: CountryDropdown(
                        countries: countries,
                        selectedCountry:
                            GetAllCountriesCubit.get(context).selectedCountry,
                        onChanged: (newCountry) async {
                          GetAllCountriesCubit.get(context).selectCountry(
                              newCountry ??
                                  Country(id: "", flag: "", name: ""));
                          registerCubit.countryName = newCountry?.name ?? "";
                          await GetCitiesOfASpecifiedCountryCubit.get(context)
                              .getAllCitiesOfASpecifiedCountry(
                                  newCountry?.id ?? "");
                          if (context.mounted) {
                            registerCubit.cityName = context
                                .read<GetCitiesOfASpecifiedCountryCubit>()
                                .cityName;
                          }
                        },
                      ),
                    );
                  } else if (getAllCountriesState is GetAllCountriesLoading) {
                    return const LoadingFiled();
                  } else if (getAllCountriesState is GetAllCountriesFailures) {
                    return const Center(
                        child: Text("Failed to load countries"));
                  }

                  return const SizedBox();
                },
              ),
            ),

            SliverToBoxAdapter(
              child: 20.kh,
            ),
            // SliverToBoxAdapter(
            //     child: TitleForTextFromFiled(
            //   title: S.of(context).City,
            // )),
            // SliverToBoxAdapter(
            //   child: 5.kh,
            // ),

            SliverToBoxAdapter(
              child: BlocBuilder<GetCitiesOfASpecifiedCountryCubit,
                  GetCitiesOfASpecifiedCountryState>(
                builder: (context, getAllCitiesState) {
                  if (getAllCitiesState
                      is GetCitiesOfASpecifiedCountrySuccess) {
                    // Access the current cubit and states
                    final cubit =
                        GetCitiesOfASpecifiedCountryCubit.get(context);
                    final states = getAllCitiesState.cities.states;
                    final selectedState = states.firstWhere(
                      (state) => state.name == cubit.cityName,
                      orElse: () => states.first,
                    );
                    registerCubit.cityOfStateName =
                        selectedState.cities.first.name;
                    return Column(
                      children: [
                        CityDropdown(
                          cityList: getAllCitiesState.cities,
                          onChanged: (value) {
                            cubit.cityName = value?.name ?? "";
                            registerCubit.cityName = value?.name ?? "";
                            cubit.emit(
                              GetCitiesOfASpecifiedCountrySuccess(
                                cities: getAllCitiesState.cities,
                              ),
                            );
                          },
                          selectedCity: selectedState,
                        ),
                        20.kh,
                        // TitleForTextFromFiled(
                        //   title: S.of(context).City,
                        // ),
                        // 5.kh,
                        CityInStateDropdown(
                          cityList: selectedState.cities,
                          selectedCity: selectedState.cities.first,
                          onChanged: (newCity) {
                            registerCubit.cityOfStateName = newCity?.name ?? "";
                          },
                        ),
                      ],
                    );
                  } else if (getAllCitiesState
                      is GetCitiesOfASpecifiedCountryLoading) {
                    return const LoadingFiled();
                  } else {
                    return const SizedBox();
                  }
                },
              ),
            ),
            SliverToBoxAdapter(
              child: 20.kh,
            ),
            // SliverToBoxAdapter(
            //     child: TitleForTextFromFiled(
            //   title: S.of(context).Postal_Code,
            // )),
            // SliverToBoxAdapter(
            //   child: 5.kh,
            // ),
            SliverToBoxAdapter(
              child: CustomTextFormFiled(
                controller: registerCubit.postalCodeController,
                focusNode: registerCubit.postalCodeFocusNode,
                keyboardType: TextInputType.number,
                hintText: registerCubit.hintTextX,
                borderColor: AppColors.orangeColor,
                borderRadius: 20,
                validator: (value) => Validate.validateFieldWithTitle(
                    value, S.of(context).Postal_Code, context),
                onFieldSubmitted: (_) {
                  HelperFunctions.requestNextFocus(
                      registerCubit.postalCodeFocusNode,
                      registerCubit.streetFocusNode,
                      context);
                },
              ),
            ),
            SliverToBoxAdapter(
              child: 20.kh,
            ),
            // SliverToBoxAdapter(
            //     child: TitleForTextFromFiled(
            //   title: S.of(context).Street,
            // )),
            // SliverToBoxAdapter(
            //   child: 5.kh,
            // ),
            SliverToBoxAdapter(
              child: CustomTextFormFiled(
                hintText: "",
                controller: registerCubit.streetController,
                focusNode: registerCubit.streetFocusNode,
                keyboardType: TextInputType.streetAddress,
                borderColor: AppColors.orangeColor,
                borderRadius: 20,
                validator: (value) => Validate.validateFieldWithTitle(
                    value, S.of(context).Street, context),
                onFieldSubmitted: (_) {
                  HelperFunctions.requestNextFocus(
                      registerCubit.streetFocusNode,
                      registerCubit.houseNumberFocusNode,
                      context);
                },
              ),
            ),
            SliverToBoxAdapter(
              child: 20.kh,
            ),
            // SliverToBoxAdapter(
            //     child: TitleForTextFromFiled(
            //   title: S.of(context).House_Number,
            // )),
            // SliverToBoxAdapter(
            //   child: 5.kh,
            // ),
            SliverToBoxAdapter(
              child: CustomTextFormFiled(
                hintText: registerCubit.hintTextX,
                controller: registerCubit.houseNumberController,
                focusNode: registerCubit.houseNumberFocusNode,
                keyboardType: TextInputType.number,
                borderColor: AppColors.orangeColor,
                borderRadius: 20,
                validator: (value) => Validate.validateFieldWithTitle(
                    value, S.of(context).House_Number, context),
                onFieldSubmitted: (_) {
                  HelperFunctions.requestNextFocus(
                      registerCubit.houseNumberFocusNode,
                      registerCubit.nextButtonFocusNode,
                      context);
                },
              ),
            ),
            SliverToBoxAdapter(
              child: 24.kh,
            ),
            SliverToBoxAdapter(
              child: NewAppButton(
                  focusNode: registerCubit.nextButtonFocusNode,
                  onPressed: () {
                    if (HelperFunctions.validateForm(
                        registerCubit.registerFormKey)) {
                      HelperFunctions.navigateToScreen(
                        context,
                        (context) => BlocProvider.value(
                          value: registerCubit,
                          child: SecondWorkerAndClientRegisterPageView(
                            isWorkerAuth: widget.isWorkerAuth,
                            isGoogleAuth: widget.isGoogleAuth,
                          ),
                        ),
                      );
                    }
                  },
                  title: S.of(context).Next_Step),
            ),
            SliverToBoxAdapter(
              child: 16.kh,
            ),
            const SliverToBoxAdapter(
              child: OrTextWidget(),
            ),
            SliverToBoxAdapter(
              child: 9.kh,
            ),
            SliverToBoxAdapter(
              child: BlocConsumer<GoogleAuthCubit, GoogleAuthState>(
                listener: (context, googleAuthState) {
                  if (googleAuthState is GoogleAuthTransactionSuccess) {
                    HelperFunctions.navigateToScreenAndRemove(
                      context,
                      (context) => WorkerAndClientRegisterPageView(
                        isWorkerAuth: widget.isWorkerAuth,
                        isGoogleAuth: true,
                      ),
                    );
                  }
                },
                builder: (context, googleAuthState) {
                  if (googleAuthState is GoogleAuthLoading) {
                    return const CustomLoading(
                      animationType: "staggeredDotsWave",
                      size: 30,
                    );
                  } else {
                    return GoogleAuthButtonWidget(
                      onPressed: () async {
                        await GoogleAuthCubit.get(context)
                            .authenticateWithGoogleAndSendToApi(
                                registerCubit.getRole(widget.isWorkerAuth));
                      },
                    );
                  }
                },
              ),
            ),
            SliverToBoxAdapter(
              child: 24.kh,
            ),
            SliverToBoxAdapter(
              child: HaveAnAccount(
                title: S.of(context).Have_Account,
                buttonTitle: S.of(context).Log_in,
                onPressed: () {
                  HelperFunctions.navigateToScreen(
                      context, (context) => const LoginPageView());
                },
              ),
            ),
            SliverToBoxAdapter(
              child: 31.kh,
            ),
          ],
        ),
      ),
    );
  }
}
