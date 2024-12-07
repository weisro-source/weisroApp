import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:weisro/core/cache/cache_helper.dart';
import 'package:weisro/core/cache/cache_keys.dart';
import 'package:weisro/core/manager/language_cubit/language_cubit.dart';
import 'package:weisro/core/styles/app_color.dart';
import 'package:weisro/core/utils/helper_functions.dart';
import 'package:weisro/feature/auth/register/presentation/manager/get_all_countries_cubit/get_all_countries_cubit.dart';
import 'package:weisro/feature/auth/register/presentation/manager/get_cities_of_a_specified_country_cubit/get_cities_of_a_specified_country_cubit.dart';
import 'package:weisro/feature/favorite/presentation/managers/get_favorite_cubit/get_favorite_cubit.dart';
import 'package:weisro/feature/home/presentation/managers/bottom_nav_bar_cubit.dart';
import 'package:weisro/feature/home/presentation/managers/get_last_services_cubit/get_last_services_cubit.dart';
import 'package:weisro/feature/onboarding/presentation/view/pages/splash_view.dart';
import 'package:weisro/feature/profile/presentation/manager/edit_user_info_cubit/edit_user_info_cubit.dart';
import 'package:weisro/feature/profile/presentation/manager/get_user_info_cubit/get_user_info_cubit.dart';
import 'package:weisro/generated/l10n.dart';

class WeisroApp extends StatelessWidget {
  const WeisroApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider(
          create: (context) => BottomNavCubit(),
        ),
        BlocProvider(
          create: (context) => GetUserInfoCubit(),
        ),
        BlocProvider(
          create: (context) => EditUserInfoCubit(),
        ),
        BlocProvider(
          create: (context) => GetLastServicesCubit()
            ..getLastService(
                context, CacheHelper.getData(key: CacheKeys.kCityName)),
        ),
        BlocProvider(
          create: (context) => GetFavoriteCubit()..getAllFavorites(context),
        ),
        BlocProvider(
          create: (context) => LanguageCubit()..initLanguage(),
        ),
        BlocProvider(
          create: (context) =>
              GetCitiesOfASpecifiedCountryCubit()..checkIfCountrySelected(),
        ),
        BlocProvider(
          create: (context) => GetAllCountriesCubit()..getAllCountries(),
        ),
      ],
      child: BlocBuilder<LanguageCubit, LanguageState>(
        builder: (context, state) {
          return MaterialApp(
            localizationsDelegates: const [
              S.delegate,
              GlobalMaterialLocalizations.delegate,
              GlobalWidgetsLocalizations.delegate,
              GlobalCupertinoLocalizations.delegate,
            ],
            supportedLocales: S.delegate.supportedLocales,
            locale: Locale(
                BlocProvider.of<LanguageCubit>(context).localLang ?? 'en'),
            title: 'Wisro',
            debugShowCheckedModeBanner: HelperFunctions.isDebugMode(),
            theme: ThemeData(
              colorScheme: ColorScheme.fromSeed(
                seedColor: AppColors.whiteColor,
                surface: AppColors.whiteColor,
              ),
              useMaterial3: true,
            ),
            home: const SplashView(),
          );
        },
      ),
    );
  }
}
