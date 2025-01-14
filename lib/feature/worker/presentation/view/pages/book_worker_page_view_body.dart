import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:weisro/core/assets_path/icons_path.dart';
import 'package:weisro/core/styles/app_color.dart';
import 'package:weisro/core/styles/app_style.dart';
import 'package:weisro/core/utils/helper_functions.dart';
import 'package:weisro/core/utils/sized_box_extension.dart';
import 'package:weisro/core/widgets/app_button.dart';
import 'package:weisro/core/widgets/custom_app_bar.dart';
import 'package:weisro/core/widgets/custom_dash_line.dart';
import 'package:weisro/core/widgets/custom_dialog.dart';
import 'package:weisro/core/widgets/custom_loading.dart';
import 'package:weisro/core/widgets/custom_text_form_filed.dart';
import 'package:weisro/core/widgets/material_banner.dart';

import 'package:weisro/feature/auth/register/presentation/view/widgets/note_widget.dart';
import 'package:weisro/feature/auth/register/presentation/view/widgets/question_widget.dart';
import 'package:weisro/feature/booking/presentation/manager/book_worker_cubit/book_worker_cubit.dart';
import 'package:weisro/feature/booking/presentation/view/widgets/day_list.dart';
import 'package:weisro/feature/services/data/models/service_model.dart';
import 'package:weisro/generated/l10n.dart';

import '../widget/choose_widget.dart';
import '../widget/one_information.dart';

class BookWorkerPageViewBody extends StatefulWidget {
  const BookWorkerPageViewBody(
      {super.key, required this.days, required this.workerId});
  final List<Day> days;
  final String workerId;

  @override
  State<BookWorkerPageViewBody> createState() => _BookWorkerPageViewBodyState();
}

class _BookWorkerPageViewBodyState extends State<BookWorkerPageViewBody> {
  num totalPrice = 0;
  List<String> selectedDayModels = [];
  @override
  Widget build(BuildContext context) {
    BookWorkerCubit bookWorkerCubit = BookWorkerCubit.get(context);
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
              SizedBox(
                width: HelperFunctions.getScreenWidth(context) * 0.4,
                child: ChooseWidget(
                  chooseTitle: S.of(context).Days,
                  icon: IconsPath.iconsCalender,
                  isSelected: true,
                ),
              ),
              10.kw,

              // Expanded(
              //     child: ChooseWidget(
              //   chooseTitle: S.of(context).Hours,
              //   icon: IconsPath.iconsTime,
              //   isSelected: false,
              // )),
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
                questionText: S.of(context).Available_Rental_Days),
          ),
        ),
        SliverPadding(
          padding: const EdgeInsetsDirectional.only(start: 20, end: 6),
          sliver: SliverToBoxAdapter(
            child: DaysListWidget(
              days: widget.days,
              dayPrice: 50,
              onPriceChanged: (newPrice, dayList) {
                setState(() {
                  totalPrice = newPrice;
                  selectedDayModels = dayList;
                });
              },
            ),
          ),
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
          sliver: SliverToBoxAdapter(
            child: CustomTextFormFiled(
              controller: bookWorkerCubit.noteController,
              maxLength: 200,
              keyboardType: TextInputType.text,
              hintText: S.of(context).Note,
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
                  info: HelperFunctions.getFormattedDate(DateTime.now()),
                ),
                // 24.kh,
                // OneInformation(
                //   icon: IconsPath.iconsWatch,
                //   text: S.of(context).Rental_Period,
                //   info: "12 hours",
                // ),
                24.kh,
                OneInformation(
                  icon: IconsPath.iconsMoneyBag,
                  text: S.of(context).Total_Cost,
                  info: "\$$totalPrice",
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
                      onPressed: () {
                        HelperFunctions.navigateToBack(context);
                      },
                      buttonColor: AppColors.redColor,
                      text: S.of(context).Cancel,
                    ),
                  ),
                  13.kw,
                  BlocConsumer<BookWorkerCubit, BookWorkerState>(
                    listener: (context, bookState) {
                      final messenger = ScaffoldMessenger.of(context);
                      if (bookState is BookWorkerFailures) {
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
                      } else if (bookState is BookWorkerSuccess) {
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
                      if (bookState is BookWorkerLoading) {
                        return const Center(
                          child: CustomLoading(),
                        );
                      } else {
                        return Expanded(
                          child: AppButton(
                            borderColor: AppColors.orangeColor,
                            onPressed: () async {
                              if (selectedDayModels.isEmpty) {
                                CustomDialog.showCustomDialog(
                                    context,
                                    S.of(context).Complete_Information,
                                    S.of(context).Please_select_a_day);
                              } else {
                                await bookWorkerCubit.bookWorker(
                                    widget.workerId, selectedDayModels);
                              }
                            },
                            buttonColor: AppColors.whiteColor,
                            text: S.of(context).Book_Now,
                            textStyle: AppStyles.style18w500Green(context)
                                .copyWith(color: AppColors.orangeColor),
                          ),
                        );
                      }
                    },
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
