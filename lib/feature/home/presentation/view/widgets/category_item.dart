import 'package:flutter/material.dart';

import 'package:weisro/feature/home/data/models/home_option_model.dart';

import '../../../../../core/widgets/white_back_ground_for_text.dart';

class CategoryItem extends StatelessWidget {
  const CategoryItem(
      {super.key, required this.width, required this.homeOptionModel});
  final double width;
  final HomeOptionModel homeOptionModel;
  @override
  Widget build(BuildContext context) {
    return Container(
      width: width,
      decoration: BoxDecoration(
          borderRadius: const BorderRadius.all(Radius.circular(16)),
          image: DecorationImage(
              fit: BoxFit.cover, image: AssetImage(homeOptionModel.icon))),
      child: Padding(
        padding: const EdgeInsetsDirectional.only(bottom: 0),
        child: Align(
          alignment: Alignment.bottomCenter,
          child: WhiteBackGroundForText(text: homeOptionModel.title),
        ),
      ),
    );
  }
}
