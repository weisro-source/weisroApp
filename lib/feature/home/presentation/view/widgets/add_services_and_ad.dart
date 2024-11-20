import 'package:flutter/material.dart';
import 'package:weisro/core/utils/helper_functions.dart';
import 'package:weisro/core/utils/sized_box_extension.dart';
import 'package:weisro/core/widgets/app_button.dart';
import 'package:weisro/feature/home/presentation/view/widgets/create_button.dart';

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
            title: "Create an ad",
            onPressed: () {},
          ),
          33.kh,
          CreateBotton(
            title: "Create a product",
            onPressed: () {},
          ),
          30.kh,
          AppButton(
            text: "Ok",
            onPressed: () {
              HelperFunctions.navigateToBack(context);
            },
          )
        ],
      ),
    );
  }
}
