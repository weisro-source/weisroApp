import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:quick_actions/quick_actions.dart';
import 'package:weisro/core/styles/app_color.dart';
import 'package:weisro/core/utils/helper_functions.dart';
import 'package:weisro/feature/home/presentation/managers/bottom_nav_bar_cubit.dart';
import 'package:weisro/feature/profile/presentation/manager/get_user_info_cubit/get_user_info_cubit.dart';
import 'package:weisro/feature/services/presentation/view/pages/add_service_page_view.dart';
import '../../../../../core/widgets/custom_bottom_navigation_bar.dart';
import '../widgets/add_services_and_ad.dart';

class HomePageView extends StatefulWidget {
  const HomePageView({Key? key}) : super(key: key);

  @override
  State<HomePageView> createState() => _HomePageViewState();
}

class _HomePageViewState extends State<HomePageView> {
  final QuickActions quickActions = const QuickActions();
  @override
  void initState() {
    super.initState();
    BlocProvider.of<GetUserInfoCubit>(context).saveUserInfo();

    // Initialize Quick Actions
    quickActions.initialize((String shortcutType) {
      // Ensure navigation happens after the widget tree is built
      WidgetsBinding.instance.addPostFrameCallback((_) {
        if (shortcutType == 'action_search') {
          context.read<BottomNavCubit>().changeIndex(3);
        } else if (shortcutType == 'action_add_service') {
          HelperFunctions.navigateToScreen(
            context,
            (context) => const CreateServicePageView(),
          );
        } else if (shortcutType == 'action_orders') {
          context.read<BottomNavCubit>().changeIndex(1);
        }
      });
    });

    // Set Quick Actions
    quickActions.setShortcutItems(<ShortcutItem>[
      const ShortcutItem(
        type: 'action_search',
        localizedTitle: 'Search',
        icon: 'search',
      ),
      const ShortcutItem(
        type: 'action_add_service',
        localizedTitle: 'Add Service',
        icon: 'add',
      ),
      const ShortcutItem(
        type: 'action_orders',
        localizedTitle: 'Orders',
        icon: 'order',
      ),
    ]);
  }

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
