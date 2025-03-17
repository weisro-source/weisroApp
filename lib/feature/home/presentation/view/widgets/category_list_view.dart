import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:weisro/core/utils/helper_functions.dart';
import 'package:weisro/core/utils/sized_box_extension.dart';
import 'package:weisro/feature/game/presentation/view/pages/main_page_game.dart';
import 'package:weisro/feature/home/data/models/home_option_model.dart';
import 'package:weisro/feature/home/presentation/managers/view_type_in_home_page_cubit/view_type_in_home_page_cubit.dart';
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
        double itemWidth = HelperFunctions.getScreenWidth(context) * 0.27;
        return BlocBuilder<ViewTypeInHomePageCubit, ViewTypeInHomePageState>(
          builder: (context, viewState) {
            return SizedBox(
              height: 106,
              child: ListView.separated(
                physics: const NeverScrollableScrollPhysics(),
                scrollDirection: Axis.horizontal,
                padding: const EdgeInsetsDirectional.symmetric(horizontal: 32),
                itemCount: HomeOptionModel.homeOptionList(context).length,
                itemBuilder: (context, index) {
                  HomeOptionModel homeOptionModel =
                      HomeOptionModel.homeOptionList(context)[index];
                  return GestureDetector(
                    onTap: () {
                      if (index == 2) {
                        HelperFunctions.navigateToScreen(
                          context,
                          (context) => const MainPageGame(),
                        );
                      } else {
                        final cubit = context.read<ViewTypeInHomePageCubit>();
                        final previousViewType = cubit.viewType;

                        cubit.changeViewType(homeOptionModel.viewType);
                        cubit.updateState();
                        if (previousViewType != cubit.viewType) {
                          homeOptionModel.onTap?.call();
                        }
                      }
                    },
                    child: CategoryItem(
                        width: itemWidth,
                        homeOptionModel: homeOptionModel,
                        isSelected:
                            context.read<ViewTypeInHomePageCubit>().viewType ==
                                homeOptionModel.viewType),
                  );
                },
                separatorBuilder: (context, index) {
                  return 8.kw;
                },
              ),
            );
          },
        );
      },
    );
  }
}
