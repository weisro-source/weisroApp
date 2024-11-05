import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:weisro/core/assets_path/icons_path.dart';
import 'package:weisro/core/styles/app_color.dart';
import 'package:weisro/core/styles/app_style.dart';
import 'package:weisro/core/utils/sized_box_extension.dart';
import 'package:weisro/core/widgets/app_button.dart';
import 'package:weisro/core/widgets/custom_text_form_filed.dart';
import 'package:weisro/core/widgets/logo_image_widget.dart';
import 'package:weisro/feature/auth/register/presentation/view/widgets/labeled_border_box.dart';
import 'package:weisro/feature/auth/register/presentation/view/widgets/question_widget.dart';
import 'package:weisro/generated/l10n.dart';

import '../widgets/note_widget.dart';
import '../widgets/uploader_container_widget.dart';

class WorkerRegisterUploadImagePageViewBody extends StatelessWidget {
  const WorkerRegisterUploadImagePageViewBody({super.key});

  @override
  Widget build(BuildContext context) {
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
          const SliverToBoxAdapter(
            child: Padding(
              padding: EdgeInsetsDirectional.only(start: 28),
              child: CustomTextFormFiled(
                hintText: "",
                borderColor: AppColors.orangeColor,
              ),
            ),
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
          const SliverToBoxAdapter(
            child: Padding(
              padding: EdgeInsetsDirectional.only(start: 28),
              child: CustomTextFormFiled(
                hintText: "",
                borderColor: AppColors.orangeColor,
                maxLines: 5,
                minLines: 5,
                height: null,
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
          const SliverToBoxAdapter(
            child: Padding(
              padding: EdgeInsetsDirectional.only(start: 28),
              child: CustomTextFormFiled(
                hintText: "",
                borderColor: AppColors.orangeColor,
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
                  hintText: S.of(context).Profile_Image_Shaping),
            ),
          ),
          SliverToBoxAdapter(
            child: 40.kh,
          ),
          SliverToBoxAdapter(
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                AppButton(
                  onPressed: () {},
                  buttonColor: AppColors.redColor,
                  borderColor: AppColors.redColor,
                  height: 32,
                  width: 151,
                  text: "Cancel",
                ),
                12.kw,
                Theme(
                  data: ThemeData(primaryColor: AppColors.whiteColor),
                  child: AppButton(
                    onPressed: () {},
                    buttonColor: Colors.white,
                    borderColor: AppColors.orangeColor,
                    height: 32,
                    width: 151,
                    text: "Send and wait ",
                    textStyle: AppStyles.style14w500Orange(context),
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
