import 'package:flutter/material.dart';
import 'package:weisro/core/styles/app_color.dart';
import 'package:weisro/core/styles/app_style.dart';

class PrivacyPolicyPageView extends StatelessWidget {
  const PrivacyPolicyPageView(
      {Key? key, required this.appTitle, required this.body})
      : super(key: key);
  final String appTitle, body;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text(
            appTitle,
            style: AppStyles.style18w500Grey(context)
                .copyWith(color: AppColors.orangeColor),
          ),
          centerTitle: true,
        ),
        body: const SingleChildScrollView(
          child: Text(""),
        ));
  }
}
