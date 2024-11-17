import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:weisro/core/assets_path/icons_path.dart';
import 'package:weisro/core/assets_path/image_path.dart';
import 'package:weisro/core/styles/app_color.dart';
import 'package:weisro/core/styles/app_style.dart';
import 'package:weisro/core/utils/helper_functions.dart';
import 'package:weisro/core/utils/sized_box_extension.dart';
import 'package:weisro/generated/l10n.dart';
import '../widgets/advertisement_widget.dart';
import '../widgets/category_list_view.dart';
import '../widgets/search_bar.dart' as search;
import '../widgets/title_section_in_home_page.dart';

class HomePageViewBody extends StatelessWidget {
  const HomePageViewBody({super.key});

  @override
  Widget build(BuildContext context) {
    final List<String> locations = [
      "All",
      "October",
      "New Cairo",
      "Zamalek",
      "Maadi"
    ];
    String selectedLocation = "All";
    return CustomScrollView(
      slivers: [
        const SliverToBoxAdapter(
          child: AdvertisementWidget(),
        ),
        SliverToBoxAdapter(
          child: 28.kh,
        ),
        const SliverToBoxAdapter(
          child: search.SearchBar(),
        ),
        SliverToBoxAdapter(
          child: 23.kh,
        ),
        SliverPadding(
          padding: HelperFunctions.symmetricHorizontalPadding24,
          sliver: SliverToBoxAdapter(
            child: TitleSectionInHomePage(
              title: S.of(context).Our_Categories,
              iconPath: IconsPath.iconsCategory,
            ),
          ),
        ),
        SliverToBoxAdapter(
          child: 13.kh,
        ),
        const SliverToBoxAdapter(
          child: CategoryListView(),
        ),
        SliverToBoxAdapter(
          child: 35.kh,
        ),
        SliverPadding(
          padding: HelperFunctions.symmetricHorizontalPadding24,
          sliver: SliverToBoxAdapter(
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                TitleSectionInHomePage(
                  title: S.of(context).Latest_rental_services,
                  iconPath: IconsPath.iconsNew,
                ),
                SizedBox(
                  height: 25,
                  width: 150,
                  child: DropdownButtonFormField<String>(
                    value: selectedLocation,
                    items: locations.map((location) {
                      return DropdownMenuItem(
                        value: location,
                        child: Text(
                          location,
                          style: AppStyles.style10w400Grey(context),
                        ),
                      );
                    }).toList(),
                    onChanged: (newValue) {
                      // Handle selection changes
                    },
                    decoration: InputDecoration(
                      prefixIcon: SvgPicture.asset(
                        fit: BoxFit.scaleDown,
                        height: 9,
                        width: 9,
                        IconsPath.iconsLocation,
                        color: AppColors.orangeColor,
                      ),
                      fillColor: AppColors.second1Color,
                      filled: true,
                      enabledBorder: OutlineInputBorder(
                        borderSide: const BorderSide(
                            color: AppColors.whiteColor, width: 2),
                        borderRadius: BorderRadius.circular(2),
                      ),
                      focusedBorder: OutlineInputBorder(
                        borderSide: const BorderSide(
                            color: AppColors.whiteColor, width: 2),
                        borderRadius: BorderRadius.circular(2),
                      ),
                      errorBorder: OutlineInputBorder(
                        borderSide: const BorderSide(
                            color: AppColors.whiteColor, width: 2),
                        borderRadius: BorderRadius.circular(2),
                      ),
                      disabledBorder: OutlineInputBorder(
                        borderSide: const BorderSide(
                            color: AppColors.whiteColor, width: 2),
                        borderRadius: BorderRadius.circular(2),
                      ),
                      contentPadding: const EdgeInsets.symmetric(horizontal: 8),
                    ),
                  ),
                )
              ],
            ),
          ),
        ),
        SliverToBoxAdapter(
          child: 10.kh,
        ),
        SliverPadding(
          padding: HelperFunctions.symmetricHorizontalPadding24,
          sliver: SliverGrid.builder(
            itemCount: 5,
            gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                childAspectRatio: 172 / 162,
                crossAxisSpacing: 10,
                mainAxisSpacing: 20,
                crossAxisCount: 2),
            itemBuilder: (context, index) {
              return Container(
                height: 162,
                width: 172,
                decoration: const BoxDecoration(
                    borderRadius: BorderRadius.all(Radius.circular(4)),
                    image: DecorationImage(
                        fit: BoxFit.cover,
                        image: AssetImage(ImagePath.imagesService))),
                child: Column(
                  children: [
                    Align(
                      alignment: AlignmentDirectional.topEnd,
                      child: Padding(
                        padding:
                            const EdgeInsetsDirectional.only(top: 10, end: 10),
                        child: InkWell(
                          onTap: () {},
                          child: Container(
                              width: 20,
                              height: 20,
                              decoration: const ShapeDecoration(
                                  shape: CircleBorder(
                                      side: BorderSide(
                                          color: AppColors.orangeColor)),
                                  color: AppColors.whiteColor),
                              child: Center(
                                  child: SvgPicture.asset(
                                      IconsPath.iconsFavService))),
                        ),
                      ),
                    ),
                    const Spacer(),
                    Container(
                      height: 22,
                      decoration: BoxDecoration(
                        color: AppColors.whiteColor,
                        borderRadius:
                            BorderRadius.circular(4), // Add border radius here
                        boxShadow: const [
                          BoxShadow(
                            color: AppColors.orangeColor,
                            offset: Offset(0, 2),
                            blurRadius: 0,
                            spreadRadius: 0,
                          ),
                        ],
                      ),
                      child: Row(
                        children: [
                          10.kw,
                          Text(
                            "\$530  ST",
                            style: AppStyles.style10w500Red(context),
                          ),
                          const Spacer(),
                          Row(
                            children: [
                              SvgPicture.asset(IconsPath.iconsLocation),
                              Text(
                                "October ,3322",
                                style: AppStyles.style8w400Grey2(context)
                                    .copyWith(color: AppColors.greyColor),
                              ),
                              7.kw,
                            ],
                          ),
                        ],
                      ),
                    )
                  ],
                ),
              );
            },
          ),
        ),
        SliverToBoxAdapter(
          child: 114.kh,
        ),
      ],
    );
  }
}
