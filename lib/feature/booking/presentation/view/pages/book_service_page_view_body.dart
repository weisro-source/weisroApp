import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:weisro/core/assets_path/icons_path.dart';
import 'package:weisro/core/styles/app_color.dart';
import 'package:weisro/core/styles/app_style.dart';
import 'package:weisro/core/utils/helper_functions.dart';
import 'package:weisro/core/utils/sized_box_extension.dart';
import 'package:weisro/core/widgets/app_button.dart';
import 'package:weisro/core/widgets/custom_app_bar.dart';
import 'package:weisro/core/widgets/custom_dash_line.dart';
import 'package:weisro/feature/auth/register/presentation/view/widgets/question_widget.dart';
import 'package:weisro/feature/booking/presentation/manager/book_service_cubit/book_service_cubit.dart';
import 'package:weisro/feature/services/data/models/service_model.dart';
import 'package:weisro/feature/worker/presentation/view/pages/book_worker_page_view_body.dart';
import 'package:weisro/feature/worker/presentation/view/widget/choose_widget.dart';
import 'package:weisro/generated/l10n.dart';
import 'package:intl/intl.dart';
import '../widgets/selected_type.dart';

class BookServicePageViewBody extends StatefulWidget {
  const BookServicePageViewBody({
    super.key,
    required this.isDays,
    required this.isHours,
    required this.hours,
    required this.days,
  });

  final bool isDays, isHours;
  final Time hours;
  final List<String> days;

  @override
  State<BookServicePageViewBody> createState() =>
      _BookServicePageViewBodyState();
}

String selected = '';

class _BookServicePageViewBodyState extends State<BookServicePageViewBody> {
  final List<String> selectedHours = [];
  final List<String> selectedDays = [];

  List<String> generateTimeSlots(String? startTime, String? endTime) {
    if (startTime == null || endTime == null) {
      return [];
    }

    try {
      DateFormat inputFormat = DateFormat.jm(); // Input format: "8:00 AM"
      DateFormat outputFormat =
          DateFormat.Hm(); // Output format: "08:00" To view this

      DateTime start = inputFormat.parse(startTime);
      DateTime end = inputFormat.parse(endTime);

      List<String> slots = [];
      while (start.isBefore(end)) {
        DateTime nextHour = start.add(const Duration(hours: 1));
        slots.add(
            "${outputFormat.format(start)} - ${outputFormat.format(nextHour)}");
        start = nextHour;
      }
      return slots;
    } catch (e) {
      return [];
    }
  }

  @override
  void initState() {
    log(widget.days.toString());
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    BookServiceCubit bookServiceCubit = BookServiceCubit.get(context);

    List<String> timeSlots =
        generateTimeSlots(widget.hours.start, widget.hours.end);

    return CustomScrollView(
      slivers: [
        CustomAppBar(title: S.of(context).Book_Service),
        SliverPadding(
          padding: HelperFunctions.symmetricHorizontalPadding24,
          sliver: SliverToBoxAdapter(
            child: QuestionWidget(
              icon: IconsPath.iconsServices,
              questionText: S.of(context).Work_for_hours_or_days,
            ),
          ),
        ),
        SliverToBoxAdapter(
          child: 10.kh,
        ),
        SliverToBoxAdapter(
          child: Row(
            children: [
              40.kw,
              Visibility(
                visible: widget.isDays,
                child: Expanded(
                  child: ChooseWidget(
                    chooseTitle: S.of(context).Days,
                    icon: IconsPath.iconsCalender,
                    isSelected: selected == bookServiceCubit.dailySelected,
                    onPressed: () {
                      setState(() {
                        selected = bookServiceCubit.dailySelected;
                        bookServiceCubit.selectedType(selected, context);
                      });
                    },
                  ),
                ),
              ),
              10.kw,
              Expanded(
                child: Visibility(
                  visible: widget.isHours,
                  child: ChooseWidget(
                    chooseTitle: S.of(context).Hours,
                    icon: IconsPath.iconsTime,
                    isSelected: selected == bookServiceCubit.hourSelected,
                    onPressed: () {
                      setState(() {
                        selected = bookServiceCubit.hourSelected;
                        bookServiceCubit.selectedType(selected, context);
                      });
                    },
                  ),
                ),
              ),
              24.kw,
            ],
          ),
        ),
        SliverToBoxAdapter(
          child: 20.kh,
        ),
        SliverPadding(
          padding: const EdgeInsetsDirectional.symmetric(horizontal: 32),
          sliver: SelectedType(
            type: bookServiceCubit.selectedType(selected, context),
          ),
        ),
        SliverToBoxAdapter(
          child: 24.kh,
        ),
        SliverPadding(
          padding: const EdgeInsets.symmetric(horizontal: 32),
          sliver: SliverToBoxAdapter(
            child: Container(
              padding: const EdgeInsets.all(8.0),
              decoration: ShapeDecoration(
                color: AppColors.second1Color,
                shape: RoundedRectangleBorder(
                  side:
                      const BorderSide(width: 1, color: AppColors.orangeColor),
                  borderRadius: BorderRadius.circular(8),
                ),
              ),
              child: AnimatedSwitcher(
                duration: const Duration(milliseconds: 300),
                transitionBuilder: (child, animation) {
                  return FadeTransition(opacity: animation, child: child);
                },
                child: selected == bookServiceCubit.hourSelected
                    ? _buildHoursGrid(timeSlots)
                    : _buildDaysList(),
              ),
            ),
          ),
        ),
        SliverToBoxAdapter(
          child: 30.kh,
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
          child: 30.kh,
        ),
        SliverPadding(
            padding: HelperFunctions.symmetricHorizontalPadding34,
            sliver: const SliverToBoxAdapter(child: CustomDashedLine())),
        SliverToBoxAdapter(
          child: 36.kh,
        ),
        SliverPadding(
          padding: HelperFunctions.symmetricHorizontalPadding24,
          sliver: SliverToBoxAdapter(
            child: Row(
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
                    text: S.of(context).Book_Now,
                    textStyle: AppStyles.style18w500Grey(context)
                        .copyWith(color: AppColors.orangeColor),
                    onPressed: () async {},
                  ),
                )
              ],
            ),
          ),
        ),
      ],
    );
  }

  Widget _buildHoursGrid(List<String> timeSlots) {
    return GridView.builder(
      key: const ValueKey("hours"),
      shrinkWrap: true,
      physics: const NeverScrollableScrollPhysics(),
      gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
        crossAxisCount: 2,
        childAspectRatio: 123 / 28,
        crossAxisSpacing: 8,
        mainAxisSpacing: 8,
      ),
      itemCount: timeSlots.length,
      itemBuilder: (context, index) {
        final timeSlot = timeSlots[index];
        final isSelected = selectedHours.contains(timeSlot);

        return GestureDetector(
          onTap: () {
            setState(() {
              if (isSelected) {
                selectedHours.remove(timeSlot);
              } else {
                selectedHours.add(timeSlot);
              }
            });
          },
          child: Container(
            alignment: Alignment.center,
            decoration: BoxDecoration(
              color: isSelected ? AppColors.orangeColor : AppColors.whiteColor,
              border: Border.all(color: AppColors.orangeColor),
              borderRadius: BorderRadius.circular(8),
            ),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                SvgPicture.asset(IconsPath.iconsFavTime),
                8.kw,
                Text(
                  timeSlot,
                  style: TextStyle(
                    color: isSelected
                        ? AppColors.whiteColor
                        : AppColors.orangeColor.withOpacity(0.7),
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ],
            ),
          ),
        );
      },
    );
  }

  Widget _buildDaysList() {
    return ListView.separated(
      key: const ValueKey("days"),
      physics: const NeverScrollableScrollPhysics(),
      shrinkWrap: true,
      itemCount: widget.days.length,
      separatorBuilder: (context, index) => 10.kh,
      itemBuilder: (context, index) {
        String day = widget.days[index];
        final isSelected = selectedDays.contains(day);

        return GestureDetector(
          onTap: () {
            setState(() {
              if (isSelected) {
                selectedDays.remove(day);
              } else {
                selectedDays.add(day);
              }
            });
          },
          child: Container(
            alignment: Alignment.center,
            decoration: BoxDecoration(
              color: isSelected ? AppColors.orangeColor : AppColors.whiteColor,
              border: Border.all(color: AppColors.orangeColor),
              borderRadius: BorderRadius.circular(8),
            ),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                SvgPicture.asset(IconsPath.iconsFavTime),
                8.kw,
                Text(
                  day,
                  style: TextStyle(
                    color: isSelected
                        ? AppColors.whiteColor
                        : AppColors.orangeColor.withOpacity(0.7),
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ],
            ),
          ),
        );
      },
    );
  }
}
