import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:weisro/core/assets_path/icons_path.dart';
import 'package:weisro/core/styles/app_color.dart';

import 'package:weisro/core/utils/helper_functions.dart';
import 'package:weisro/core/utils/sized_box_extension.dart';
import 'package:weisro/core/widgets/app_button.dart';
import 'package:weisro/core/widgets/custom_app_bar.dart';
import 'package:weisro/core/widgets/custom_dialog.dart';
import 'package:weisro/core/widgets/custom_text_form_filed.dart';
import 'package:weisro/core/widgets/days_list.dart';
import 'package:weisro/feature/auth/data/worker_time.dart';
import 'package:weisro/feature/auth/register/presentation/manager/get_cities_of_a_specified_country_cubit/get_cities_of_a_specified_country_cubit.dart';
import 'package:weisro/feature/auth/register/presentation/manager/worker_day_cubit.dart';
import 'package:weisro/feature/auth/register/presentation/view/widgets/question_widget.dart';
import 'package:weisro/feature/home/presentation/managers/categories_cubit/categories_cubit.dart';
import 'package:weisro/feature/home/presentation/view/widgets/location_flitter_drop_down.dart';
import 'package:weisro/feature/services/presentation/managers/add_service_cubit/add_service_cubit.dart';
import 'package:weisro/feature/services/presentation/managers/service_day_cubit.dart';
import 'package:weisro/feature/services/presentation/view/pages/service_review_page_view.dart';
import 'package:weisro/generated/l10n.dart';

import '../widgets/price_for_service.dart';
import '../widgets/rent_time.dart';
import '../widgets/selected_time_for_create_service.dart';
import '../widgets/service_day_list.dart';
import '../widgets/upload_container.dart';

class CreateServicePageViewBody extends StatefulWidget {
  const CreateServicePageViewBody({super.key});

  @override
  State<CreateServicePageViewBody> createState() =>
      _CreateServicePageViewBodyState();
}

class _CreateServicePageViewBodyState extends State<CreateServicePageViewBody> {
  @override
  void initState() {
    BlocProvider.of<WorkerDayCubit>(context).state.clear();
    super.initState();
  }

  void _setAllDays(TimeOfDay? startTime, TimeOfDay? endTime) {
    final cubit = context.read<ServiceDayCubit>();
    final days = WorkerTime.daysSelected(context).keys;

    for (final day in days) {
      cubit.updateTime(day, startTime, endTime);
    }
  }

  void _set24x7Mode() {
    _setAllDays(const TimeOfDay(hour: 0, minute: 0),
        const TimeOfDay(hour: 23, minute: 59));
  }

  @override
  Widget build(BuildContext context) {
    AddServiceCubit addServiceCubit = AddServiceCubit.get(context);
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
            child: SizedBox(
              height: 38,
              child: CustomTextFormFiled(
                hintText: S.of(context).Service_Name,
                controller: addServiceCubit.serviceNameController,
                keyboardType: TextInputType.name,
                borderColor: AppColors.orangeColor,
                borderRadius: 8,
              ),
            ),
          ),
        ),
        SliverToBoxAdapter(child: 16.kh),
        SliverPadding(
          padding: HelperFunctions.symmetricHorizontalPadding24,
          sliver: SliverToBoxAdapter(
            child: BlocBuilder<GetCitiesOfASpecifiedCountryCubit,
                GetCitiesOfASpecifiedCountryState>(
              builder: (context, state) {
                if (state is GetCitiesOfASpecifiedCountrySuccess) {
                  List<String> cityNameList =
                      state.cities.cities.map((e) => e.name).toList();
                  String firstCity = cityNameList.first;

                  return LocationFlitterDropDown(
                    fillColor: AppColors.whiteColor,
                    borderColor: AppColors.orangeColor,
                    iconColor: AppColors.greyColor,
                    height: 38,
                    iconHeight: 24,
                    iconWidth: 24,
                    borderWidth: 1,
                    borderRadius: 8,
                    selectedLocation: firstCity,
                    locations: cityNameList,
                    prefixIcon: IconsPath.iconsLocation,
                    onChanged: (selectedCategory) {},
                  );
                } else {
                  return const SizedBox();
                }
              },
            ),
          ),
        ),
        SliverToBoxAdapter(child: 16.kh),
        BlocBuilder<CategoriesCubit, CategoriesState>(
          builder: (context, getServiceCategoriesState) {
            if (getServiceCategoriesState is CategoriesSuccess) {
              final categories = getServiceCategoriesState.categoryModel.docs
                      ?.map((doc) => doc.name ?? '')
                      .toList() ??
                  [];
              final categoryIds = getServiceCategoriesState.categoryModel.docs
                      ?.map((doc) => doc.id ?? '')
                      .toList() ??
                  [];
              addServiceCubit.categoryId =
                  categoryIds.isNotEmpty ? categoryIds.first : null;
              return SliverPadding(
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
                    selectedLocation: categories.first,
                    locations: categories,
                    prefixIcon: IconsPath.iconsCategory,
                    onChanged: (selectedCategory) {
                      final index = categories.indexOf(selectedCategory ?? "");
                      if (index != -1) {
                        addServiceCubit.categoryId = categoryIds[index];
                      }
                    },
                  ),
                ),
              );
            } else {
              return const SliverToBoxAdapter(
                child: SizedBox.shrink(),
              );
            }
          },
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
        const SliverToBoxAdapter(
          child: PriceForService(),
        ),
        SliverToBoxAdapter(child: 30.kh),
        const SliverToBoxAdapter(
          child: SelectedTimeForCreateService(),
        ),
        SliverToBoxAdapter(child: 30.kh),
        SliverPadding(
          padding: HelperFunctions.symmetricHorizontalPadding24,
          sliver: SliverToBoxAdapter(
              child: QuestionWidget(
                  icon: IconsPath.iconsCalender,
                  questionText: S.of(context).Available_Rental_Days)),
        ),
        SliverToBoxAdapter(child: 30.kh),
        SliverPadding(
          padding: HelperFunctions.symmetricHorizontalPadding24,
          sliver: SliverToBoxAdapter(
              child: AppButton(
            text: "24/7",
            onPressed: _set24x7Mode,
          )),
        ),
        SliverToBoxAdapter(child: 20.kh),
        SliverPadding(
            padding: HelperFunctions.symmetricHorizontalPadding24,
            sliver: const ServiceDayList()),
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
          sliver: SliverToBoxAdapter(
            child: CustomTextFormFiled(
              controller: addServiceCubit.descriptionController,
              hintText: "",
              maxLines: 4,
              maxLength: 200,
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
              onPressed: () async {
                // here to storage days list form state ...
                // addServiceCubit.days =
                //     BlocProvider.of<WorkerDayCubit>(context).state;
                if (addServiceCubit.validateInputs(context)) {
                  HelperFunctions.navigateToScreen(
                    context,
                    (context) => BlocProvider.value(
                      value: addServiceCubit,
                      child: ServiceReviewPageView(
                        oneService: addServiceCubit.newService,
                      ),
                    ),
                  );
                  // await addServiceCubit.addServiceCallApi(context);
                } else {
                  CustomDialog.showCustomDialog(
                      context, "", addServiceCubit.errorMessage ?? "");
                }
              },
              text: S.of(context).Conformation,
            ),
          ),
        ),
        SliverToBoxAdapter(child: 28.kh),
      ],
    );
  }
}
