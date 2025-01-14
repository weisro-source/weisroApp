import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'package:weisro/core/styles/app_style.dart';
import 'package:weisro/core/utils/helper_functions.dart';
import 'package:weisro/core/utils/sized_box_extension.dart';
import 'package:weisro/core/widgets/custom_error_widget.dart';
import 'package:weisro/feature/booking/data/models/your_booking_model.dart';
import 'package:weisro/feature/booking/presentation/manager/your_booking_cubit/your_booking_cubit.dart';
import 'package:weisro/feature/profile/presentation/view/widgets/user_posts_list_view_shimmer.dart';
import 'package:weisro/generated/l10n.dart';

import '../widgets/your_booking_list.dart';

class YourBookingPageViewBody extends StatefulWidget {
  const YourBookingPageViewBody({super.key});

  @override
  State<YourBookingPageViewBody> createState() =>
      _YourBookingPageViewBodyState();
}

class _YourBookingPageViewBodyState extends State<YourBookingPageViewBody> {
  late final ScrollController _scrollController;

  var nextPage = 2;

  var isLoading = false;
  bool hasNext = true;
  @override
  void initState() {
    super.initState();
    _scrollController = ScrollController();
    _scrollController.addListener(_scrollListener);
  }

  void _scrollListener() async {
    var currentPositions = _scrollController.position.pixels;
    var maxScrollLength = _scrollController.position.maxScrollExtent;
    if (currentPositions >= 0.5 * maxScrollLength) {
      if (!isLoading && hasNext) {
        isLoading = true;
        await BlocProvider.of<YourBookingCubit>(context)
            .getAllYourBooking(pageNumber: nextPage++);
        isLoading = false;
      }
    }
  }

  List<Docs> allBooking = [];

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      controller: _scrollController,
      child: Column(
        children: [
          24.kh,
          Padding(
            padding: HelperFunctions.symmetricHorizontalPadding24,
            child: Text(
              S.of(context).Your_Booking,
              style: AppStyles.style18w500Grey(context),
            ),
          ),
          20.kh,
          BlocConsumer<YourBookingCubit, YourBookingState>(
            listener: (context, yourBookingState) {
              if (yourBookingState is YourBookingSuccess) {
                allBooking.addAll(yourBookingState.bookingModel.docs ?? []);
              }
            },
            builder: (context, yourBookingState) {
              if (yourBookingState is YourBookingLoading) {
                return Padding(
                  padding: HelperFunctions.symmetricHorizontalPadding24,
                  child: const UserPostsListViewShimmer(),
                );
              } else if (yourBookingState is YourBookingPaginationFailures ||
                  yourBookingState is YourBookingSuccess ||
                  yourBookingState is YourBookingPaginationLoading) {
                return Padding(
                  padding: HelperFunctions.symmetricHorizontalPadding24,
                  child: YourBookingList(
                    allBooking: allBooking,
                  ),
                );
              } else {
                return const CustomErrorWidgets();
              }
            },
          )
        ],
      ),
    );
  }
}
