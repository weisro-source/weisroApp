import 'package:flutter/material.dart';
import 'package:weisro/core/styles/app_style.dart';
import 'package:weisro/core/styles/style_functions.dart';
import 'package:weisro/core/utils/helper_functions.dart';

class SelectedTimeWidget extends StatelessWidget {
  const SelectedTimeWidget({
    super.key,
    required this.time,
    this.onChangeDateTime,
  });

  final String time;
  final void Function(DateTime)? onChangeDateTime;
  @override
  Widget build(BuildContext context) {
    // AddServiceCubit addServiceCubit = AddServiceCubit.get(context);
  
    return Expanded(
        child: GestureDetector(
      onTap: () {
        HelperFunctions.showCustomTimePicker(context, onChangeDateTime);
      },
      child: AnimatedContainer(
        height: 32,
        width: 110,
        duration: const Duration(milliseconds: 500),
        decoration: StyleFunctions.decorationRadius8Orange(),
        child: Center(
          child: Text(
            time,
            style: AppStyles.style14w400Grey(context),
          ),
        ),
      ),
    ));
  }
}
