import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:weisro/core/utils/constant.dart';
import 'package:weisro/core/utils/helper_functions.dart';

import 'package:weisro/core/widgets/white_back_ground_for_text.dart';
import 'package:weisro/feature/home/data/models/category_model.dart';
import 'package:weisro/feature/home/presentation/view/pages/service_for_one_category_page_view.dart';
import 'package:weisro/feature/home/presentation/view/pages/workers_for_one_service_page_view.dart';

class WorkerAndServiceItem extends StatelessWidget {
  const WorkerAndServiceItem({
    super.key,
    required this.categoryDoc,
    required this.type,
  });
  final Docs categoryDoc;
  final String type;
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        HelperFunctions.navigateToScreen(
            context,
            (context) => type == Constants.categoryTypeWorker
                ? WorkersForOneServicePageView(
                    categoryId: categoryDoc.id.toString())
                : ServiceForOnCategoryPageView(
                    categoryId: categoryDoc.id.toString()));
      },
      child: Container(
        decoration: BoxDecoration(
            image: DecorationImage(
                fit: BoxFit.cover,
                image: CachedNetworkImageProvider(
                    "${Constants.imageUrl}${categoryDoc.image}"))),
        child: Padding(
          padding: const EdgeInsetsDirectional.only(bottom: 10),
          child: Align(
            alignment: Alignment.bottomCenter,
            child: WhiteBackGroundForText(text: categoryDoc.name ?? ""),
          ),
        ),
      ),
    );
  }
}
