import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:weisro/core/styles/app_color.dart';
import 'package:weisro/core/utils/helper_functions.dart';
import 'package:weisro/feature/home/presentation/managers/bottom_nav_bar_cubit.dart';
import '../../../../../core/widgets/custom_bottom_navigation_bar.dart';
import '../widgets/add_services_and_ad.dart';

class HomePageView extends StatelessWidget {
  const HomePageView({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return BlocBuilder<BottomNavCubit, int>(
      builder: (context, currentIndex) {
        return Scaffold(
            floatingActionButton: FloatingActionButton(
              onPressed: () {
                HelperFunctions.showCustomDialog(
                    context, const AddServicesAndAd());
              },
              shape: const CircleBorder(),
              backgroundColor: AppColors.orangeColor,
              child: const Icon(
                Icons.add,
                size: 32,
                color: AppColors.whiteColor,
              ),
            ),
            bottomNavigationBar: const CustomBottomNavigationBar(),
            body: context
                .read<BottomNavCubit>()
                .appScreens[context.read<BottomNavCubit>().state]);
      },
    );
  }
}
