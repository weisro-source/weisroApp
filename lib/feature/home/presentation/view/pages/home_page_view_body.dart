import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:weisro/core/assets_path/icons_path.dart';
import 'package:weisro/core/cache/cache_helper.dart';
import 'package:weisro/core/cache/cache_keys.dart';
import 'package:weisro/core/styles/app_color.dart';
import 'package:weisro/core/utils/constant.dart';

import 'package:weisro/core/utils/helper_functions.dart';
import 'package:weisro/core/utils/sized_box_extension.dart';
import 'package:weisro/core/widgets/custom_error_widget.dart';
import 'package:weisro/feature/auth/register/presentation/manager/get_cities_of_a_specified_country_cubit/get_cities_of_a_specified_country_cubit.dart';
import 'package:weisro/feature/home/presentation/managers/categories_cubit/categories_cubit.dart';
import 'package:weisro/feature/home/presentation/managers/get_last_services_cubit/get_last_services_cubit.dart';
import 'package:weisro/feature/home/presentation/managers/view_type_in_home_page_cubit/view_type_in_home_page_cubit.dart';
import 'package:weisro/feature/home/presentation/view/widgets/location_flitter_drop_down.dart';
import 'package:weisro/feature/services/presentation/managers/add_service_to_favorite_cubit/add_service_to_favorite_cubit.dart';
import 'package:weisro/generated/l10n.dart';
import '../widgets/advertisement_widget.dart';
import '../widgets/category_list_view.dart';
import '../widgets/not_found_widget.dart';
import '../widgets/search_bar.dart' as search;
import '../widgets/services_grid_view_in_home_page.dart';
import '../widgets/shimmer_services_grid_view_in_home_page.dart';
import '../widgets/title_section_in_home_page.dart';

class HomePageViewBody extends StatefulWidget {
  const HomePageViewBody({super.key});

  @override
  State<HomePageViewBody> createState() => _HomePageViewBodyState();
}

class _HomePageViewBodyState extends State<HomePageViewBody> {
  @override
  void initState() {
    // BlocProvider.of<GetLastServicesCubit>(context)
    //     .getLastService(context, CacheHelper.getData(key: CacheKeys.kCityName));
    BlocProvider.of<CategoriesCubit>(context)
        .fetchCategories(Constants.categoryTypeServices, context);
    BlocProvider.of<GetCitiesOfASpecifiedCountryCubit>(context)
        .checkIfCountrySelected();
    super.initState();
  }

  String? categoryId = "";
  String? cityName = CacheHelper.getData(key: CacheKeys.kCityName);
  @override
  Widget build(BuildContext context) {
   
    return SafeArea(
      child: BlocProvider(
        create: (context) => AddServiceToFavoriteCubit(),
        child: CustomScrollView(
          slivers: [
            const SliverToBoxAdapter(
              child: AdvertisementWidget(),
            ),
            SliverToBoxAdapter(
              child: 28.kh,
            ),
            const SliverToBoxAdapter(
              child: search.SearchBar(
                isNotificationShow: true,
              ),
            ),
            SliverToBoxAdapter(
              child: 23.kh,
            ),
            SliverPadding(
              padding: HelperFunctions.symmetricHorizontalPadding24,
              sliver: SliverToBoxAdapter(
                child: TitleSectionInHomePage(
                  title: S.of(context).Our_Categories,
                  iconPath: IconsPath.iconsCategory,
                ),
              ),
            ),
            SliverToBoxAdapter(
              child: 13.kh,
            ),
            const SliverToBoxAdapter(
              child: CategoryListView(),
            ),
            SliverToBoxAdapter(
              child: 35.kh,
            ),
            SliverPadding(
              padding: HelperFunctions.symmetricHorizontalPadding24,
              sliver: SliverToBoxAdapter(
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    Expanded(
                      flex: 1,
                      child: TitleSectionInHomePage(
                        title: S.of(context).Latest_rental_services,
                        iconPath: IconsPath.iconsNew,
                      ),
                    ),
                  ],
                ),
              ),
            ),
            SliverToBoxAdapter(
              child: 20.kh,
            ),
            SliverToBoxAdapter(
              child: BlocBuilder<GetCitiesOfASpecifiedCountryCubit,
                  GetCitiesOfASpecifiedCountryState>(
                builder: (context, state) {
                  if (state is GetCitiesOfASpecifiedCountrySuccess) {
                    // Extract the list of city names
                    List<String> cityNameList = state.cities.states
                        .expand((cityState) =>
                            cityState.cities.map((city) => city.name))
                        .toList();

                    String firstCity = cityNameList.first;
                    return Row(
                      children: [
                        24.kw,
                        Expanded(
                          flex: 1,
                          child: LocationFlitterDropDown(
                            fillColor: AppColors.whiteColor,
                            borderColor: AppColors.orangeColor,
                            iconColor: AppColors.greyColor,
                            height: 50,
                            iconHeight: 24,
                            iconWidth: 10,
                            borderWidth: 1,
                            borderRadius: 8,
                            selectedLocation: firstCity,
                            locations: cityNameList,
                            prefixIcon: IconsPath.iconsLocation,
                            onChanged: (selectedCity) async {
                              cityName = selectedCity;
                              await context
                                  .read<GetLastServicesCubit>()
                                  .getLastService(context, selectedCity ?? "",
                                      categoryId ?? "");
                            },
                          ),
                        ),
                        24.kw
                      ],
                    );
                  } else {
                    return const SizedBox();
                  }
                },
              ),
            ),
            SliverToBoxAdapter(
              child: 10.kh,
            ),
            BlocConsumer<CategoriesCubit, CategoriesState>(
              listener: (context, getServiceCategoriesState) async {
                if (getServiceCategoriesState is CategoriesSuccess) {
                  final categoryIds = getServiceCategoriesState
                          .categoryModel.docs
                          ?.map((doc) => doc.id ?? '')
                          .toList() ??
                      [];
                  categoryId =
                      categoryIds.isNotEmpty ? categoryIds.first : null;
                  await BlocProvider.of<GetLastServicesCubit>(context)
                      .getLastService(
                          context,
                          CacheHelper.getData(key: CacheKeys.kState),
                          categoryId ?? "");
                }
              },
              builder: (context, getServiceCategoriesState) {
                if (getServiceCategoriesState is CategoriesSuccess) {
                  final categories = getServiceCategoriesState
                          .categoryModel.docs
                          ?.map((doc) => doc.name ?? '')
                          .toList() ??
                      [];
                  final categoryIds = getServiceCategoriesState
                          .categoryModel.docs
                          ?.map((doc) => doc.id ?? '')
                          .toList() ??
                      [];
                  categoryId =
                      categoryIds.isNotEmpty ? categoryIds.first : null;
                  return SliverPadding(
                    padding: HelperFunctions.symmetricHorizontalPadding24,
                    sliver: SliverToBoxAdapter(
                      child: LocationFlitterDropDown(
                        fillColor: AppColors.whiteColor,
                        borderColor: AppColors.orangeColor,
                        iconColor: AppColors.greyColor,
                        height: 38,
                        iconHeight: 24,
                        iconWidth: 24,
                        borderWidth: 1,
                        borderRadius: 8,
                        selectedLocation: categories.first,
                        locations: categories,
                        prefixIcon: IconsPath.iconsCategory,
                        onChanged: (selectedCategory) async {
                          final index =
                              categories.indexOf(selectedCategory ?? "");
                          if (index != -1) {
                            await context
                                .read<GetLastServicesCubit>()
                                .getLastService(
                                    context, cityName ?? "", categoryId ?? "");
                            // addServiceCubit.categoryId = categoryIds[index];
                          }
                        },
                      ),
                    ),
                  );
                } else {
                  return const SliverToBoxAdapter(
                    child: SizedBox.shrink(),
                  );
                }
              },
            ),
            SliverToBoxAdapter(
              child: 20.kh,
            ),
            SliverPadding(
              padding: HelperFunctions.symmetricHorizontalPadding24,
              sliver: BlocListener<AddServiceToFavoriteCubit,
                  AddServiceToFavoriteState>(
                listener: (context, addServiceToFavoriteState) {
                  // if (addServiceToFavoriteState is AddServiceToFavoriteSuccess) {
                  // GetLastServicesCubit.get(context).changeFavorite(serviceId)

                  // }
                },
                child: BlocBuilder<GetLastServicesCubit, GetLastServicesState>(
                  builder: (context, getLastService) {
                    if (getLastService is GetLastServicesLoading) {
                      return const ShimmerServicesGridViewInHomePage();
                    } else if (getLastService is GetLastServicesSuccess) {
                      if (getLastService.lastServices.docs?.isEmpty ?? false) {
                        return const SliverToBoxAdapter(
                          child: NotFoundWidget(),
                        );
                      } else {
                        return ServicesGridViewInHomePage(
                          lastServices: getLastService.lastServices.docs ?? [],
                        );
                      }
                    } else {
                      return const SliverToBoxAdapter(
                        child: CustomErrorWidgets(),
                      );
                    }
                  },
                ),
              ),
            ),
            SliverToBoxAdapter(
              child: 114.kh,
            ),
          ],
        ),
      ),
    );
  }
}
    // BlocBuilder<GetCitiesOfASpecifiedCountryCubit,
                    //     GetCitiesOfASpecifiedCountryState>(
                    //   builder: (context, state) {
                    //     if (state is GetCitiesOfASpecifiedCountrySuccess) {
                    //       List<String> cityNameList =
                    //           state.cities.cities.map((e) => e.name).toList();
                    //       String firstCity = cityNameList.firstWhere(
                    //           (cityName) =>
                    //               cityName ==
                    //               CacheHelper.getData(
                    //                   key: CacheKeys.kCityName));
                    //       return Expanded(
                    //         flex:1,
                    //         child: LocationFlitterDropDown(
                    //           fillColor: AppColors.whiteColor,
                    //           borderColor: AppColors.orangeColor,
                    //           iconColor: AppColors.greyColor,
                    //           height: 50,
                    //           iconHeight: 24,
                    //           iconWidth: 10,
                    //           borderWidth: 1,
                    //           borderRadius: 8,
                    //           selectedLocation: firstCity,
                    //           locations: cityNameList,
                    //           prefixIcon: IconsPath.iconsLocation,
                    //           onChanged: (selectedCategory) async {
                    //             await context
                    //                 .read<GetLastServicesCubit>()
                    //                 .getLastService(
                    //                     context, selectedCategory ?? "");
                    //           },
                    //         ),
                    //       );
                    //     } else {
                    //       return const SizedBox();
                    //     }
                    //   },
                    // ),