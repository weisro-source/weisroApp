import 'package:flutter/material.dart';
import 'package:weisro/core/assets_path/icons_path.dart';
import 'package:weisro/core/styles/app_style.dart';
import 'package:weisro/core/utils/helper_functions.dart';
import 'package:weisro/core/utils/sized_box_extension.dart';
import 'package:weisro/feature/auth/register/presentation/view/widgets/question_widget.dart';
import 'package:weisro/feature/services/presentation/managers/add_service_cubit/add_service_cubit.dart';
import 'package:weisro/feature/services/presentation/view/widgets/selected_time_widget.dart';
import 'package:weisro/generated/l10n.dart';

class SelectedTimeForCreateService extends StatefulWidget {
  const SelectedTimeForCreateService({
    super.key,
  });

  @override
  State<SelectedTimeForCreateService> createState() =>
      _SelectedTimeForCreateServiceState();
}

class _SelectedTimeForCreateServiceState
    extends State<SelectedTimeForCreateService> {
  @override
  Widget build(BuildContext context) {
    AddServiceCubit addServiceCubit = AddServiceCubit.get(context);

    return Column(
      children: [
        Padding(
          padding: HelperFunctions.symmetricHorizontalPadding24,
          child: QuestionWidget(
              icon: IconsPath.iconsTime,
              questionText: S.of(context).Available_Rental_Hours),
        ),
        10.kh,
        Row(
          children: [
            25.kw,
            SelectedTimeWidget(
            
              time: addServiceCubit.formattedStartTime,
              onChangeDateTime: (newTime) {
                setState(() {
                  addServiceCubit.startDateTime = newTime;
                });
              },
            ),
            15.kw,
            Text(
              S.of(context).To,
              style: AppStyles.style14w400Grey(context),
            ),
            15.kw,
            SelectedTimeWidget(
              time: addServiceCubit.formattedEndTime,
              onChangeDateTime: (newTime) {
                setState(() {
                  addServiceCubit.endDateTime = newTime;
                });
              },
            ),
            25.kw,
          ],
        ),
      ],
    );
  }
}
