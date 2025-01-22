import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_svg/svg.dart';
import 'package:weisro/core/assets_path/icons_path.dart';
import 'package:weisro/core/styles/app_color.dart';
import 'package:weisro/core/styles/app_style.dart';
import 'package:weisro/core/utils/helper_functions.dart';
import 'package:weisro/core/utils/sized_box_extension.dart';
import 'package:weisro/core/widgets/custom_app_bar.dart';
import 'package:weisro/feature/booking/presentation/view/widgets/cancel_and_button.dart';
import 'package:weisro/feature/booking/presentation/view/widgets/information_text.dart';
import 'package:weisro/feature/orders/data/models/order_model.dart';
import 'package:weisro/feature/orders/presentation/managers/booking_pay_cubit/booking_pay_cubit.dart';
import 'package:weisro/feature/orders/presentation/view/payment_page_view.dart';
import 'package:weisro/feature/worker/presentation/view/widget/one_information.dart';
import 'package:weisro/generated/l10n.dart';

class PaymentForOrderPageViewBody extends StatelessWidget {
  const PaymentForOrderPageViewBody({super.key, required this.orderInfo});

  final Order orderInfo;
  @override
  Widget build(BuildContext context) {
    return CustomScrollView(
      slivers: [
        CustomAppBar(title: S.of(context).Pay_Order),
        SliverPadding(
          padding: HelperFunctions.symmetricHorizontalPadding24,
          sliver: SliverToBoxAdapter(
            child: InformationText(
              children: [
                // Expanded(
                //   child: Padding(
                //     padding: const EdgeInsets.symmetric(horizontal: 10),
                //     child: Text(
                //       S.of(context).Service_Hire_Request,
                //       maxLines: 2,
                //       overflow: TextOverflow.ellipsis,
                //       style: AppStyles.style14w400Grey(context)
                //           .copyWith(color: AppColors.redColor),
                //     ),
                //   ),
                // ),
                SvgPicture.asset(IconsPath.iconsParty),
                Text(
                  S.of(context).Confirm_Services_Date,
                  style: AppStyles.style14w500Orange(context)
                      .copyWith(color: AppColors.greenColor),
                )
              ],
            ),
          ),
        ),
        SliverToBoxAdapter(
          child: 55.kh,
        ),
        SliverPadding(
            padding: HelperFunctions.symmetricHorizontalPadding24,
            sliver: SliverToBoxAdapter(
              child: Column(
                children: [
                  24.kh,
                  OneInformation(
                    icon: IconsPath.iconsCalender,
                    text: S.of(context).Rental_History,
                    info: orderInfo.createdAt?.substring(0, 10) ?? "12/12/2024",
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
                    info: "${orderInfo.totalPrice.toString()} \$",
                  ),
                  24.kh,
                  OneInformation(
                    icon: IconsPath.iconsPaymentCards,
                    text: S.of(context).Payment_Method,
                    info: orderInfo.paymentMethod ?? S.of(context).cash,
                  ),
                  24.kh,
                ],
              ),
            )),
        SliverToBoxAdapter(
          child: 55.kh,
        ),
        SliverPadding(
          padding: HelperFunctions.symmetricHorizontalPadding24,
          sliver: const SliverToBoxAdapter(
            child: Divider(
              color: AppColors.greyColor,
            ),
          ),
        ),
        SliverToBoxAdapter(
          child: 20.kh,
        ),
        BlocConsumer<BookingPayCubit, BookingPayState>(
          listener: (context, paymentState) {
            if (paymentState is BookingPaySuccess) {
              if (paymentState.paymentLink.isNotEmpty) {
                HelperFunctions.navigateToScreen(
                  context,
                  (context) => PaymentPageView(
                    paymentUrl: paymentState.paymentLink,
                  ),
                );
              }
            }
          },
          builder: (context, paymentState) {
            return SliverPadding(
              padding: HelperFunctions.symmetricHorizontalPadding24,
              sliver: SliverToBoxAdapter(
                child: CancelAndButton(
                  secondButton: S.of(context).Book_Now,
                  onCancelPressed: () =>
                      HelperFunctions.navigateToBack(context),
                  onBookPressed: () async {
                    await context
                        .read<BookingPayCubit>()
                        .bookingPayment(orderInfo.id ?? "");
                  },
                ),
              ),
            );
          },
        )
      ],
    );
  }
}
