import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:weisro/core/utils/helper_functions.dart';
import 'package:weisro/feature/ads/presentation/managers/add_ads_cubit/add_ads_cubit.dart';
import 'package:weisro/feature/home/presentation/view/pages/home_page_view.dart';
import 'package:weisro/feature/services/presentation/view/pages/add_loading_page_view.dart';
import 'create_ads_page_view_body.dart';

class CreateAdsPageView extends StatelessWidget {
  const CreateAdsPageView({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => AddAdsCubit(),
      child: Scaffold(
          body: BlocConsumer<AddAdsCubit, AddAdsState>(
        listener: (context, addAdsState) {
          if (addAdsState is AddAdsSuccess) {
            HelperFunctions.navigateToScreenAndRemove(
              context,
              (context) => const HomePageView(),
            );
          }
        },
        builder: (context, addAdsState) {
          if (addAdsState is AddAdsLoading) {
            return const AddLoadingPage();
          } else {
            return const CreateAdsPageViewBody();
          }
        },
      )),
    );
  }
}
