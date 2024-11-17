import 'package:flutter/material.dart';
import 'package:weisro/core/styles/app_color.dart';
import 'package:weisro/core/styles/app_style.dart';
import 'package:weisro/feature/home/data/models/category_model.dart';

class CategoryItem extends StatelessWidget {
  const CategoryItem({super.key, required this.width, required this.category});
  final double width;
  final CategoryModel category;
  @override
  Widget build(BuildContext context) {
    return Container(
      width: width,
      decoration: BoxDecoration(
          borderRadius: const BorderRadius.all(Radius.circular(4)),
          image: DecorationImage(
              fit: BoxFit.cover, image: AssetImage(category.icon))),
      child: Padding(
        padding: const EdgeInsetsDirectional.only(bottom: 10),
        child: Align(
          alignment: Alignment.bottomCenter,
          child: Container(
            width: 80,
            height: 17,
            decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(4),
                color: AppColors.whiteColor),
            child: Center(
              child: Text(
                category.title,
                style: AppStyles.style8w600Orange(context),
              ),
            ),
          ),
        ),
      ),
    );
  }
}
