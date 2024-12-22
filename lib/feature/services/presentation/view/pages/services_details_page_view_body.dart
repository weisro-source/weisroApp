import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'package:weisro/core/assets_path/icons_path.dart';
import 'package:weisro/core/styles/app_color.dart';
import 'package:weisro/core/styles/app_style.dart';
import 'package:weisro/core/utils/helper_functions.dart';
import 'package:weisro/core/utils/sized_box_extension.dart';
import 'package:weisro/core/widgets/app_button.dart';
import 'package:weisro/core/widgets/custom_app_bar.dart';
import 'package:weisro/core/widgets/custom_text_form_filed.dart';
import 'package:weisro/core/widgets/days_list.dart';
import 'package:weisro/core/widgets/location_price_row_widget.dart';
import 'package:weisro/core/widgets/service_name_row_widget.dart';
import 'package:weisro/feature/auth/register/presentation/view/widgets/question_widget.dart';
import 'package:weisro/feature/booking/presentation/view/pages/service_booking_page_view.dart';
import 'package:weisro/feature/onboarding/presentation/view/widgets/page_indicator_widget.dart';
import 'package:weisro/feature/services/data/models/service_model.dart';
import 'package:weisro/feature/services/presentation/managers/add_service_cubit/add_service_cubit.dart';
import 'package:weisro/feature/services/presentation/managers/add_service_to_favorite_cubit/add_service_to_favorite_cubit.dart';
import 'package:weisro/feature/services/presentation/managers/get_service_by_id_cubit/get_service_by_id_cubit.dart';
import 'package:weisro/generated/l10n.dart';

import '../../../../../core/widgets/ad_widget_in_details.dart';
import '../../../../../core/widgets/image_list_in_details_page.dart';
import '../../../../../core/widgets/time_widget.dart';

class ServicesDetailsPageViewBody extends StatefulWidget {
  const ServicesDetailsPageViewBody(
      {super.key,
      required this.serviceId,
      required this.oneService,
      required this.isReview});
  final String serviceId;
  final ServiceModel oneService;
  final bool isReview;

  @override
  State<ServicesDetailsPageViewBody> createState() =>
      _ServicesDetailsPageViewBodyState();
}

class _ServicesDetailsPageViewBodyState
    extends State<ServicesDetailsPageViewBody> {
  final PageController pageController = PageController();
  TextEditingController deceptionTextController = TextEditingController();
  @override
  void initState() {
    deceptionTextController.text = widget.oneService.service?.description ?? "";
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    AddServiceToFavoriteCubit addServiceToFavoriteCubit =
        AddServiceToFavoriteCubit.get(context);
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
                child: ImageListInDetailsPage(
                  pageController: pageController,
                  imageList: widget.oneService.service?.images ?? [],
                  isReview: widget.isReview,
                ),
              ),
              15.kh,
              PageIndicatorWidget(
                  controller: pageController,
                  count: widget.oneService.service?.images?.length ?? 0),
              22.kh,
              Visibility(
                visible: !widget.isReview,
                child: BlocConsumer<AddServiceToFavoriteCubit,
                    AddServiceToFavoriteState>(
                  listener: (context, addServiceToFavoriteState) {
                    if (addServiceToFavoriteState
                        is AddServiceToFavoriteSuccess) {
                      GetServiceByIdCubit.get(context)
                          .changeFavoriteValueForService(
                              widget.oneService.isFavorite ?? false);
                      log(addServiceToFavoriteState.message);
                    }
                  },
                  builder: (context, addServiceToFavoriteState) {
                    return ServiceNameRowWidget(
                      isFav: widget.oneService.isFavorite ?? false,
                      serviceName: widget.oneService.service?.name ?? "",
                      onFavPressed: () async {
                        await addServiceToFavoriteCubit.addServiceToFavorite(
                            context, widget.oneService.service?.id ?? "");
                        // Add your logic for favorite button
                      },
                      onSharePressed: () {
                        // Add your logic for share button
                        // final serviceId = widget.oneService.service?.id ?? "";
                      },
                      isFavLoading: addServiceToFavoriteState
                          is AddServiceToFavoriteLoading,
                    );
                  },
                ),
              ),
              15.kh,
              LocationPriceRowWidget(
                price: '\$${widget.oneService.service?.dailyPrice} ST',
              ),
              Visibility(
                  visible: widget.oneService.service?.time?.start != null &&
                      widget.oneService.service?.time?.end != null,
                  child: 14.kh),
              Visibility(
                visible: widget.oneService.service?.time?.start != null &&
                    widget.oneService.service?.time?.end != null,
                child: Padding(
                  padding: const EdgeInsetsDirectional.only(start: 24),
                  child: QuestionWidget(
                      icon: IconsPath.iconsTimeIsMoneyClock,
                      questionText: S.of(context).Available_Rental_Hours),
                ),
              ),
              Visibility(
                  visible: widget.oneService.service?.time?.start != null &&
                      widget.oneService.service?.time?.end != null,
                  child: 14.kh),
              Visibility(
                visible: widget.oneService.service?.time?.start != null &&
                    widget.oneService.service?.time?.end != null,
                child: Row(
                  children: [
                    27.kw,
                    // this start time for service
                    TimeWidget(
                        time: widget.oneService.service?.time?.start ?? ""),
                    35.kw,
                    Text(
                      S.of(context).To,
                      style: AppStyles.style14w400Grey(context),
                    ),
                    23.kw,
                    TimeWidget(time: widget.oneService.service?.time?.end ?? "")
                  ],
                ),
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
        SliverPadding(
            padding: const EdgeInsetsDirectional.only(start: 24, end: 24),
            sliver: DaysList(
              oneServiceDays: widget.oneService.service?.days
                  ?.map((day) => day.day)
                  .whereType<String>() // Remove null values
                  .toList(),
              isReview: widget.isReview,
            )),
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
              child: CustomTextFormFiled(
            readOnly: true,
            hintText: "",
            controller: deceptionTextController,
            enabled: true,
            borderColor: AppColors.orangeColor,
            fillColor: AppColors.whiteColor,
            filled: true,
            minLines: 4,
            maxLines: 10,
            topPadding: 13,
          )),
        ),
        SliverToBoxAdapter(
          child: 26.kh,
        ),
        //! if page from add
        SliverPadding(
          padding: HelperFunctions.symmetricHorizontalPadding24,
          sliver: SliverToBoxAdapter(
            child: widget.isReview
                ? Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Expanded(
                        child: AppButton(
                          borderColor: AppColors.redColor,
                          buttonColor: AppColors.redColor,
                          text: S.of(context).Cancel,
                          onPressed: () {},
                        ),
                      ),
                      10.kw,
                      Expanded(
                        child: AppButton(
                          borderColor: AppColors.orangeColor,
                          buttonColor: AppColors.whiteColor,
                          text: S.of(context).publish,
                          textStyle: AppStyles.style18w500Grey(context)
                              .copyWith(color: AppColors.orangeColor),
                          onPressed: () async {
                            await AddServiceCubit.get(context)
                                .addServiceCallApi(context);
                          },
                        ),
                      )
                    ],
                  )
                :
                //! if page not from add

                AppButton(
                    height: 32,
                    width: 164,
                    // buttonColor: AppColors.whiteColor,
                    // borderColor: AppColors.orangeColor,
                    text: S.of(context).Book_Now,
                    // textStyle: AppStyles.style18w500Green(context)
                    //     .copyWith(color: AppColors.orangeColor),
                    onPressed: () {
                      HelperFunctions.navigateToScreen(
                        context,
                        (context) => BookServicePageView(
                          isDays: widget.oneService.service?.days != null &&
                              widget.oneService.service!.days!.isNotEmpty,
                          isHours: widget.oneService.service?.time != null,
                          hours:
                              widget.oneService.service?.time ?? const Time(),
                          days: widget.oneService.service?.days,
                        ),
                      );
                    },
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
