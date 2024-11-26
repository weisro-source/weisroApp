import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:weisro/core/utils/constant.dart';

import 'package:weisro/core/widgets/white_back_ground_for_text.dart';
import 'package:weisro/feature/home/data/models/category_model.dart';

class WorkerAndServiceItem extends StatelessWidget {
  const WorkerAndServiceItem({
    super.key,
    required this.categoryDoc,
  });
  final Docs categoryDoc;
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {},
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
