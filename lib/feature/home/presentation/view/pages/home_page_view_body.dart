import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:weisro/core/assets_path/icons_path.dart';

import 'package:weisro/core/utils/helper_functions.dart';
import 'package:weisro/core/utils/sized_box_extension.dart';
import 'package:weisro/core/widgets/custom_error_widget.dart';
import 'package:weisro/feature/home/presentation/managers/get_last_services_cubit/get_last_services_cubit.dart';
import 'package:weisro/feature/services/presentation/managers/add_service_to_favorite_cubit/add_service_to_favorite_cubit.dart';
import 'package:weisro/generated/l10n.dart';
import '../widgets/advertisement_widget.dart';
import '../widgets/category_list_view.dart';
import '../widgets/search_bar.dart' as search;
import '../widgets/services_grid_view_in_home_page.dart';
import '../widgets/shimmer_services_grid_view_in_home_page.dart';
import '../widgets/title_section_in_home_page.dart';

class HomePageViewBody extends StatelessWidget {
  const HomePageViewBody({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
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
                children: [
                  TitleSectionInHomePage(
                    title: S.of(context).Latest_rental_services,
                    iconPath: IconsPath.iconsNew,
                  ),
                  // LocationFlitterDropDown(
                  //     height: 30,
                  //     width: 120,
                  //     selectedLocation: selectedLocation,
                  //     locations: locations)
                ],
              ),
            ),
          ),
          SliverToBoxAdapter(
            child: 10.kh,
          ),
          SliverPadding(
            padding: HelperFunctions.symmetricHorizontalPadding24,
            sliver: BlocListener<AddServiceToFavoriteCubit,
                AddServiceToFavoriteState>(
              listener: (context, state) {},
              child: BlocBuilder<GetLastServicesCubit, GetLastServicesState>(
                builder: (context, getLastService) {
                  if (getLastService is GetLastServicesLoading) {
                    return const ShimmerServicesGridViewInHomePage();
                  } else if (getLastService is GetLastServicesSuccess) {
                    return ServicesGridViewInHomePage(
                      lastServices: getLastService.lastServices.docs ?? [],
                    );
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
    );
  }
}
