import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:shimmer/shimmer.dart';
import 'package:weisro/core/assets_path/icons_path.dart';
import 'package:weisro/core/assets_path/image_path.dart';
import 'package:weisro/core/styles/app_color.dart';
import 'package:weisro/core/styles/app_style.dart';
import 'package:weisro/core/utils/constant.dart';
import 'package:weisro/core/utils/helper_functions.dart';
import 'package:weisro/core/utils/sized_box_extension.dart';
import 'package:weisro/core/widgets/app_button.dart';
import 'package:weisro/core/widgets/custom_app_bar.dart';
import 'package:weisro/core/widgets/days_list.dart';
import 'package:weisro/feature/auth/register/presentation/view/widgets/question_widget.dart';
import 'package:weisro/feature/onboarding/presentation/view/widgets/page_indicator_widget.dart';
import 'package:weisro/generated/l10n.dart';

class ServicesDetailsPageViewBody extends StatefulWidget {
  const ServicesDetailsPageViewBody({super.key});

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
                child: AspectRatio(
                  aspectRatio: 1.55,
                  child: PageView.builder(
                    controller: pageController,
                    itemCount: 4,
                    itemBuilder: (context, index) {
                      return Stack(
                        children: [
                          ClipRRect(
                            borderRadius: BorderRadius.circular(4),
                            child: CachedNetworkImage(
                              fit: BoxFit.cover,
                              placeholder: (context, url) {
                                return Shimmer.fromColors(
                                  baseColor: AppColors.shimmerBaseColor,
                                  highlightColor:
                                      AppColors.shimmerHighlightColor,
                                  child: Container(
                                    width: 341,
                                    height: 220,
                                    decoration: const BoxDecoration(
                                        borderRadius: BorderRadius.all(
                                            Radius.circular(4))),
                                  ),
                                );
                              },
                              imageUrl: Constants.imageUrl,
                              errorWidget: (context, url, error) {
                                return AspectRatio(
                                  aspectRatio: 1.55,
                                  child: Image.asset(
                                    ImagePath.imagesService3,
                                    fit: BoxFit.cover,
                                  ),
                                );
                              },
                            ),
                          )
                        ],
                      );
                    },
                  ),
                ),
              ),
              15.kh,
              PageIndicatorWidget(controller: pageController, count: 4),
              22.kh,
              Row(
                children: [
                  25.kw,
                  Text(
                    "Service Name",
                    style: AppStyles.style16w400Grey(context),
                  ),
                  const Spacer(),
                  ButtonWithContainerOrangeBorder(
                    icon: IconsPath.iconsFavService,
                    onPressed: () {},
                  ),
                  8.kw,
                  ButtonWithContainerOrangeBorder(
                    icon: IconsPath.iconsShare,
                    onPressed: () {},
                  ),
                  24.kw
                ],
              ),
              15.kh,
              Row(
                children: [
                  24.kw,
                  SvgPicture.asset(IconsPath.iconsLocation),
                  8.kw,
                  Text('Oberamen German , 3216',
                      textAlign: TextAlign.center,
                      style: AppStyles.style12w400Grey(context)),
                  const Spacer(),
                  Text('\$5572 ST',
                      textAlign: TextAlign.center,
                      style: AppStyles.style16w500Black(context)
                          .copyWith(color: AppColors.orangeColor)),
                  24.kw,
                ],
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
        SliverToBoxAdapter(
          child: Padding(
            padding: const EdgeInsetsDirectional.symmetric(horizontal: 24),
            child: AspectRatio(
              aspectRatio: 344 / 191,
              child: ClipRRect(
                  borderRadius: const BorderRadius.all(Radius.circular(0)),
                  child: Image.asset(
                    ImagePath.imagesAd,
                    fit: BoxFit.cover,
                  )),
            ),
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
        SliverToBoxAdapter(
          child: Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              AppButton(
                height: 32,
                width: 164,
                buttonColor: AppColors.redColor,
                text: S.of(context).Cancel,
                onPressed: () {},
              ),
              13.kw,
              AppButton(
                height: 32,
                width: 164,
                buttonColor: AppColors.whiteColor,
                borderColor: AppColors.orangeColor,
                text: S.of(context).Publish,
                textStyle: AppStyles.style18w500Green(context)
                    .copyWith(color: AppColors.orangeColor),
                onPressed: () {},
              ),
            ],
          ),
        ),
        SliverToBoxAdapter(
          child: 60.kh,
        ),
      ],
    );
  }
}

class TimeWidget extends StatelessWidget {
  const TimeWidget({super.key, required this.time});
  final String time;
  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        SvgPicture.asset(IconsPath.iconsTime),
        4.kw,
        Text(
          time,
          style: AppStyles.style14w500Orange(context),
        )
      ],
    );
  }
}

class ButtonWithContainerOrangeBorder extends StatelessWidget {
  const ButtonWithContainerOrangeBorder({
    super.key,
    this.onPressed,
    required this.icon,
  });
  final void Function()? onPressed;
  final String icon;
  @override
  Widget build(BuildContext context) {
    return Container(
      height: 27,
      width: 27,
      decoration: ShapeDecoration(
        color: Colors.white,
        shape: RoundedRectangleBorder(
          side: const BorderSide(width: 1, color: AppColors.orangeColor),
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
        child: IconButton(
            onPressed: onPressed,
            icon: SvgPicture.asset(
              icon,
              colorFilter:
                  const ColorFilter.mode(AppColors.greyColor, BlendMode.srcIn),
            )),
      ),
    );
  }
}
