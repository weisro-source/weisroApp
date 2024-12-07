import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';


import 'package:weisro/core/utils/helper_functions.dart';
import 'package:weisro/core/utils/sized_box_extension.dart';
import 'package:weisro/core/utils/validate.dart';
import 'package:weisro/core/widgets/logo_image_widget.dart';
import 'package:weisro/feature/auth/data/models/countries_model.dart';
import 'package:weisro/feature/auth/login/presentation/view/pages/login_page_view.dart';
import 'package:weisro/feature/auth/register/presentation/manager/get_all_countries_cubit/get_all_countries_cubit.dart';
import 'package:weisro/feature/auth/register/presentation/manager/get_cities_of_a_specified_country_cubit/get_cities_of_a_specified_country_cubit.dart';
import 'package:weisro/feature/auth/register/presentation/manager/register_cubit/register_cubit.dart';
import 'package:weisro/feature/auth/register/presentation/view/pages/second_worker_and_client_register_page_view.dart';
import 'package:weisro/feature/auth/register/presentation/view/widgets/city_drop_down.dart';
import 'package:weisro/feature/auth/register/presentation/view/widgets/custom_country_dropdown.dart';
import 'package:weisro/feature/auth/register/presentation/view/widgets/labeled_border_box.dart';
import 'package:weisro/generated/l10n.dart';

import '../../../../../../core/widgets/app_button.dart';
import '../../../../../../core/widgets/custom_text_form_filed.dart';
import '../../../../../../core/widgets/title_for_text_from_filed.dart';
import '../widgets/custom_steeper_widget.dart';
import '../widgets/google_auth_button_widget.dart';
import '../widgets/have_an_account.dart';
import '../widgets/loading_filed.dart';
import '../widgets/or_text_widget.dart';

class WorkerAndClientRegisterPageViewBody extends StatefulWidget {
  const WorkerAndClientRegisterPageViewBody(
      {super.key, required this.isWorkerAuth});
  final bool isWorkerAuth;

  @override
  State<WorkerAndClientRegisterPageViewBody> createState() =>
      _WorkerAndClientRegisterPageViewBodyState();
}

class _WorkerAndClientRegisterPageViewBodyState
    extends State<WorkerAndClientRegisterPageViewBody> {
  String selectedCountryCode = 'US';

  @override
  Widget build(BuildContext context) {
    RegisterCubit registerCubit = RegisterCubit.get(context);
    return Padding(
      padding: const EdgeInsetsDirectional.only(start: 32, end: 32),
      child: Form(
        key: registerCubit.registerFormKey,
        child: CustomScrollView(
          slivers: [
            SliverToBoxAdapter(
              child: 35.kh,
            ),
            const SliverToBoxAdapter(
              child: Align(
                alignment: AlignmentDirectional.topStart,
                child: LogoImageWidget(),
              ),
            ),
            SliverToBoxAdapter(
              child: 23.kh,
            ),
            LabeledBorderBox(
                label: widget.isWorkerAuth
                    ? S.of(context).Create_Worker_Account
                    : S.of(context).Create_Client_account),
            SliverToBoxAdapter(
              child: 44.kh,
            ),
            //* this a steeper widget
            const SliverToBoxAdapter(
                child: CustomSteeperWidget(
              isTowStepActive: false,
            )),
            SliverToBoxAdapter(
              child: 0.kh,
            ),
            SliverToBoxAdapter(
                child: TitleForTextFromFiled(
              title: S.of(context).First_Name,
            )),
            SliverToBoxAdapter(
              child: 5.kh,
            ),
            SliverToBoxAdapter(
              child: CustomTextFormFiled(
                hintText: S.of(context).First_Name,
                controller: registerCubit.firstNameController,
                focusNode: registerCubit.firstNameFocusNode,
                keyboardType: TextInputType.name,
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
            SliverToBoxAdapter(
              child: 20.kh,
            ),
            SliverToBoxAdapter(
                child: TitleForTextFromFiled(
              title: S.of(context).Last_Name,
            )),
            SliverToBoxAdapter(
              child: 5.kh,
            ),
            SliverToBoxAdapter(
              child: CustomTextFormFiled(
                hintText: S.of(context).Last_Name,
                controller: registerCubit.lastNameController,
                focusNode: registerCubit.lastNameFocusNode,
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
            SliverToBoxAdapter(
              child: 20.kh,
            ),
            SliverToBoxAdapter(
                child: TitleForTextFromFiled(
              title: S.of(context).Country,
            )),
            SliverToBoxAdapter(
              child: 5.kh,
            ),

            SliverToBoxAdapter(
              child: BlocBuilder<GetAllCountriesCubit, GetAllCountriesState>(
                builder: (context, getAllCountriesState) {
                  if (getAllCountriesState is GetAllCountriesSuccess) {
                    final countries = getAllCountriesState.countries;
                    return CountryDropdown(
                      countries: countries,
                      selectedCountry:
                          GetAllCountriesCubit.get(context).selectedCountry,
                      onChanged: (newCountry) async {
                        GetAllCountriesCubit.get(context).selectCountry(
                            newCountry ?? Country(id: "", flag: "", name: ""));
                        await GetCitiesOfASpecifiedCountryCubit.get(context)
                            .getAllCitiesOfASpecifiedCountry(
                                newCountry?.id ?? "");
                      },
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
            SliverToBoxAdapter(
                child: TitleForTextFromFiled(
              title: S.of(context).City,
            )),
            SliverToBoxAdapter(
              child: 5.kh,
            ),

            SliverToBoxAdapter(
              child: BlocBuilder<GetCitiesOfASpecifiedCountryCubit,
                  GetCitiesOfASpecifiedCountryState>(
                builder: (context, getAllCitiesState) {
                  if (getAllCitiesState
                      is GetCitiesOfASpecifiedCountrySuccess) {
                    return CityDropdown(
                      cityList: getAllCitiesState.cities,
                      onChanged: (value) {
                        GetCitiesOfASpecifiedCountryCubit.get(context)
                            .cityName = value?.name ?? "";
                      },
                      selectedCity: getAllCitiesState.cities.cities.first,
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
            SliverToBoxAdapter(
                child: TitleForTextFromFiled(
              title: S.of(context).Postal_Code,
            )),
            SliverToBoxAdapter(
              child: 5.kh,
            ),
            SliverToBoxAdapter(
              child: CustomTextFormFiled(
                controller: registerCubit.postalCodeController,
                focusNode: registerCubit.postalCodeFocusNode,
                keyboardType: TextInputType.number,
                hintText: registerCubit.hintTextX,
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
            SliverToBoxAdapter(
                child: TitleForTextFromFiled(
              title: S.of(context).Street,
            )),
            SliverToBoxAdapter(
              child: 5.kh,
            ),
            SliverToBoxAdapter(
              child: CustomTextFormFiled(
                hintText: "",
                controller: registerCubit.streetController,
                focusNode: registerCubit.streetFocusNode,
                keyboardType: TextInputType.streetAddress,
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
            SliverToBoxAdapter(
                child: TitleForTextFromFiled(
              title: S.of(context).House_Number,
            )),
            SliverToBoxAdapter(
              child: 5.kh,
            ),
            SliverToBoxAdapter(
              child: CustomTextFormFiled(
                hintText: registerCubit.hintTextX,
                controller: registerCubit.houseNumberController,
                focusNode: registerCubit.houseNumberFocusNode,
                keyboardType: TextInputType.number,
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
              child: AppButton(
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
                          ),
                        ),
                      );
                    }
                  },
                  text: S.of(context).Next_Step),
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
              child: GoogleAuthButtonWidget(
                onPressed: () {},
              ),
            ),
            SliverToBoxAdapter(
              child: 24.kh,
            ),
            SliverToBoxAdapter(
              child: HaveAnAccount(
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
