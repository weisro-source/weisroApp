import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:weisro/feature/ads/presentation/managers/delete_ad_cubit/delete_ad_cubit.dart';
import 'package:weisro/feature/ads/presentation/managers/get_user_ads_cubit/get_user_ads_cubit.dart';
import 'package:weisro/feature/profile/presentation/view/pages/user_ads_page_view_body.dart';
import 'package:weisro/feature/profile/presentation/view/widgets/custom_app_bar_in_profile_view.dart';

class UserAdsPageView extends StatefulWidget {
  const UserAdsPageView({Key? key}) : super(key: key);

  @override
  State<UserAdsPageView> createState() => _UserAdsPageViewState();
}

class _UserAdsPageViewState extends State<UserAdsPageView> {
  CancelToken cancelToken = CancelToken();
  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider(
          create: (context) => GetUserAdsCubit()..getUserAds(),
        ),
        BlocProvider(
          create: (context) => DeleteAdCubit(),
        ),
      ],
      child: const Scaffold(
        appBar: CustomAppBarInProfileView(),
        body: UserAdsPageViewBody(),
      ),
    );
  }
}
