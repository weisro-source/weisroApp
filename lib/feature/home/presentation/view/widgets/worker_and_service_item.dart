import 'package:flutter/material.dart';
import 'package:weisro/core/assets_path/image_path.dart';
import 'package:weisro/core/utils/helper_functions.dart';
import 'package:weisro/core/widgets/white_back_ground_for_text.dart';
import 'package:weisro/feature/home/presentation/view/pages/workers_for_one_service_page_view.dart';

class WorkerAndServiceItem extends StatelessWidget {
  const WorkerAndServiceItem({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        HelperFunctions.navigateToScreen(
            context, (context) => const WorkersForOneServicePageView());
      },
      child: Container(
        decoration: const BoxDecoration(
            image: DecorationImage(
                fit: BoxFit.cover,
                image: AssetImage(ImagePath.imagesService2))),
        child: const Padding(
          padding: EdgeInsetsDirectional.only(bottom: 10),
          child: Align(
            alignment: Alignment.bottomCenter,
            child: WhiteBackGroundForText(text: "title"),
          ),
        ),
      ),
    );
  }
}
