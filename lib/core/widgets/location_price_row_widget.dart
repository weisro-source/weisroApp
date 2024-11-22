import 'package:flutter/material.dart';
import 'package:weisro/core/styles/app_color.dart';
import 'package:weisro/core/styles/app_style.dart';
import 'package:weisro/core/utils/sized_box_extension.dart';
import '../../../../../core/widgets/location_widget.dart';

class LocationPriceRowWidget extends StatelessWidget {
  final String price;

  const LocationPriceRowWidget({
    Key? key,
    required this.price,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        24.kw,
        const LocationWidget(),
        const Spacer(),
        Text(
          price,
          textAlign: TextAlign.center,
          style: AppStyles.style16w500Black(context)
              .copyWith(color: AppColors.orangeColor),
        ),
        24.kw,
      ],
    );
  }
}
