import 'package:flutter/material.dart';
import 'package:weisro/core/assets_path/icons_path.dart';
import 'package:weisro/core/styles/app_color.dart';
import 'package:weisro/core/styles/app_style.dart';
import 'package:weisro/core/utils/helper_functions.dart';
import 'package:weisro/core/utils/sized_box_extension.dart';
import 'package:weisro/core/widgets/app_button.dart';
import 'package:weisro/core/widgets/custom_app_bar.dart';
import 'package:weisro/core/widgets/custom_dash_line.dart';
import 'package:weisro/core/widgets/custom_text_form_filed.dart';
import 'package:weisro/feature/auth/data/worker_time.dart';
import 'package:weisro/feature/auth/register/presentation/view/widgets/favorite_time_grid_view_widget.dart';
import 'package:weisro/feature/auth/register/presentation/view/widgets/note_widget.dart';
import 'package:weisro/feature/auth/register/presentation/view/widgets/question_widget.dart';
import 'package:weisro/generated/l10n.dart';

import '../widget/choose_widget.dart';

class BookWorkerPageViewBody extends StatelessWidget {
  const BookWorkerPageViewBody({super.key});

  @override
  Widget build(BuildContext context) {
    return CustomScrollView(
      slivers: [
        CustomAppBar(title: S.of(context).Book_Worker),
        SliverPadding(
          padding: HelperFunctions.symmetricHorizontalPadding24,
          sliver: SliverToBoxAdapter(
            child: QuestionWidget(
                icon: IconsPath.iconsWorker18,
                questionText: S.of(context).Work_for_hours_or_days),
          ),
        ),
        SliverToBoxAdapter(
          child: 10.kh,
        ),
        SliverToBoxAdapter(
          child: Row(
            children: [
              40.kw,
              Expanded(
                  child: ChooseWidget(
                chooseTitle: S.of(context).Days,
                icon: IconsPath.iconsCalender,
                isSelected: false,
              )),
              10.kw,
              Expanded(
                  child: ChooseWidget(
                chooseTitle: S.of(context).Hours,
                icon: IconsPath.iconsTime,
                isSelected: false,
              )),
              24.kw,
            ],
          ),
        ),
        SliverToBoxAdapter(
          child: 20.kh,
        ),
        SliverPadding(
          padding: HelperFunctions.symmetricHorizontalPadding24,
          sliver: SliverToBoxAdapter(
            child: QuestionWidget(
                icon: IconsPath.iconsTime,
                questionText: S.of(context).Available_Rental_Hours),
          ),
        ),
        SliverToBoxAdapter(
          child: 10.kh,
        ),
        SliverPadding(
          padding: const EdgeInsetsDirectional.only(start: 20, end: 6),
          sliver: FavoriteTimeGridViewWidget(
              isTime: true,
              favoritesTime: WorkerTime.favoriteTimesList2(context)),
        ),
        SliverToBoxAdapter(
          child: 20.kh,
        ),
        SliverPadding(
          padding: HelperFunctions.symmetricHorizontalPadding24,
          sliver: SliverToBoxAdapter(
            child: QuestionWidget(
                icon: IconsPath.iconsBook,
                questionText: S.of(context).Service_Details_Request),
          ),
        ),
        SliverToBoxAdapter(
          child: 10.kh,
        ),
        SliverPadding(
          padding: HelperFunctions.symmetricHorizontalPadding24,
          sliver: const SliverToBoxAdapter(
            child: CustomTextFormFiled(
              hintText: "",
              fillColor: AppColors.second1Color,
              borderColor: AppColors.orangeColor,
              filled: true,
              maxLines: 6,
              minLines: 6,
            ),
          ),
        ),
        SliverToBoxAdapter(
          child: 10.kh,
        ),
        SliverPadding(
          padding: HelperFunctions.symmetricHorizontalPadding24,
          sliver: NoteWidget(note: S.of(context).Forbidden_Write_Addresses),
        ),
        SliverToBoxAdapter(
          child: 32.kh,
        ),
        SliverPadding(
          padding: HelperFunctions.symmetricHorizontalPadding24,
          sliver: SliverToBoxAdapter(
            child: Column(
              children: [
                OneInformation(
                  icon: IconsPath.iconsCalender,
                  text: S.of(context).Rental_History,
                  info: "12 / 12 / 2024",
                ),
                24.kh,
                OneInformation(
                  icon: IconsPath.iconsWatch,
                  text: S.of(context).Rental_Period,
                  info: "12 hours",
                ),
                24.kh,
                OneInformation(
                  icon: IconsPath.iconsMoneyBag,
                  text: S.of(context).Total_Cost,
                  info: "\$23.4",
                ),
                24.kh,
                OneInformation(
                  icon: IconsPath.iconsPaymentCards,
                  text: S.of(context).Payment_Method,
                  info: "Cache",
                ),
              ],
            ),
          ),
        ),
        SliverToBoxAdapter(
          child: 32.kh,
        ),
        SliverPadding(
          padding: HelperFunctions.symmetricHorizontalPadding24,
          sliver: const SliverToBoxAdapter(
            child: CustomDashedLine(),
          ),
        ),
        SliverToBoxAdapter(
          child: 32.kh,
        ),
        SliverPadding(
            padding: HelperFunctions.symmetricHorizontalPadding24,
            sliver: SliverToBoxAdapter(
              child: Row(
                children: [
                  27.kw,
                  Expanded(
                    child: AppButton(
                      borderColor: AppColors.redColor,
                      onPressed: () {},
                      buttonColor: AppColors.redColor,
                      text: S.of(context).Ok,
                    ),
                  ),
                  13.kw,
                  Expanded(
                    child: AppButton(
                      borderColor: AppColors.orangeColor,
                      onPressed: () {},
                      buttonColor: AppColors.whiteColor,
                      text: S.of(context).Book_Now,
                      textStyle: AppStyles.style18w500Green(context)
                          .copyWith(color: AppColors.orangeColor),
                    ),
                  ),
                  25.kw,
                ],
              ),
            )),
        SliverToBoxAdapter(
          child: 32.kh,
        ),
      ],
    );
  }
}

class OneInformation extends StatelessWidget {
  const OneInformation({
    super.key,
    required this.icon,
    required this.text,
    required this.info,
  });
  final String icon, text, info;
  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Expanded(
          child: QuestionWidget(icon: icon, questionText: "$text : "),
        ),
        const Spacer(),
        Text(
          info,
          style: AppStyles.style14w500Orange(context),
        )
      ],
    );
  }
}
