import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:weisro/core/assets_path/icons_path.dart';
import 'package:weisro/core/styles/app_color.dart';
import 'package:weisro/core/utils/constant.dart';
import 'package:weisro/core/utils/sized_box_extension.dart';
import 'package:weisro/core/widgets/custom_text_form_filed.dart';
import 'package:weisro/feature/auth/register/presentation/view/widgets/question_widget.dart';
import 'package:weisro/feature/services/presentation/managers/add_service_cubit/add_service_cubit.dart';
import 'package:weisro/generated/l10n.dart';

class PriceForService extends StatelessWidget {
  const PriceForService({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<AddServiceCubit, AddServiceState>(
      builder: (context, state) {
        AddServiceCubit addServiceCubit = AddServiceCubit.get(context);

        return Row(
          children: [
            24.kw,
            if (addServiceCubit.selectedRentTime == Constants.dailyKey ||
                addServiceCubit.selectedRentTime == Constants.bothKey)
              Expanded(
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.start,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    QuestionWidget(
                      icon: IconsPath.iconsTime,
                      questionText: S.of(context).Rent_per_day,
                    ),
                    9.kh,
                    SizedBox(
                      width: 148,
                      height: 32,
                      child: CustomTextFormFiled(
                        controller: addServiceCubit.pricePerDayController,
                        borderColor: AppColors.orangeColor,
                        keyboardType: TextInputType.number,
                        borderRadius: 8,
                        bottomPadding: 0,
                        hintText: S.of(context).Rent_per_day,
                      ),
                    ),
                  ],
                ),
              ),
            if (addServiceCubit.selectedRentTime == Constants.hoursKey ||
                addServiceCubit.selectedRentTime == Constants.bothKey)
              Expanded(
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.start,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    QuestionWidget(
                      icon: IconsPath.iconsTime,
                      questionText: S.of(context).Rent_per_hour,
                    ),
                    9.kh,
                    SizedBox(
                      width: 148,
                      height: 32,
                      child: CustomTextFormFiled(
                        controller: addServiceCubit.pricePerHourController,
                        borderColor: AppColors.orangeColor,
                        keyboardType: TextInputType.number,
                        borderRadius: 8,
                        bottomPadding: 0,
                        hintText: S.of(context).Rent_per_hour,
                      ),
                    ),
                  ],
                ),
              ),
          ],
        );
      },
    );
  }
}
