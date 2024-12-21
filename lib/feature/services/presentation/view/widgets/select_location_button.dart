import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:weisro/core/assets_path/icons_path.dart';
import 'package:weisro/core/styles/app_color.dart';
import 'package:weisro/core/styles/app_style.dart';
import 'package:weisro/core/utils/helper_functions.dart';
import 'package:weisro/core/utils/map_view.dart';
import 'package:weisro/core/utils/sized_box_extension.dart';
import 'package:weisro/core/widgets/app_button.dart';
import 'package:weisro/feature/services/presentation/managers/add_service_cubit/add_service_cubit.dart';
import 'package:weisro/generated/l10n.dart';

class SelectLocationButton extends StatelessWidget {
  const SelectLocationButton({
    super.key,
    required this.addServiceCubit,
  });

  final AddServiceCubit addServiceCubit;

  @override
  Widget build(BuildContext context) {
    return AppButton(
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Padding(
              padding: const EdgeInsets.symmetric(vertical: 2),
              child: Image.asset(IconsPath.iconsGoogleMaps),
            ),
            10.kw,
            Text(
              S.of(context).selected_location,
              style: AppStyles.style14w500Grey(context)
                  .copyWith(color: AppColors.blackColor),
            )
          ],
        ),
        onPressed: () {
          HelperFunctions.navigateToScreen(
            context,
            (context) => BlocProvider.value(
              value: addServiceCubit,
              child: const MapView(),
            ),
          );
        });
  }
}
