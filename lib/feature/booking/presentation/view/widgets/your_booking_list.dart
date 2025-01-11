import 'package:flutter/material.dart';
import 'package:weisro/core/utils/helper_functions.dart';
import 'package:weisro/core/utils/sized_box_extension.dart';
import 'package:weisro/feature/booking/data/models/your_booking_model.dart';
import 'package:weisro/feature/booking/presentation/view/pages/receive_page_view.dart';
import 'package:weisro/feature/booking/presentation/view/widgets/your_booking_widget.dart';

class YourBookingList extends StatelessWidget {
  const YourBookingList({
    super.key,
    required this.allBooking,
  });
  final List<Docs> allBooking;
  @override
  Widget build(BuildContext context) {
    return ListView.separated(
      separatorBuilder: (context, index) => 20.kh,
      itemCount: allBooking.length,
      // itemCount: 100,
      shrinkWrap: true,
      physics: const NeverScrollableScrollPhysics(),
      itemBuilder: (context, index) {
        Docs booking = allBooking[index];
        // Docs booking = const Docs(
        //     id: "675f01f86f7087f93f0670e4",
        //     paymentMethod: "Cache",
        //     totalPrice: 200);
        return GestureDetector(
            onTap: () => HelperFunctions.navigateToScreen(
                  context,
                  (context) => ReceivePageView(
                    booking: booking,
                  ),
                ),
            child: YourBookingWidget(booking: booking));
      },
    );
  }
}