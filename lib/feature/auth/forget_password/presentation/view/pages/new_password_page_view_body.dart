import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:weisro/core/assets_path/image_path.dart';
import 'package:weisro/core/utils/sized_box_extension.dart';
import 'package:weisro/core/widgets/app_button.dart';
import 'package:weisro/core/widgets/custom_text_form_filed.dart';
import 'package:weisro/core/widgets/logo_image_widget.dart';
import 'package:weisro/core/widgets/title_for_text_from_filed.dart';
import 'package:weisro/feature/auth/register/presentation/view/widgets/labeled_border_box.dart';
import 'package:weisro/generated/l10n.dart';

class NewPasswordPageViewBody extends StatelessWidget {
  const NewPasswordPageViewBody({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsetsDirectional.symmetric(horizontal: 32),
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
          LabeledBorderBox(label: S.of(context).Forget_Password),
          SliverToBoxAdapter(
            child: 72.kh,
          ),
          SliverToBoxAdapter(
            child: SvgPicture.asset(ImagePath.imagesForgetPassword),
          ),
          SliverToBoxAdapter(
            child: 40.kh,
          ),
          SliverToBoxAdapter(
            child: TitleForTextFromFiled(title: S.of(context).Password),
          ),
          SliverToBoxAdapter(
            child: 4.kh,
          ),
          const SliverToBoxAdapter(
            child: CustomTextFormFiled(hintText: ""),
          ),
          SliverToBoxAdapter(
            child: 20.kh,
          ),
          SliverToBoxAdapter(
            child: TitleForTextFromFiled(title: S.of(context).Confirm_Password),
          ),
          SliverToBoxAdapter(
            child: 4.kh,
          ),
          const SliverToBoxAdapter(
            child: CustomTextFormFiled(hintText: ""),
          ),
          SliverToBoxAdapter(
            child: 24.kh,
          ),
          SliverToBoxAdapter(
            child: AppButton(
              text: S.of(context).Recover_Password,
              onPressed: () {},
            ),
          ),
        ],
      ),
    );
  }
}
