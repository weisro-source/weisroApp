import 'package:flutter/material.dart';

import 'package:weisro/core/assets_path/icons_path.dart';
import 'package:weisro/core/styles/app_color.dart';
import 'package:weisro/core/styles/app_style.dart';
import 'package:weisro/core/utils/helper_functions.dart';
import 'package:weisro/core/utils/sized_box_extension.dart';
import 'package:weisro/core/widgets/app_button.dart';
import 'package:weisro/core/widgets/custom_app_bar.dart';
import 'package:weisro/core/widgets/days_list.dart';
import 'package:weisro/core/widgets/location_price_row_widget.dart';
import 'package:weisro/core/widgets/service_name_row_widget.dart';
import 'package:weisro/feature/auth/register/presentation/view/widgets/question_widget.dart';
import 'package:weisro/feature/onboarding/presentation/view/widgets/page_indicator_widget.dart';
import 'package:weisro/feature/services/data/models/service_model.dart';
import 'package:weisro/generated/l10n.dart';

import '../../../../../core/widgets/ad_widget_in_details.dart';
import '../../../../../core/widgets/image_list_in_details_page.dart';
import '../../../../../core/widgets/time_widget.dart';

class ServicesDetailsPageViewBody extends StatefulWidget {
  const ServicesDetailsPageViewBody(
      {super.key, required this.serviceId, required this.oneService});
  final String serviceId;
  final ServiceModel oneService;

  @override
  State<ServicesDetailsPageViewBody> createState() =>
      _ServicesDetailsPageViewBodyState();
}

class _ServicesDetailsPageViewBodyState
    extends State<ServicesDetailsPageViewBody> {
  final PageController pageController = PageController();
  @override
  Widget build(BuildContext context) {
    return CustomScrollView(
      slivers: [
        CustomAppBar(
          title: S.of(context).Services_Details,
        ),
        SliverToBoxAdapter(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Padding(
                padding: const EdgeInsetsDirectional.symmetric(horizontal: 24),
                child: ImageListInDetailsPage(pageController: pageController),
              ),
              15.kh,
              PageIndicatorWidget(controller: pageController, count: 4),
              22.kh,
              ServiceNameRowWidget(
                serviceName: "Service Name",
                onFavPressed: () {
                  // Add your logic for favorite button
                },
                onSharePressed: () {
                  // Add your logic for share button
                },
              ),
              15.kh,
              const LocationPriceRowWidget(
                price: '\$5572 ST',
              ),
              14.kh,
              Padding(
                padding: const EdgeInsetsDirectional.only(start: 24),
                child: QuestionWidget(
                    icon: IconsPath.iconsTimeIsMoneyClock,
                    questionText: S.of(context).Available_Rental_Hours),
              ),
              14.kh,
              Row(
                children: [
                  27.kw,
                  const TimeWidget(time: "12:09"),
                  35.kw,
                  Text(
                    S.of(context).To,
                    style: AppStyles.style14w400Grey(context),
                  ),
                  23.kw,
                  const TimeWidget(time: "12:30")
                ],
              ),
              18.kh,
              Padding(
                padding: const EdgeInsetsDirectional.symmetric(horizontal: 25),
                child: QuestionWidget(
                    icon: IconsPath.iconsCalender,
                    questionText: S.of(context).Available_Rental_Days),
              ),
            ],
          ),
        ),
        SliverToBoxAdapter(
          child: 12.kh,
        ),
        const SliverPadding(
            padding: EdgeInsetsDirectional.only(start: 24, end: 24),
            sliver: DaysList()),
        SliverToBoxAdapter(
          child: 19.kh,
        ),
        const SliverToBoxAdapter(
          child: Padding(
            padding: EdgeInsetsDirectional.symmetric(horizontal: 24),
            child: AdWidgetInDetails(),
          ),
        ),
        SliverToBoxAdapter(
          child: 20.kh,
        ),
        SliverPadding(
          padding: const EdgeInsetsDirectional.only(start: 24),
          sliver: SliverToBoxAdapter(
            child: QuestionWidget(
                icon: IconsPath.iconsBook,
                questionText: S.of(context).Description_Service),
          ),
        ),
        SliverToBoxAdapter(
          child: 11.kh,
        ),
        SliverPadding(
          padding: const EdgeInsetsDirectional.symmetric(horizontal: 24),
          sliver: SliverToBoxAdapter(
            child: Container(
              height: 177,
              width: HelperFunctions.getScreenWidth(context),
              decoration: BoxDecoration(
                  border: Border.all(color: AppColors.orangeColor, width: 1),
                  borderRadius: const BorderRadius.all(Radius.circular(8))),
            ),
          ),
        ),
        SliverToBoxAdapter(
          child: 26.kh,
        ),
        SliverPadding(
          padding: HelperFunctions.symmetricHorizontalPadding24,
          sliver: SliverToBoxAdapter(
            child: AppButton(
              height: 32,
              width: 164,
              // buttonColor: AppColors.whiteColor,
              // borderColor: AppColors.orangeColor,
              text: S.of(context).Book_Now,
              // textStyle: AppStyles.style18w500Green(context)
              //     .copyWith(color: AppColors.orangeColor),
              onPressed: () {},
            ),
          ),
        ),
        SliverToBoxAdapter(
          child: 60.kh,
        ),
      ],
    );
  }
}
