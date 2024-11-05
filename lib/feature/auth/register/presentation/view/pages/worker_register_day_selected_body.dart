import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:weisro/core/assets_path/icons_path.dart';
import 'package:weisro/core/styles/app_color.dart';
import 'package:weisro/core/styles/app_style.dart';
import 'package:weisro/core/utils/helper_functions.dart';
import 'package:weisro/core/utils/sized_box_extension.dart';
import 'package:weisro/core/widgets/app_button.dart';
import 'package:weisro/core/widgets/logo_image_widget.dart';
import 'package:weisro/feature/auth/register/data/worker_time.dart';
import 'package:weisro/feature/auth/register/presentation/view/pages/worker_register_upload_image_page_view.dart';
import 'package:weisro/feature/auth/register/presentation/view/widgets/labeled_border_box.dart';
import 'package:weisro/generated/l10n.dart';

import '../widgets/favorite_time_grid_view_widget.dart';
import '../widgets/favorite_time_question_widget.dart';
import '../widgets/question_widget.dart';

class WorkerRegisterDaySelectedBody extends StatelessWidget {
  const WorkerRegisterDaySelectedBody({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsetsDirectional.symmetric(horizontal: 24),
      child: CustomScrollView(
        slivers: [
          SliverToBoxAdapter(
            child: 35.kh,
          ),
          const SliverToBoxAdapter(
            child: Align(
              alignment: AlignmentDirectional.topStart,
              child: LogoImageWidget(),
            ),
          ),
          SliverToBoxAdapter(
            child: 23.kh,
          ),
          LabeledBorderBox(label: S.of(context).Create_Worker_Account),
          SliverToBoxAdapter(
            child: 37.kh,
          ),
          SliverToBoxAdapter(
              child: SvgPicture.asset(IconsPath.iconsTimeSelected)),
          SliverToBoxAdapter(
            child: QuestionWidget(
                icon: IconsPath.iconsCalender,
                questionText: S.of(context).How_Many_Days),
          ),
          SliverToBoxAdapter(
            child: 10.kh,
          ),
          SliverPadding(
            padding: const EdgeInsetsDirectional.only(start: 24),
            sliver: SliverToBoxAdapter(
              child: SizedBox(
                height: 40,
                child: ListView.separated(
                    scrollDirection: Axis.horizontal,
                    clipBehavior: Clip.none,
                    itemBuilder: (context, index) {
                      return AspectRatio(
                        aspectRatio: 1,
                        child: Container(
                          decoration: ShapeDecoration(
                            color: Colors.white,
                            shape: RoundedRectangleBorder(
                              side: const BorderSide(
                                  width: 1, color: AppColors.orangeColor),
                              borderRadius: BorderRadius.circular(4),
                            ),
                            shadows: const [
                              BoxShadow(
                                color: AppColors.shadow2Color,
                                blurRadius: 4,
                                offset: Offset(0, 2),
                                spreadRadius: 0,
                              )
                            ],
                          ),
                          child: Center(
                            child: Text(
                              WorkerTime.daysSelected(context)
                                  .values
                                  .toList()[index],
                              style: AppStyles.style14w400Grey(context),
                            ),
                          ),
                        ),
                      );
                    },
                    separatorBuilder: (context, index) {
                      return 10.kw;
                    },
                    itemCount: WorkerTime.daysSelected(context).length),
              ),
            ),
          ),
          SliverToBoxAdapter(
            child: 40.kh,
          ),
          const SliverToBoxAdapter(
            child: FavoriteTimeQuestionWidget(
              icon: IconsPath.iconsWatch,
            ),
          ),
          SliverToBoxAdapter(
            child: 12.kh,
          ),
          FavoriteTimeGridViewWidget(
              favoritesTime: WorkerTime.favoriteTimesList(context)),
          SliverToBoxAdapter(
            child: 40.kh,
          ),
          const SliverToBoxAdapter(
            child: FavoriteTimeQuestionWidget(icon: IconsPath.iconsFavTime),
          ),
          SliverToBoxAdapter(
            child: 12.kh,
          ),
          SliverPadding(
            padding: const EdgeInsetsDirectional.only(start: 20, end: 6),
            sliver: FavoriteTimeGridViewWidget(
                favoritesTime: WorkerTime.favoriteTimesList2(context)),
          ),
          SliverToBoxAdapter(
            child: 40.kh,
          ),
          SliverToBoxAdapter(
            child: AppButton(
              onPressed: () {
                HelperFunctions.navigateToScreen(context,
                    (context) => const WorkerRegisterUploadImagePageView());
              },
            ),
          )
        ],
      ),
    );
  }
}
