import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:weisro/core/assets_path/icons_path.dart';
import 'package:weisro/core/manager/language_cubit/language_cubit.dart';
import 'package:weisro/core/styles/app_color.dart';
import 'package:weisro/core/utils/ansi_color.dart';
import 'package:weisro/core/utils/constant.dart';
import 'package:weisro/core/utils/helper_functions.dart';
import 'package:weisro/core/utils/sized_box_extension.dart';
import 'package:weisro/core/widgets/custom_app_bar.dart';
import 'package:weisro/core/widgets/custom_dash_line.dart';
import 'package:weisro/core/widgets/custom_dialog.dart';
import 'package:weisro/core/widgets/custom_loading.dart';
import 'package:weisro/core/widgets/material_banner.dart';
import 'package:weisro/feature/auth/data/worker_time.dart';
import 'package:weisro/feature/auth/register/presentation/view/widgets/question_widget.dart';
import 'package:weisro/feature/booking/presentation/manager/book_service_cubit/book_service_cubit.dart';
import 'package:weisro/feature/booking/presentation/view/widgets/day_list.dart';
import 'package:weisro/feature/booking/presentation/view/widgets/hours_grid.dart';
import 'package:weisro/feature/services/data/models/service_model.dart';
import 'package:weisro/feature/worker/presentation/view/widget/choose_widget.dart';
import 'package:weisro/generated/l10n.dart';
import '../../../../worker/presentation/view/widget/one_information.dart';
import '../widgets/cancel_and_button.dart';
import '../widgets/selected_type.dart';

class BookServicePageViewBody extends StatefulWidget {
  const BookServicePageViewBody({
    super.key,
    required this.isDays,
    required this.isHours,
    required this.hours,
    required this.days,
    required this.dayPrice,
    required this.hourPrice,
    required this.serviceId,
  });

  final bool isDays, isHours;
  final Time hours;
  final List<Day>? days;
  final num dayPrice, hourPrice;
  final String serviceId;

  @override
  State<BookServicePageViewBody> createState() =>
      _BookServicePageViewBodyState();
}

class _BookServicePageViewBodyState extends State<BookServicePageViewBody> {
  final List<String> selectedHours = [];
  final List<String> selectedDays = [];
  List<String> selectedDayModels = [];

  num totalPrice = 0;
  late String selected;
  late DateTime selectedDate;
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
    selected = widget.isDays ? Constants.dailyKey : Constants.hoursKey;
    selectedDate = DateTime.now();
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
                        totalPrice = 0;
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
                        totalPrice = 0;
                        selectedHours.clear();
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
                    ? HoursGridWidget(
                        timeSlots: timeSlots,
                        selectedHours: selectedHours,
                        onHourSelected: (timeSlot) {
                          setState(() {
                            if (selectedHours.contains(timeSlot)) {
                              selectedHours.remove(timeSlot);
                            } else {
                              selectedHours.add(timeSlot);
                            }
                            totalPrice =
                                selectedHours.length * (widget.hourPrice);
                            log(
                              AnsiColor.colorize(
                                "This Hours sleeted $selectedHours",
                                AnsiColor.magenta,
                              ),
                              name: "SLEETED HOURS",
                            );
                          });
                        },
                      )
                    : DaysListWidget(
                        days: widget.days,
                        dayPrice: widget.dayPrice,
                        onPriceChanged: (newPrice, dayList) {
                          setState(() {
                            totalPrice = newPrice;
                            selectedDayModels = dayList;
                          });
                        },
                      ),
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
                GestureDetector(
                  onTap: () async {
                    if (selected == bookServiceCubit.hourSelected) {
                      DateTime? pickedDate = await showDatePicker(
                        context: context,
                        firstDate: DateTime.now(),
                        lastDate: DateTime(2100),
                        currentDate: DateTime.now(),
                        initialDate: selectedDate,
                        keyboardType: TextInputType.datetime,
                        cancelText: S.of(context).Cancel,
                        confirmText: S.of(context).Ok,
                        locale: Locale(
                          BlocProvider.of<LanguageCubit>(context).localLang ??
                              'en',
                        ),
                      );

                      if (pickedDate != null && pickedDate != selectedDate) {
                        setState(() {
                          selectedDate = pickedDate;
                        });
                      }
                    } else {
                      log(selected);
                    }
                  },
                  child: OneInformation(
                    icon: IconsPath.iconsCalender,
                    text: S.of(context).Rental_History,
                    info: HelperFunctions.getFormattedDate(selectedDate),
                  ),
                ),
                24.kh,
                OneInformation(
                  icon: IconsPath.iconsWatch,
                  text: S.of(context).Rental_Period,
                  info: selected == bookServiceCubit.hourSelected
                      ? "${selectedHours.length} ${S.of(context).Hours}"
                      : "${selectedDayModels.length} ${S.of(context).Days}",
                ),
                24.kh,
                OneInformation(
                  icon: IconsPath.iconsMoneyBag,
                  text: S.of(context).Total_Cost,
                  info: "$totalPrice \$",
                ),
                24.kh,
                OneInformation(
                  icon: IconsPath.iconsPaymentCards,
                  text: S.of(context).Payment_Method,
                  info: S.of(context).cash,
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
            child: BlocConsumer<BookServiceCubit, BookServiceState>(
              listener: (context, bookState) {
                final messenger = ScaffoldMessenger.of(context);
                if (bookState is BookServiceFailures) {
                  MaterialBanner materialBanner =
                      CustomMaterialBanner.failureMaterialBanner(
                          S.of(context).Booking_Failed,
                          bookState.error.errMassage);
                  ScaffoldMessenger.of(context)
                    ..hideCurrentMaterialBanner()
                    ..showMaterialBanner(materialBanner);

                  messenger
                    ..hideCurrentMaterialBanner()
                    ..showMaterialBanner(materialBanner);

                  Future.delayed(const Duration(seconds: 3), () {
                    if (mounted) {
                      messenger.hideCurrentMaterialBanner();
                    }
                  });
                } else if (bookState is BookServiceSuccess) {
                  MaterialBanner materialBanner =
                      CustomMaterialBanner.successMaterialBanner(
                    S.of(context).Booking_Successful,
                    S.of(context).Booking_Confirmed,
                  );
                  ScaffoldMessenger.of(context)
                    ..hideCurrentMaterialBanner()
                    ..showMaterialBanner(materialBanner);
                  messenger
                    ..hideCurrentMaterialBanner()
                    ..showMaterialBanner(materialBanner);

                  Future.delayed(const Duration(seconds: 3), () {
                    if (mounted) {
                      messenger.hideCurrentMaterialBanner();
                    }
                  });
                }
              },
              builder: (context, bookState) {
                if (bookState is BookServiceLoading) {
                  return const Center(child: CustomLoading());
                } else {
                  return CancelAndButton(
                    secondButton: S.of(context).Book_Now,
                    onBookPressed: () async {
                      //! if user want to book as hours
                      if (selected == bookServiceCubit.hourSelected) {
                        // Sort the selected hours to get the earliest and latest times
                        selectedHours.sort();

                        // Extract the start and end times
                        String startTime =
                            selectedHours.first.split(' - ').first;
                        String endTime = selectedHours.last.split(' - ').last;

                        // Prepare the date as a string
                        String date = HelperFunctions.getFormattedDate(
                            selectedDate,
                            format: "yyyy-MM-dd ");
                        // String date = HelperFunctions.getFormattedDate(
                        //     selectedDate,
                        //     format: "dd-MM-yyyy");
                        log(
                          AnsiColor.colorize(
                            "$startTime - $endTime - $date",
                            AnsiColor.white,
                          ),
                          name: "Start time and end time and date",
                        );
                        await bookServiceCubit.addServiceBooking(
                            widget.serviceId,
                            [],
                            "",
                            true,
                            date,
                            startTime,
                            endTime);
                      }
                      // if user want to book as days

                      else {
                        if (bookServiceCubit.validateInput(
                            selectedDayModels, context)) {
                          await bookServiceCubit.addServiceBooking(
                              widget.serviceId,
                              selectedDayModels,
                              "",
                              false,
                              "",
                              "",
                              "");
                        } else {
                          CustomDialog.showCustomDialog(
                              context,
                              S.of(context).Incomplete_Information,
                              bookServiceCubit.errorValidateMessage);
                        }
                      }
                    },
                    onCancelPressed: () {
                      HelperFunctions.navigateToBack(context);
                    },
                  );
                }
              },
            ),
          ),
        ),
        SliverToBoxAdapter(
          child: 36.kh,
        ),
      ],
    );
  }
}
