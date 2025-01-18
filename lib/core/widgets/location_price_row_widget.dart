import 'package:flutter/material.dart';
import 'package:weisro/core/styles/app_color.dart';
import 'package:weisro/core/styles/app_style.dart';
import 'package:weisro/core/utils/sized_box_extension.dart';

class LocationPriceRowWidget extends StatelessWidget {
  final String price;

  const LocationPriceRowWidget({
    Key? key,
    required this.price,
    required this.location,
  }) : super(key: key);

  final String location;
  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.start,
      children: [
        24.kw,
        Visibility(
          visible: price != "\$0.0 Per hour",
          child: Text(
            price,
            textAlign: TextAlign.center,
            style: AppStyles.style16w500Black(context)
                .copyWith(color: AppColors.orangeColor),
          ),
        ),
      ],
    );
  }
}
