import 'package:flutter/material.dart';
import 'package:weisro/core/assets_path/icons_path.dart';
import 'package:weisro/core/styles/app_color.dart';
import 'package:weisro/core/styles/app_style.dart';
import 'package:weisro/core/styles/style_functions.dart';

import 'package:weisro/core/utils/helper_functions.dart';
import 'package:weisro/core/utils/sized_box_extension.dart';
import 'package:weisro/core/widgets/app_button.dart';
import 'package:weisro/core/widgets/custom_app_bar.dart';
import 'package:weisro/core/widgets/custom_text_form_filed.dart';
import 'package:weisro/core/widgets/days_list.dart';
import 'package:weisro/feature/auth/register/presentation/view/widgets/question_widget.dart';
import 'package:weisro/feature/home/presentation/view/widgets/location_flitter_drop_down.dart';
import 'package:weisro/feature/services/presentation/view/widgets/rent_widget.dart';
import 'package:weisro/generated/l10n.dart';

import '../widgets/rent_time.dart';
import '../widgets/upload_container.dart';

class CreateServicePageViewBody extends StatefulWidget {
  const CreateServicePageViewBody({super.key});

  @override
  State<CreateServicePageViewBody> createState() =>
      _CreateServicePageViewBodyState();
}

class _CreateServicePageViewBodyState extends State<CreateServicePageViewBody> {
  final List<String> locations = [
    "All",
    "October",
    "New Cairo",
    "Zamalek",
    "Maadi"
  ];
  String selectedLocation = "All";
  @override
  Widget build(BuildContext context) {
    return CustomScrollView(
      slivers: [
        CustomAppBar(title: S.of(context).Create_A_Product),
        const SliverToBoxAdapter(
          child: UploadContainer(),
        ),
        SliverToBoxAdapter(child: 34.kh),
        SliverPadding(
          padding: HelperFunctions.symmetricHorizontalPadding24,
          sliver: SliverToBoxAdapter(
            child: LocationFlitterDropDown(
              fillColor: AppColors.whiteColor,
              borderColor: AppColors.orangeColor,
              iconColor: AppColors.greyColor,
              height: 38,
              borderWidth: 1,
              borderRadius: 8,
              selectedLocation: selectedLocation,
              locations: locations,
            ),
          ),
        ),
        SliverToBoxAdapter(child: 16.kh),
        SliverPadding(
          padding: HelperFunctions.symmetricHorizontalPadding24,
          sliver: SliverToBoxAdapter(
            child: LocationFlitterDropDown(
              fillColor: AppColors.whiteColor,
              borderColor: AppColors.orangeColor,
              iconColor: AppColors.greyColor,
              height: 38,
              iconHeight: 24,
              iconWidth: 24,
              borderWidth: 1,
              borderRadius: 8,
              selectedLocation: selectedLocation,
              locations: locations,
              prefixIcon: IconsPath.iconsCategory,
            ),
          ),
        ),
        SliverToBoxAdapter(child: 29.kh),
        SliverPadding(
            padding: HelperFunctions.symmetricHorizontalPadding24,
            sliver: SliverToBoxAdapter(
              child: QuestionWidget(
                icon: IconsPath.iconsFavTime,
                questionText: S.of(context).How_Do_You_Want_Your_Services,
              ),
            )),
        SliverToBoxAdapter(child: 10.kh),
        const SliverToBoxAdapter(child: RentTime()),
        SliverToBoxAdapter(child: 30.kh),
        SliverToBoxAdapter(
          child: Row(
            children: [
              24.kw,
              Expanded(
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.start,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    QuestionWidget(
                        icon: IconsPath.iconsTime,
                        questionText: S.of(context).Rent_per_day),
                    9.kh,
                    Container(
                      width: 148,
                      height: 32,
                      decoration: StyleFunctions.decorationRadius8Orange(),
                      padding:
                          const EdgeInsetsDirectional.only(top: 4, start: 10),
                      child: Text(
                        "\$234",
                        style: AppStyles.style14w400Grey(context),
                      ),
                    )
                  ],
                ),
              ),
              Expanded(
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.start,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    QuestionWidget(
                        icon: IconsPath.iconsTime,
                        questionText: S.of(context).Rent_per_day),
                    9.kh,
                    Container(
                      width: 148,
                      height: 32,
                      decoration: StyleFunctions.decorationRadius8Orange(),
                      padding:
                          const EdgeInsetsDirectional.only(top: 4, start: 10),
                      child: Text(
                        "\$234",
                        style: AppStyles.style14w400Grey(context),
                      ),
                    )
                  ],
                ),
              ),
            ],
          ),
        ),
        SliverToBoxAdapter(child: 30.kh),
        SliverToBoxAdapter(
          child: Column(
            children: [
              Padding(
                padding: HelperFunctions.symmetricHorizontalPadding24,
                child: QuestionWidget(
                    icon: IconsPath.iconsTime,
                    questionText: S.of(context).Rent_per_day),
              ),
              10.kh,
              Row(
                children: [
                  25.kw,
                  const Expanded(
                    child: RentWidget(
                      rentTime: "12:09 pm",
                    ),
                  ),
                  15.kw,
                  Text(
                    S.of(context).To,
                    style: AppStyles.style14w400Grey(context),
                  ),
                  15.kw,
                  const Expanded(
                    child: RentWidget(
                      rentTime: "12:09 pm",
                    ),
                  ),
                  25.kw,
                ],
              ),
            ],
          ),
        ),
        SliverToBoxAdapter(child: 30.kh),
        SliverPadding(
          padding: HelperFunctions.symmetricHorizontalPadding24,
          sliver: SliverToBoxAdapter(
              child: QuestionWidget(
                  icon: IconsPath.iconsCalender,
                  questionText: S.of(context).Available_Rental_Days)),
        ),
        SliverToBoxAdapter(child: 20.kh),
        SliverPadding(
            padding: HelperFunctions.symmetricHorizontalPadding24,
            sliver: const DaysList()),
        SliverToBoxAdapter(child: 40.kh),
        SliverPadding(
          padding: HelperFunctions.symmetricHorizontalPadding24,
          sliver: SliverToBoxAdapter(
              child: QuestionWidget(
                  icon: IconsPath.iconsBook,
                  questionText: S.of(context).Write_Description_Service)),
        ),
        SliverToBoxAdapter(child: 20.kh),
        SliverPadding(
          padding: HelperFunctions.symmetricHorizontalPadding24,
          sliver: const SliverToBoxAdapter(
            child: CustomTextFormFiled(
              hintText: "",
              maxLines: 4,
              minLines: 4,
              topPadding: 15,
            ),
          ),
        ),
        SliverToBoxAdapter(child: 40.kh),
        SliverPadding(
          padding: HelperFunctions.symmetricHorizontalPadding24,  
          sliver: SliverToBoxAdapter(
            child: AppButton(
              onPressed: () {},
              text: S.of(context).Conformation,
            ),
          ),
        ),
        SliverToBoxAdapter(child: 28.kh),
      ],
    );
  }
}
