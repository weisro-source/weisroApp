import 'package:flutter/material.dart';
import 'package:weisro/core/styles/app_color.dart';
import 'package:weisro/core/styles/app_style.dart';
import 'package:weisro/core/styles/style_functions.dart';
import 'package:weisro/core/utils/helper_functions.dart';
import 'package:weisro/core/utils/sized_box_extension.dart';
import 'package:weisro/core/widgets/ad_widget_in_details.dart';
import 'package:weisro/core/widgets/app_button.dart';
import 'package:weisro/core/widgets/custom_app_bar.dart';
import 'package:weisro/core/widgets/location_price_row_widget.dart';
import 'package:weisro/core/widgets/service_name_row_widget.dart';
import 'package:weisro/feature/onboarding/presentation/view/widgets/page_indicator_widget.dart';
import 'package:weisro/feature/worker/presentation/view/pages/book_worker_page_view.dart';
import 'package:weisro/generated/l10n.dart';
import '../../../../../core/widgets/image_list_in_details_page.dart';

class WorkerDetailsPageViewBody extends StatefulWidget {
  const WorkerDetailsPageViewBody({super.key});

  @override
  State<WorkerDetailsPageViewBody> createState() =>
      _WorkerDetailsPageViewBodyState();
}

class _WorkerDetailsPageViewBodyState extends State<WorkerDetailsPageViewBody> {
  final PageController pageController = PageController();

  @override
  Widget build(BuildContext context) {
    return CustomScrollView(
      slivers: [
        CustomAppBar(title: S.of(context).Worker_Details),
        SliverToBoxAdapter(
          child: Column(
            children: [
              Padding(
                padding: const EdgeInsetsDirectional.symmetric(horizontal: 24),
                child: ImageListInDetailsPage(
                  pageController: pageController,
                  imageList: const [],
                ),
              ),
              15.kh,
              PageIndicatorWidget(controller: pageController, count: 4),
              22.kh,
              ServiceNameRowWidget(
                serviceName: "Name Worker",
                onFavPressed: () {
                  // Add your logic for favorite button
                },
                onSharePressed: () {
                  // Add your logic for share button
                },
              ),
              15.kh,
              const LocationPriceRowWidget(price: "38 Years"),
              15.kh,
              Padding(
                padding: HelperFunctions.symmetricHorizontalPadding24,
                child: Align(
                  alignment: AlignmentDirectional.topStart,
                  child: Text(
                    S.of(context).Description,
                    style: AppStyles.style14w500Grey(context),
                  ),
                ),
              ),
              5.kh,
              Padding(
                padding: HelperFunctions.symmetricHorizontalPadding24,
                child: Text(
                    "This worker has over 15 years of experience in their field, providing high-quality service with a focus on customer satisfaction. Known for their professionalism and dedication, they are highly sought after in their industry. Whether you need specialized expertise or general assistance, they are ready to exceed expectations.",
                    style: AppStyles.style14w400Grey(context)),
              ),
              20.kh,
              Padding(
                padding: HelperFunctions.symmetricHorizontalPadding24,
                child: const AdWidgetInDetails(),
              ),
              24.kh,
              Padding(
                  padding: HelperFunctions.symmetricHorizontalPadding24,
                  child: Align(
                    alignment: AlignmentDirectional.topStart,
                    child: Text(
                      S.of(context).Services_provided,
                      style: AppStyles.style14w500Grey(context),
                    ),
                  )),
              10.kh,
            ],
          ),
        ),
        SliverPadding(
          padding: HelperFunctions.symmetricHorizontalPadding24,
          sliver: SliverGrid.builder(
            itemCount: 4,
            gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                crossAxisCount: 2,
                childAspectRatio: 166 / 31,
                mainAxisSpacing: 10,
                crossAxisSpacing: 10),
            itemBuilder: (context, index) {
              return Container(
                decoration: StyleFunctions.decorationRadius8Orange(),
                child: Row(
                  children: [
                    16.kw,
                    Container(
                      width: 11,
                      height: 11,
                      decoration: ShapeDecoration(
                        color: AppColors.orangeColor,
                        shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(1)),
                      ),
                    ),
                    8.kw,
                    Text(
                      "indoor cleaning ",
                      style: AppStyles.style12w400Grey(context),
                    ),
                  ],
                ),
              );
            },
          ),
        ),
        SliverToBoxAdapter(
          child: 36.kh,
        ),
        SliverToBoxAdapter(
          child: Row(
            children: [
              24.kw,
              Container(
                width: 88,
                height: 32,
                decoration: ShapeDecoration(
                  color: AppColors.whiteColor,
                  shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(4)),
                  shadows: const [
                    BoxShadow(
                      color: AppColors.shadow2Color,
                      blurRadius: 4,
                      offset: Offset(0, 0),
                      spreadRadius: 0,
                    ),
                  ],
                ),
                child: Center(
                  child: Text(
                    "5000",
                    style: AppStyles.style14w500Orange(context),
                  ),
                ),
              ),
              19.kw,
              Expanded(
                child: AppButton(
                  onPressed: () {
                    HelperFunctions.navigateToScreen(
                      context,
                      (context) => const BookWorkerPageView(),
                    );
                  },
                  text: S.of(context).Book_Now,
                ),
              ),
              24.kw,
            ],
          ),
        ),
        SliverToBoxAdapter(
          child: 36.kh,
        ),
      ],
    );
  }
}
