import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:weisro/core/assets_path/image_path.dart';
import 'package:weisro/core/utils/helper_functions.dart';
import 'package:weisro/core/utils/sized_box_extension.dart';
import 'package:weisro/core/widgets/app_button.dart';
import 'package:weisro/core/widgets/custom_text_form_filed.dart';
import 'package:weisro/core/widgets/logo_image_widget.dart';
import 'package:weisro/core/widgets/title_for_text_from_filed.dart';
import 'package:weisro/feature/auth/otp/presentation/view/pages/otp_page_view.dart';
import 'package:weisro/feature/auth/register/presentation/view/widgets/labeled_border_box.dart';
import 'package:weisro/generated/l10n.dart';

class ForgetPasswordPageViewBody extends StatelessWidget {
  const ForgetPasswordPageViewBody({super.key});

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
            child: TitleForTextFromFiled(title: S.of(context).Email),
          ),
          SliverToBoxAdapter(
            child: 4.kh,
          ),
          const SliverToBoxAdapter(
              child: CustomTextFormFiled(hintText: "Example@gmail.com")),
          SliverToBoxAdapter(
            child: 20.kh,
          ),
          SliverToBoxAdapter(
              child: AppButton(
            onPressed: () {
              HelperFunctions.navigateToScreenAndRemove(
                context,
                (context) => const OtpPageView(isForgetPassword: true),
              );
            },
            text: S.of(context).Send_Code,
          )),
        ],
      ),
    );
  }
}
