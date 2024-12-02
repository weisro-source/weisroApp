import 'package:flutter/material.dart';
import 'package:weisro/core/utils/helper_functions.dart';
import 'package:weisro/core/utils/sized_box_extension.dart';
import 'package:weisro/core/widgets/app_button.dart';
import 'package:weisro/feature/ads/presentation/view/pages/create_ad_page_view.dart';
import 'package:weisro/feature/home/presentation/view/widgets/create_button.dart';
import 'package:weisro/feature/services/presentation/view/pages/add_service_page_view.dart';
import 'package:weisro/generated/l10n.dart';

class AddServicesAndAd extends StatelessWidget {
  const AddServicesAndAd({super.key});

  @override
  Widget build(BuildContext context) {
    return AlertDialog(
      content: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          CreateBotton(
            title: S.of(context).Create_An_Ad,
            onPressed: () {
              HelperFunctions.navigateToScreen(
                context,
                (context) => const CreateAdsPageView(),
              );
            },
          ),
          33.kh,
          CreateBotton(
            title: S.of(context).Create_A_Product,
            onPressed: () {
              HelperFunctions.navigateToScreen(
                context,
                (context) => const CreateServicePageView(),
              );
            },
          ),
          30.kh,
          AppButton(
            text: S.of(context).Ok,
            onPressed: () {
              HelperFunctions.navigateToBack(context);
            },
          )
        ],
      ),
    );
  }
}
