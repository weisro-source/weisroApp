import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:weisro/core/assets_path/icons_path.dart';
import 'package:weisro/core/styles/app_color.dart';
import 'package:weisro/core/styles/app_style.dart';
import 'package:weisro/core/styles/style_functions.dart';
import 'package:weisro/core/utils/constant.dart';
import 'package:weisro/core/utils/helper_functions.dart';
import 'package:weisro/core/utils/sized_box_extension.dart';
import 'package:weisro/core/widgets/custom_app_bar.dart';
import 'package:weisro/core/widgets/custom_loading.dart';
import 'package:weisro/core/widgets/material_banner.dart';
import 'package:weisro/feature/booking/data/models/your_booking_model.dart';
import 'package:weisro/feature/booking/presentation/manager/update_booking_statue_cubit/update_booking_statue_cubit.dart';
import 'package:weisro/feature/booking/presentation/view/widgets/cancel_and_button.dart';
import 'package:weisro/feature/worker/presentation/view/widget/one_information.dart';
import 'package:weisro/generated/l10n.dart';

import '../widgets/information_text.dart';

class ReceivePageViewBody extends StatelessWidget {
  const ReceivePageViewBody({super.key, required this.booking});
  final Docs booking;

  @override
  Widget build(BuildContext context) {
    return CustomScrollView(
      slivers: [
        CustomAppBar(title: S.of(context).Book_Service),
        SliverPadding(
          padding: HelperFunctions.symmetricHorizontalPadding24,
          sliver: SliverToBoxAdapter(
            child: InformationText(
              children: [
                Expanded(
                  child: Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 10),
                    child: Text(
                      S.of(context).Service_Hire_Request,
                      maxLines: 2,
                      overflow: TextOverflow.ellipsis,
                      style: AppStyles.style14w400Grey(context)
                          .copyWith(color: AppColors.redColor),
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
        SliverToBoxAdapter(child: 21.kh),
        SliverPadding(
          padding: HelperFunctions.symmetricHorizontalPadding34,
          sliver: SliverToBoxAdapter(
            child: Row(
              children: [
                Text(
                  S.of(context).Service_Name,
                  style: AppStyles.style12w400Grey(context),
                ),
                Text(
                  " : ${booking.service?.name ?? "NO NAME"}",
                  style: AppStyles.style16w400Grey(context),
                )
              ],
            ),
          ),
        ),
        SliverToBoxAdapter(child: 38.kh),
        SliverToBoxAdapter(
          child: Padding(
            padding: HelperFunctions.symmetricHorizontalPadding24,
            child: Text(
              S.of(context).Dates_Booked,
              style: AppStyles.style16w400Grey(context),
            ),
          ),
        ),
        SliverToBoxAdapter(child: 15.kh),
        SliverList.separated(
          itemCount: booking.dates?.length ?? 0,
          itemBuilder: (context, index) {
            return Container(
              height: 40,
              margin: HelperFunctions.symmetricHorizontalPadding24,
              decoration: BoxDecoration(
                color: AppColors.orangeColor,
                border: Border.all(color: AppColors.orangeColor),
                borderRadius: BorderRadius.circular(8),
              ),
              child: Row(
                children: [
                  20.kw,
                  Text(
                    HelperFunctions.dateToDay(
                      booking.dates?[index].date ?? "",
                    ),
                    style: AppStyles.style14w400White(context),
                  )
                ],
              ),
            );
          },
          separatorBuilder: (context, index) => 10.kh,
        ),
        SliverToBoxAdapter(child: 38.kh),
        SliverToBoxAdapter(
          child: Padding(
            padding: const EdgeInsetsDirectional.symmetric(horizontal: 35),
            child: Text(
              S.of(context).Booking_Information,
              style: AppStyles.style16w400Grey(context),
            ),
          ),
        ),
        SliverToBoxAdapter(child: 20.kh),
        SliverToBoxAdapter(
            child: Center(
          child: Container(
            margin: HelperFunctions.symmetricHorizontalPadding34,
            decoration: StyleFunctions.decorationRadius8Orange(),
            padding: const EdgeInsetsDirectional.symmetric(horizontal: 12),
            child: Column(
              children: [
                24.kh,
                OneInformation(
                  icon: IconsPath.iconsCalender,
                  text: S.of(context).Rental_History,
                  info: booking.createdAt?.substring(0, 10) ?? "12/12/2024",
                ),
                // 24.kh,
                // OneInformation(
                //   icon: IconsPath.iconsWatch,
                //   text: S.of(context).Rental_Period,
                //   info: "5",
                // ),
                24.kh,
                OneInformation(
                  icon: IconsPath.iconsMoneyBag,
                  text: S.of(context).Total_Cost,
                  info: "${booking.totalPrice.toString()} \$",
                ),
                24.kh,
                OneInformation(
                  icon: IconsPath.iconsPaymentCards,
                  text: S.of(context).Payment_Method,
                  info: booking.paymentMethod ?? S.of(context).cash,
                ),
                24.kh,
              ],
            ),
          ),
        )),
        SliverToBoxAdapter(child: 41.kh),
        SliverPadding(
          padding: HelperFunctions.symmetricHorizontalPadding34,
          sliver: const SliverToBoxAdapter(
            child: Divider(
              color: AppColors.greyColor,
            ),
          ),
        ),
        SliverToBoxAdapter(child: 36.kh),
        SliverPadding(
          padding: HelperFunctions.symmetricHorizontalPadding24,
          sliver:
              BlocConsumer<UpdateBookingStatueCubit, UpdateBookingStatueState>(
            listener: (context, updateBookingState) {
              final messenger = ScaffoldMessenger.of(context);

              if (updateBookingState is UpdateBookingStatueSuccess) {
                MaterialBanner materialBanner =
                    CustomMaterialBanner.successMaterialBanner(
                  S.of(context).Booking_Successful,
                  S.of(context).Booking_Confirmed,
                );

                messenger
                  ..hideCurrentMaterialBanner()
                  ..showMaterialBanner(materialBanner);

                Future.delayed(const Duration(seconds: 3), () {
                  messenger.hideCurrentMaterialBanner();
                });
              } else if (updateBookingState is UpdateBookingStatueFailures) {
                MaterialBanner materialBanner =
                    CustomMaterialBanner.failureMaterialBanner(
                        S.of(context).Booking_Failed,
                        updateBookingState.error.errMassage);
                messenger
                  ..hideCurrentMaterialBanner()
                  ..showMaterialBanner(materialBanner);

                Future.delayed(const Duration(seconds: 3), () {
                  messenger.hideCurrentMaterialBanner();
                });
              }
            },
            builder: (context, updateBookingState) {
              if (updateBookingState is UpdateBookingStatueLoading) {
                return const SliverToBoxAdapter(
                  child: CustomLoading(),
                );
              } else {
                return SliverToBoxAdapter(
                  child: CancelAndButton(
                    secondButton: S.of(context).Book_Now,
                    onCancelPressed: () =>
                        HelperFunctions.navigateToBack(context),
                    onBookPressed: () async {
                      await context
                          .read<UpdateBookingStatueCubit>()
                          .updateBookingState(
                              booking.id ?? "", Constants.acceptBookingState);
                    },
                  ),
                );
              }
            },
          ),
        ),
        SliverToBoxAdapter(child: 38.kh),
      ],
    );
  }
}
