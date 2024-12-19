import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_svg/svg.dart';
import 'package:weisro/core/assets_path/icons_path.dart';
import 'package:weisro/core/styles/app_color.dart';
import 'package:weisro/core/styles/app_style.dart';
import 'package:weisro/core/utils/helper_functions.dart';
import 'package:weisro/core/utils/sized_box_extension.dart';
import 'package:weisro/core/widgets/custom_app_bar.dart';
import 'package:weisro/core/widgets/custom_dash_line.dart';
import 'package:weisro/feature/auth/data/worker_time.dart';
import 'package:weisro/feature/auth/register/presentation/view/widgets/question_widget.dart';
import 'package:weisro/feature/booking/presentation/manager/book_service_cubit/book_service_cubit.dart';
import 'package:weisro/feature/services/data/models/service_model.dart';
import 'package:weisro/feature/worker/presentation/view/pages/book_worker_page_view_body.dart';
import 'package:weisro/feature/worker/presentation/view/widget/choose_widget.dart';
import 'package:weisro/generated/l10n.dart';
import '../widgets/cancel_and_button.dart';
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
  late Map<String, String> daysKeysValues;
  @override
  void didChangeDependencies() {
    super.didChangeDependencies();

    // Initialize daysKeysValues here, where localization is available
    daysKeysValues = WorkerTime.daysSelected(context);
    //  addPostFrameCallback to delay the call to selectedType until after the build to resolve this error
  }

  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    BookServiceCubit bookServiceCubit = BookServiceCubit.get(context);

    List<String> timeSlots = bookServiceCubit.generateTimeSlots(
        widget.hours.start, widget.hours.end);

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
                  info: HelperFunctions.getFormattedDate(DateTime.now()),
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
            child: CancelAndButton(
              secondButton: S.of(context).Book_Now,
              onBookPressed: () {},
              onCancelPressed: () {},
            ),
          ),
        ),
        SliverToBoxAdapter(
          child: 36.kh,
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
    final daysKeys = WorkerTime.daysSelected(context)
        .keys
        .toList(); // Convert keys to a list such Saturday , Sunday
    final daysValues = WorkerTime.daysSelected(context)
        .values
        .toList(); // Convert values to a list such sa , su
    return ListView.separated(
      key: const ValueKey("days"),
      physics: const NeverScrollableScrollPhysics(),
      shrinkWrap: true,
      itemCount: daysKeys.length,
      separatorBuilder: (context, index) => 10.kh,
      itemBuilder: (context, index) {
        String dayKey = daysKeys[index];
        String dayValue = daysValues[index];
        bool isContained = widget.days.contains(dayKey);
        String dayDate = HelperFunctions.getDateForDay(dayKey);
        return Column(
          children: [
            GestureDetector(
              onTap: isContained ? () {} : null,
              child: Container(
                alignment: Alignment.center,
                decoration: BoxDecoration(
                  color:
                      isContained ? AppColors.whiteColor : AppColors.redColor,
                  border: Border.all(color: AppColors.orangeColor),
                  borderRadius: BorderRadius.circular(8),
                ),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    20.kw,
                    SvgPicture.asset(IconsPath.iconsFavTime),
                    8.kw,
                    Text(dayValue,
                        style: AppStyles.style12w500Orange(context).copyWith(
                            color: isContained
                                ? AppColors.orangeColor
                                : AppColors.whiteColor)),
                    8.kw,
                    Text(dayDate,
                        style: AppStyles.style12w500Orange(context).copyWith(
                            color: isContained
                                ? AppColors.orangeColor
                                : AppColors.whiteColor)),
                    const Spacer(),
                    Text(
                      "7 pm - 9 am",
                      style: AppStyles.style10w400Second2(context).copyWith(
                          color: isContained
                              ? AppColors.orangeColor
                              : AppColors.whiteColor),
                    ),
                    const Spacer(),
                  ],
                ),
              ),
            ),
          ],
        );
      },
    );
  }
}
