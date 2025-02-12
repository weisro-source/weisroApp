import 'dart:developer';

import 'package:animated_rating_stars/animated_rating_stars.dart';
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
import 'package:weisro/core/widgets/location_widget.dart';
import 'package:weisro/core/widgets/service_name_row_widget.dart';
import 'package:weisro/feature/auth/register/presentation/view/widgets/question_widget.dart';
import 'package:weisro/feature/booking/presentation/view/pages/service_booking_page_view.dart';
import 'package:weisro/feature/onboarding/presentation/view/widgets/page_indicator_widget.dart';
import 'package:weisro/feature/services/data/models/service_model.dart';
import 'package:weisro/feature/services/presentation/managers/add_service_cubit/add_service_cubit.dart';
import 'package:weisro/feature/services/presentation/managers/add_service_to_favorite_cubit/add_service_to_favorite_cubit.dart';
import 'package:weisro/feature/services/presentation/managers/get_service_by_id_cubit/get_service_by_id_cubit.dart';
import 'package:weisro/feature/services/presentation/view/widgets/delete_service_dialog.dart';
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
                  padding:
                      const EdgeInsetsDirectional.symmetric(horizontal: 24),
                  child: widget.oneService.service?.images?.isNotEmpty ?? false
                      ? ImageListInDetailsPage(
                          pageController: pageController,
                          imageList: widget.oneService.service?.images ?? [],
                          isReview: widget.isReview,
                        )
                      : const SizedBox()),
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
              // this daily price
              LocationPriceRowWidget(
                price:
                    '\$${widget.oneService.service?.dailyPrice} ${S.of(context).Per_Day}',
                location: widget.oneService.service?.location?.address ??
                    AddServiceCubit.get(context).selectedLocation?.city ??
                    "",
              ),
              Visibility(
                  visible: widget.oneService.service?.hourlyPrice != 0,
                  child: 15.kh),
              // this hourly price
              LocationPriceRowWidget(
                price:
                    '\$${widget.oneService.service?.hourlyPrice} ${S.of(context).Per_Hour}',
                location: widget.oneService.service?.location?.address ??
                    AddServiceCubit.get(context).selectedLocation?.city ??
                    "",
              ),
              15.kh,
              Padding(
                padding: const EdgeInsetsDirectional.symmetric(horizontal: 24),
                child: Align(
                  alignment: AlignmentDirectional.topStart,
                  child: AnimatedRatingStars(
                    initialRating:
                        widget.oneService.service?.rateCount?.toDouble() ?? 0,
                    minRating: 0.0,
                    maxRating: 5.0,
                    filledColor: Colors.amber,
                    emptyColor: AppColors.greyColor,
                    filledIcon: Icons.star,
                    halfFilledIcon: Icons.star_half,
                    emptyIcon: Icons.star_border,
                    onChanged: (double rating) {},
                    displayRatingValue: true,
                    interactiveTooltips: true,
                    customFilledIcon: Icons.star,
                    customHalfFilledIcon: Icons.star_half,
                    customEmptyIcon: Icons.star_border,
                    starSize: 20.0,
                    animationDuration: const Duration(milliseconds: 300),
                    animationCurve: Curves.easeInOut,
                    readOnly: true,
                  ),
                ),
              ),
              18.kh,
              LocationWidget(
                  location: widget.oneService.service?.location?.address ??
                      AddServiceCubit.get(context).selectedLocationName ??
                      ""),
              Visibility(
                  visible: widget.oneService.service?.time?.isNotEmpty ?? false,
                  child: 14.kh),
              Visibility(
                visible: widget.oneService.service?.time?.isNotEmpty ?? false,
                child: Padding(
                  padding: const EdgeInsetsDirectional.only(start: 24),
                  child: QuestionWidget(
                      icon: IconsPath.iconsTimeIsMoneyClock,
                      questionText: S.of(context).Available_Rental_Hours),
                ),
              ),
              Visibility(
                  visible: widget.oneService.service?.time?.isNotEmpty ?? false,
                  child: 14.kh),
              Visibility(
                visible: widget.oneService.service?.time?.isNotEmpty ?? false,
                child: Row(
                  children: [
                    27.kw,
                    // this start time for service
                    TimeWidget(
                        time: widget.oneService.service?.time?.isNotEmpty ??
                                false
                            ? widget.oneService.service?.time?.first.start ?? ""
                            : ""),
                    35.kw,
                    Text(
                      S.of(context).To,
                      style: AppStyles.style14w400Grey(context),
                    ),
                    23.kw,
                    TimeWidget(
                        time: widget.oneService.service?.time?.isNotEmpty ??
                                false
                            ? widget.oneService.service?.time?.first.start ?? ""
                            : "")
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
                Visibility(
                    visible: !HelperFunctions.isCurrentUser(
                        widget.oneService.service?.user?.id ?? ""),
                    child: AppButton(
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
                            isHours:
                                widget.oneService.service?.time?.isNotEmpty ??
                                    false,
                            hours:
                                widget.oneService.service?.time?.isNotEmpty ==
                                        true
                                    ? widget.oneService.service?.time?.first ??
                                        const Time()
                                    : const Time(),
                            days: widget.oneService.service?.days,
                            dayPrice:
                                widget.oneService.service?.dailyPrice ?? 0,
                            hourPrice:
                                widget.oneService.service?.hourlyPrice ?? 0,
                            serviceId: widget.oneService.service?.id ?? "",
                          ),
                        );
                      },
                    ),
                  ),
          ),
        ),
        SliverPadding(
            padding: HelperFunctions.symmetricHorizontalPadding24,
            sliver: SliverToBoxAdapter(
              child: Visibility(
                  visible: (HelperFunctions.isCurrentUser(
                          widget.oneService.service?.user?.id ?? "") &&
                      !widget.isReview),
                  child: AppButton(
                    height: 32,
                    width: 164,
                    onPressed: () {
                      showDeleteConfirmationDialog(
                          context, widget.oneService.service?.id ?? "");
                    },
                    buttonColor: AppColors.redColor,
                    borderColor: AppColors.redColor,
                    text: S.of(context).Delete_Service,
                  )),
            )),
        SliverToBoxAdapter(
          child: 60.kh,
        ),
      ],
    );
  }
}
