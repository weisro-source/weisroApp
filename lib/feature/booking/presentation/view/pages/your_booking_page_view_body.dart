import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:weisro/core/assets_path/image_path.dart';
import 'package:weisro/core/styles/app_color.dart';
import 'package:weisro/core/styles/app_style.dart';
import 'package:weisro/core/utils/helper_functions.dart';
import 'package:weisro/core/utils/sized_box_extension.dart';
import 'package:weisro/feature/booking/data/models/your_booking_model.dart';
import 'package:weisro/feature/booking/presentation/manager/your_booking_cubit/your_booking_cubit.dart';
import 'package:weisro/feature/booking/presentation/view/pages/receive_page_view.dart';
import 'package:weisro/feature/profile/presentation/view/widgets/user_posts_list_view_shimmer.dart';
import 'package:weisro/generated/l10n.dart';

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
                return GestureDetector(
                  onTap: () => HelperFunctions.navigateToScreen(
                    context,
                    (context) => const ReceivePageView(),
                  ),
                  child: Container(
                    height: 100,
                    decoration: BoxDecoration(
                      borderRadius: const BorderRadius.all(Radius.circular(8)),
                      border:
                          Border.all(color: AppColors.orangeColor, width: 1),
                    ),
                    child: Row(
                      children: [
                        20.kw,
                        CachedNetworkImage(
                          imageUrl: "",
                          errorWidget: (context, url, error) {
                            return Image.asset(ImagePath.imagesService);
                          },
                        ),
                        20.kw,
                        Column(
                          mainAxisAlignment: MainAxisAlignment.start,
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            20.kh,
                            Text(
                              S.of(context).ID,
                              style: AppStyles.style12w400Second2(context),
                            ),
                            10.kh,
                            Text(
                              S.of(context).Total_Price,
                              style: AppStyles.style12w400Second2(context),
                            ),
                            10.kh,
                            Text(
                              S.of(context).Payment_Method,
                              style: AppStyles.style12w400Second2(context),
                            ),
                          ],
                        )
                      ],
                    ),
                  ),
                );
              }
            },
          )
        ],
      ),
    );
  }
}

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

        return Container(
          height: 100,
          decoration: BoxDecoration(
            borderRadius: const BorderRadius.all(Radius.circular(8)),
            border: Border.all(color: AppColors.orangeColor, width: 1),
          ),
          child: Row(
            children: [
              20.kw,
              CachedNetworkImage(
                imageUrl: "",
                errorWidget: (context, url, error) {
                  return Image.asset(ImagePath.imagesService);
                },
              ),
              20.kw,
              Column(
                mainAxisAlignment: MainAxisAlignment.start,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  20.kh,
                  Text(
                    "${S.of(context).ID} ${booking.id ?? ""}",
                    style: AppStyles.style12w400Second2(context),
                  ),
                  10.kh,
                  Text(
                    "${S.of(context).Total_Price} ${booking.totalPrice ?? ""}",
                    style: AppStyles.style12w400Second2(context),
                  ),
                  10.kh,
                  Text(
                    "${S.of(context).Payment_Method} ${booking.paymentMethod ?? ""}",
                    style: AppStyles.style12w400Second2(context),
                  ),
                ],
              )
            ],
          ),
        );
      },
    );
  }
}
