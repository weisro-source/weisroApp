import 'package:flutter/material.dart';
import 'package:weisro/core/utils/sized_box_extension.dart';
import 'package:weisro/feature/home/data/models/category_model.dart';
import 'package:weisro/feature/home/presentation/view/widgets/category_item.dart';

class CategoryListView extends StatelessWidget {
  const CategoryListView({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return LayoutBuilder(
      builder: (context, constraints) {
        double width = constraints.maxWidth;
        double itemWidth = width * 0.5;
        return SizedBox(
          height: 131,
          child: ListView.separated(
            scrollDirection: Axis.horizontal,
            padding:
                const EdgeInsetsDirectional.symmetric(horizontal: 32),
            itemCount: CategoryModel.categoryList(context).length,
            itemBuilder: (context, index) {
              CategoryModel category =
                  CategoryModel.categoryList(context)[index];
              return CategoryItem(
                width: itemWidth,
                category: category,
              );
            },
            separatorBuilder: (context, index) {
              return 8.kw;
            },
          ),
        );
      },
    );
  }
}
