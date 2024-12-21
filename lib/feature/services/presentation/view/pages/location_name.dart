import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_svg/svg.dart';
import 'package:weisro/core/assets_path/icons_path.dart';
import 'package:weisro/core/styles/style_functions.dart';
import 'package:weisro/core/utils/helper_functions.dart';
import 'package:weisro/core/utils/map_view.dart';
import 'package:weisro/core/utils/sized_box_extension.dart';
import 'package:weisro/feature/services/presentation/managers/add_service_cubit/add_service_cubit.dart';

class LocationName extends StatelessWidget {
  const LocationName({
    super.key,
    required this.addServiceCubit,
  });

  final AddServiceCubit addServiceCubit;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        HelperFunctions.navigateToScreen(
          context,
          (context) => BlocProvider.value(
            value: addServiceCubit,
            child: const MapView(),
          ),
        );
      },
      child: Container(
        height: 38,
        decoration: StyleFunctions.decorationRadius8Orange(),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            SvgPicture.asset(IconsPath.iconsLocation),
            10.kw,
            Text(
              addServiceCubit.selectedLocationName ?? "",
            ),
          ],
        ),
      ),
    );
  }
}
