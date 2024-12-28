import 'package:flutter/material.dart';
import 'package:home_widget/home_widget.dart';
import 'package:weisro/core/assets_path/image_path.dart';
import 'package:weisro/core/cache/cache_helper.dart';
import 'package:weisro/core/cache/cache_keys.dart';
import 'package:weisro/core/utils/helper_functions.dart';
import 'package:weisro/feature/auth/login/presentation/view/pages/login_page_view.dart';
import 'package:weisro/feature/home/presentation/view/pages/home_page_view.dart';
import 'package:weisro/feature/onboarding/presentation/view/pages/onboarding_page_view.dart';
import 'package:weisro/feature/services/presentation/view/pages/add_service_page_view.dart';

class SplashView extends StatefulWidget {
  const SplashView({Key? key}) : super(key: key);

  @override
  State<SplashView> createState() => _SplashViewState();
}

class _SplashViewState extends State<SplashView>
    with SingleTickerProviderStateMixin {
  double _opacity = 0.0;

  @override
  void initState() {
    super.initState();
    String? token = CacheHelper.getData(key: CacheKeys.kToken);
    Future.delayed(const Duration(milliseconds: 100), () {
      setState(() {
        _opacity = 1.0;
      });
    });
    Future.delayed(const Duration(seconds: 2), () {
      Future.delayed(const Duration(seconds: 2), () {
        if (!mounted) {
          return;
        }
        HelperFunctions.navigateToScreen(
          context,
          (context) =>
              token != null ? const HomePageView() : const OnBoardingPageView(),
        );
        if (HelperFunctions.isAndroid()) {
          _setupWidgetListener();
        }
      });
    });
  }

  void _setupWidgetListener() {
    HomeWidget.setAppGroupId(
        'com.example.weisro'); // Replace with your app's ID
    HomeWidget.registerInteractivityCallback(_backgroundCallback);

    HomeWidget.getWidgetData<String>('widget_click', defaultValue: '')
        .then((value) {
      if (value == 'action_add_service') {
        _handleHomeWidgetTap();
      }
    });
  }

  static Future<void> _backgroundCallback(Uri? data) async {
    if (data != null && data.queryParameters['action'] == 'add_service') {
      HomeWidget.saveWidgetData<String>('widget_click', 'action_add_service');
    }
  }

  void _handleHomeWidgetTap() {
    String? token = CacheHelper.getData(key: CacheKeys.kToken);
    if (!mounted) return;

    if (token != null) {
      HelperFunctions.navigateToScreen(
        context,
        (context) => const CreateServicePageView(),
      );
    } else {
      Navigator.of(context).push(MaterialPageRoute(
        builder: (context) => const LoginPageView(),
      ));
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: AnimatedOpacity(
          duration: const Duration(milliseconds: 800),
          curve: Curves.easeIn,
          opacity: _opacity,
          child: Image.asset(ImagePath.imagesLogo),
        ),
      ),
    );
  }
}
