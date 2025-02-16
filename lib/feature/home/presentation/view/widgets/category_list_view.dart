import 'package:flutter/material.dart';
import 'package:weisro/core/utils/sized_box_extension.dart';
import 'package:weisro/feature/home/data/models/home_option_model.dart';
import 'package:weisro/feature/home/presentation/view/widgets/category_item.dart';

class CategoryListView extends StatelessWidget {
  const CategoryListView({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return LayoutBuilder(
      builder: (context, constraints) {
        // double width = constraints.maxWidth;
        double itemWidth = 106;
        return SizedBox(
          height: 106,
          child: ListView.separated(
            scrollDirection: Axis.horizontal,
            padding: const EdgeInsetsDirectional.symmetric(horizontal: 32),
            itemCount: HomeOptionModel.homeOptionList(context).length,
            itemBuilder: (context, index) {
              HomeOptionModel homeOptionModel =
                  HomeOptionModel.homeOptionList(context)[index];
              return GestureDetector(
                onTap: homeOptionModel.onTap,
                child: CategoryItem(
                  width: itemWidth,
                  homeOptionModel: homeOptionModel,
                ),
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
