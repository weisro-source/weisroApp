import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:weisro/feature/booking/presentation/manager/your_booking_cubit/your_booking_cubit.dart';
import 'package:weisro/feature/booking/presentation/view/pages/your_booking_page_view_body.dart';
import 'package:weisro/feature/profile/presentation/view/widgets/custom_app_bar_in_profile_view.dart';

class YourBookingPageView extends StatelessWidget {
  const YourBookingPageView({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => YourBookingCubit()..getAllYourBooking(pageNumber: 1),
      child: const Scaffold(
        appBar: CustomAppBarInProfileView(),
        body: YourBookingPageViewBody(),
      ),
    );
  } 
}
  