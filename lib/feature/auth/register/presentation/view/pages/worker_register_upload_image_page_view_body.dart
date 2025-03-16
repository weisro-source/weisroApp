import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_svg/svg.dart';
import 'package:shimmer/shimmer.dart';
import 'package:weisro/core/assets_path/icons_path.dart';
import 'package:weisro/core/styles/app_color.dart';
import 'package:weisro/core/styles/app_style.dart';
import 'package:weisro/core/utils/helper_functions.dart';
import 'package:weisro/core/utils/sized_box_extension.dart';
import 'package:weisro/core/widgets/custom_text_form_filed.dart';
import 'package:weisro/core/widgets/logo_image_widget.dart';
import 'package:weisro/core/widgets/new_app_button.dart';
import 'package:weisro/feature/auth/register/presentation/manager/get_all_worker_tags_cubit/get_all_worker_tags_cubit.dart';
import 'package:weisro/feature/auth/register/presentation/manager/register_cubit/register_cubit.dart';
import 'package:weisro/feature/auth/register/presentation/view/widgets/labeled_border_box.dart';
import 'package:weisro/feature/auth/register/presentation/view/widgets/question_widget.dart';
import 'package:weisro/generated/l10n.dart';

import '../widgets/note_widget.dart';
import '../widgets/uploader_container_widget.dart';

class WorkerRegisterUploadImagePageViewBody extends StatelessWidget {
  const WorkerRegisterUploadImagePageViewBody({super.key});

  @override
  Widget build(BuildContext context) {
    RegisterCubit registerCubit = RegisterCubit.get(context);
    return Padding(
      padding: const EdgeInsetsDirectional.symmetric(horizontal: 24),
      child: CustomScrollView(
        slivers: [
          SliverToBoxAdapter(
            child: 35.kh,
          ),
          const SliverToBoxAdapter(
            child: Align(
              alignment: AlignmentDirectional.topStart,
              child: LogoImageWidget(),
            ),
          ),
          SliverToBoxAdapter(
            child: 23.kh,
          ),
          LabeledBorderBox(label: S.of(context).Create_Worker_Account),
          SliverToBoxAdapter(
            child: 37.kh,
          ),
          SliverToBoxAdapter(
              child:
                  SvgPicture.asset(IconsPath.iconsWorkerRegisterImageUploader)),
          SliverToBoxAdapter(
            child: 37.kh,
          ),
          SliverToBoxAdapter(
            child: QuestionWidget(
                icon: IconsPath.iconsServices,
                questionText: S.of(context).Select_Services),
          ),
          SliverToBoxAdapter(
            child: 10.kh,
          ),
          // SliverToBoxAdapter(
          //   child: Padding(
          //     padding: const EdgeInsetsDirectional.only(start: 28),
          //     child: CustomTextFormFiled(
          //       hintText: "",
          //       controller: registerCubit.serviceController,
          //       focusNode: registerCubit.serviceFocusNode,
          //       borderColor: AppColors.orangeColor,
          //       onFieldSubmitted: (p0) => HelperFunctions.requestNextFocus(
          //           registerCubit.serviceFocusNode,
          //           registerCubit.descriptionFocusNode,
          //           context),
          //     ),
          //   ),
          // ),
          // SliverToBoxAdapter(
          //   child: BlocBuilder<GetAllWorkerTagsCubit, GetAllWorkerTagsState>(
          //     builder: (context, getAllWorkerTagsState) {
          //       if (getAllWorkerTagsState is GetAllWorkerTagsLoading) {
          //         return const LoadingFiled();
          //       } else if (getAllWorkerTagsState is GetAllWorkerTagsSuccess) {
          //         return Padding(
          //           padding: const EdgeInsets.symmetric(horizontal: 24),
          //           child: WorkerTagsDropDown(
          //               allTags: getAllWorkerTagsState.allTags.docs ?? []),
          //         );
          //       } else {
          //         return const SizedBox();
          //       }
          //     },
          //   ),
          // ),
          BlocBuilder<GetAllWorkerTagsCubit, GetAllWorkerTagsState>(
            builder: (context, workerTagState) {
              final workerCubit = GetAllWorkerTagsCubit.get(context);

              if (workerTagState is GetAllWorkerTagsSuccess) {
                return SliverGrid.builder(
                  gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                    crossAxisCount: 2,
                    mainAxisSpacing: 10,
                    crossAxisSpacing: 13,
                    childAspectRatio: 171 / 40,
                  ),
                  itemCount: workerTagState.allTags.docs?.length,
                  itemBuilder: (context, index) {
                    final tag = workerTagState.allTags.docs?[index];
                    final bool isSelected =
                        workerCubit.selectedTags.contains(tag);

                    return GestureDetector(
                      onTap: () {
                        workerCubit.toggleTagSelection(tag!);
                      },
                      child: AnimatedContainer(
                        duration: const Duration(milliseconds: 100),
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(20),
                          border: Border.all(
                            color: AppColors.orangeColor,
                          ),
                          color:
                              isSelected ? AppColors.orangeColor : Colors.white,
                        ),
                        child: Center(
                          child: Text(tag?.name ?? "",
                              style: AppStyles.style14w400Orange(context)
                                  .copyWith(
                                      color: isSelected
                                          ? AppColors.whiteColor
                                          : Colors.black)
                              // TextStyle(
                              //   color: isSelected ? Colors.orange : Colors.black,
                              //   fontWeight: FontWeight.w600,
                              // ),
                              ),
                        ),
                      ),
                    );
                  },
                );
              } else if (workerTagState is GetAllWorkerTagsLoading) {
                return SliverGrid.builder(
                  gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                    crossAxisCount: 2,
                    mainAxisSpacing: 10,
                    crossAxisSpacing: 13,
                    childAspectRatio: 171 / 40,
                  ),
                  itemCount: 5,
                  itemBuilder: (context, index) {
                    return Shimmer.fromColors(
                      baseColor: AppColors.shimmerBaseColor,
                      highlightColor: AppColors.shimmerHighlightColor,
                      child: Container(
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(20),
                          border: Border.all(color: AppColors.orangeColor),
                        ),
                        child: Center(
                          child: Shimmer.fromColors(
                            baseColor: AppColors.shimmerBaseColor,
                            highlightColor: AppColors.shimmerHighlightColor,
                            child: Text(
                              "xxx",
                              style: AppStyles.style18w500Green(context),
                            ),
                          ),
                        ),
                      ),
                    );
                  },
                );
              } else {
                return const SizedBox.shrink();
              }
            },
          ),

          SliverToBoxAdapter(
            child: 32.kh,
          ),
          SliverToBoxAdapter(
            child: QuestionWidget(
                icon: IconsPath.iconsTaskListMenu,
                questionText: S.of(context).Describe_Services),
          ),
          SliverToBoxAdapter(
            child: 10.kh,
          ),
          SliverToBoxAdapter(
            child: Padding(
              padding: const EdgeInsetsDirectional.only(start: 10),
              child: CustomTextFormFiled(
                hintText: "",
                borderRadius: 20,
                borderColor: AppColors.orangeColor,
                controller: registerCubit.descriptionController,
                focusNode: registerCubit.descriptionFocusNode,
                maxLines: 5,
                minLines: 5,
                height: null,
                topPadding: 8,
                onFieldSubmitted: (p0) => HelperFunctions.requestNextFocus(
                    registerCubit.descriptionFocusNode,
                    registerCubit.costPerHourFocusNode,
                    context),
              ),
            ),
          ),
          SliverToBoxAdapter(
            child: 10.kh,
          ),
          NoteWidget(note: S.of(context).No_Addresses),
          SliverToBoxAdapter(
            child: 32.kh,
          ),
          SliverToBoxAdapter(
            child: QuestionWidget(
                icon: IconsPath.iconsTimeIsMoneyClock,
                questionText: S.of(context).Hourly_Rate),
          ),
          SliverToBoxAdapter(
            child: 10.kh,
          ),
          SliverToBoxAdapter(
            child: Padding(
              padding: const EdgeInsetsDirectional.only(start: 10),
              child: CustomTextFormFiled(
                controller: registerCubit.costPerHourController,
                focusNode: registerCubit.costPerHourFocusNode,
                keyboardType: TextInputType.phone,
                hintText: "",
                borderColor: AppColors.orangeColor,
                borderRadius: 20,
              ),
            ),
          ),
          SliverToBoxAdapter(
            child: 10.kh,
          ),
          NoteWidget(note: S.of(context).Hourly_Rate_Note),
          SliverToBoxAdapter(
            child: 32.kh,
          ),
          SliverToBoxAdapter(
            child: QuestionWidget(
                icon: IconsPath.iconsVerify,
                questionText: S.of(context).Document_Verification),
          ),
          SliverToBoxAdapter(
            child: 12.kh,
          ),
          SliverToBoxAdapter(
            child: Padding(
              padding: const EdgeInsetsDirectional.only(start: 28),
              child: UploaderContainerWidget(
                isMultiPick: true,
                isForId: true,
                hintText:
                    "${S.of(context).Passport} , ${S.of(context).Identity} , ${S.of(context).Accommodation} , ${S.of(context).Drivers_License}",
              ),
            ),
          ),
          SliverToBoxAdapter(
            child: 10.kh,
          ),
          NoteWidget(note: S.of(context).Document_Note),
          SliverToBoxAdapter(
            child: 32.kh,
          ),
          SliverToBoxAdapter(
            child: QuestionWidget(
                icon: IconsPath.iconsProfile,
                questionText: S.of(context).Upload_Profile_Picture),
          ),
          SliverToBoxAdapter(
            child: 10.kh,
          ),
          SliverToBoxAdapter(
            child: Padding(
              padding: const EdgeInsetsDirectional.only(start: 28),
              child: UploaderContainerWidget(
                  isMultiPick: false,
                  isForId: false,
                  hintText: S.of(context).Profile_Image_Shaping),
            ),
          ),
          SliverToBoxAdapter(
            child: 32.kh,
          ),
          SliverToBoxAdapter(
            child: QuestionWidget(
                icon: IconsPath.iconsProfile,
                questionText: S.of(context).Upload_Images_For_Your_Work),
          ),
          SliverToBoxAdapter(
            child: 10.kh,
          ),
          SliverToBoxAdapter(
            child: Padding(
              padding: const EdgeInsetsDirectional.only(start: 28),
              child: UploaderContainerWidget(
                  isMultiPick: true,
                  isForId: false,
                  hintText: S.of(context).Upload_Images_For_Your_Work),
            ),
          ),
          SliverToBoxAdapter(
            child: 40.kh,
          ),
          SliverToBoxAdapter(
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Expanded(
                  child: NewAppButton(
                    onPressed: () {
                      HelperFunctions.navigateToBack(context);
                    },
                    buttonColor: AppColors.redColor,
                    borderColor: AppColors.redColor,
                    titleColor: AppColors.whiteColor,
                    height: 32,
                    width: 151,
                    title: S.of(context).Cancel,
                  ),
                ),
                12.kw,
                Expanded(
                  child: NewAppButton(
                    onPressed: () async {
                      await registerCubit.registerWorker(context);
                    },
                    buttonColor: AppColors.orangeColor,
                    titleColor: AppColors.whiteColor,
                    borderColor: AppColors.orangeColor,
                    height: 32,
                    width: 151,
                    title: S.of(context).Send_And_Wait,
                    textStyle: AppStyles.style14w500White(context),
                  ),
                ),
              ],
            ),
          ),
          SliverToBoxAdapter(
            child: 42.kh,
          )
        ],
      ),
    );
  }
}
