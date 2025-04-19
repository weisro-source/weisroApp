import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_svg/svg.dart';
import 'package:weisro/core/assets_path/icons_path.dart';
import 'package:weisro/core/cache/cache_helper.dart';
import 'package:weisro/core/cache/cache_keys.dart';
import 'package:weisro/core/styles/app_color.dart';
import 'package:weisro/core/styles/app_style.dart';
import 'package:weisro/core/styles/style_functions.dart';
import 'package:weisro/core/utils/helper_functions.dart';
import 'package:weisro/core/utils/sized_box_extension.dart';
import 'package:weisro/core/widgets/custom_app_bar.dart';
import 'package:weisro/core/widgets/custom_text_form_filed.dart';
import 'package:weisro/feature/home/presentation/managers/get_last_services_cubit/get_last_services_cubit.dart';
import 'package:weisro/feature/search/presentation/managers/search_cubit/search_cubit.dart';
import 'package:weisro/feature/search/presentation/managers/search_history_cubit/search_history_cubit.dart';
import 'package:weisro/feature/search/presentation/view/pages/search_result_page_view.dart';

import 'package:weisro/generated/l10n.dart';

import '../../../../../core/widgets/search_icon.dart';
import '../widgets/recommended_services_list.dart';
import '../widgets/search_result_item.dart';

class SearchPageBody extends StatefulWidget {
  const SearchPageBody({super.key});

  @override
  State<SearchPageBody> createState() => _SearchPageBodyState();
}

class _SearchPageBodyState extends State<SearchPageBody> {
  @override
  void initState() {
    super.initState();
    BlocProvider.of<GetLastServicesCubit>(context).getLastService(
        context, CacheHelper.getData(key: CacheKeys.kCityName), null);
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: CustomScrollView(
        slivers: [
          CustomAppBar(title: S.of(context).Search_Page),
          SliverToBoxAdapter(
            child: 28.kh,
          ),
          SliverToBoxAdapter(
            child: Container(
                width: HelperFunctions.getScreenWidth(context),
                height: 36,
                decoration: StyleFunctions.searchContainerDecoration(),
                margin: const EdgeInsetsDirectional.symmetric(horizontal: 24),
                child: CustomTextFormFiled(
                  hintText: S.of(context).Search,
                  borderColor: AppColors.orangeColor,
                  controller: context.read<SearchCubit>().searchController,
                  onFieldSubmitted: (query) {
                    if (query.isNotEmpty) {
                      context.read<SearchHistoryCubit>().addSearchQuery(query);
                      HelperFunctions.navigateToScreen(
                          context,
                          (context) => SearchResultPageView(
                                cityName: context
                                    .read<SearchCubit>()
                                    .searchController
                                    .text,
                              ));
                    }
                  },
                  prefixIcon: const SearchIcon(),
                )),
          ),
          SliverToBoxAdapter(
            child: 32.kh,
          ),
          SliverPadding(
            padding: HelperFunctions.symmetricHorizontalPadding24,
            sliver: SliverToBoxAdapter(
              child: Text(S.of(context).Recent_search,
                  style: AppStyles.style14w400Orange(context)),
            ),
          ),
          SliverToBoxAdapter(
            child: 13.kh,
          ),
          BlocBuilder<SearchHistoryCubit, List<String>>(
            builder: (context, searchHistory) {
              return SliverList.separated(
                itemCount: searchHistory.length,
                itemBuilder: (context, index) {
                  return SearchResultItem(query: searchHistory[index]);
                },
                separatorBuilder: (context, index) {
                  return 11.kh;
                },
              );
            },
          ),
          SliverToBoxAdapter(
            child: 50.kh,
          ),
          SliverToBoxAdapter(
            child: Row(
              children: [
                24.kw,
                SvgPicture.asset(IconsPath.iconsRecommended),
                8.kw,
                Text(
                  S.of(context).Recommended_Near_You,
                  style: AppStyles.style14w400Orange(context),
                )
              ],
            ),
          ),
          SliverToBoxAdapter(
            child: 10.kh,
          ),
          BlocBuilder<GetLastServicesCubit, GetLastServicesState>(
            builder: (context, state) {
              if (state is GetLastServicesSuccess) {
                return SliverToBoxAdapter(
                  child: Padding(
                    padding:
                        const EdgeInsetsDirectional.symmetric(horizontal: 28),
                    child: SizedBox(
                      height: 130,
                      child: RecommendedServicesList(
                        lastServices: state.lastServices.docs ?? [],
                      ),
                    ),
                  ),
                );
              } else {
                return const SliverToBoxAdapter(
                  child: SizedBox.shrink(),
                );
              }
            },
          )
        ],
      ),
    );
  }
}
