import 'package:flutter/material.dart';
import 'package:weisro/core/assets_path/image_path.dart';
import 'package:weisro/core/utils/helper_functions.dart';
import 'package:weisro/core/utils/sized_box_extension.dart';
import 'package:weisro/core/widgets/app_button.dart';
import 'package:weisro/core/widgets/logo_image_widget.dart';
import 'package:weisro/feature/auth/otp/presentation/view/pages/success_code_page_view.dart';
import 'package:weisro/feature/auth/register/presentation/view/widgets/labeled_border_box.dart';
import 'package:weisro/generated/l10n.dart';

import '../widgets/code_send_to_email_text_widget.dart';
import '../widgets/otp_text_input.dart';
import '../widgets/resend_code.dart';

class OtpPageViewBody extends StatelessWidget {
  const OtpPageViewBody({super.key});

  @override
  Widget build(BuildContext context) {
    return CustomScrollView(
      slivers: [
        SliverToBoxAdapter(
          child: 35.kh,
        ),
        const SliverPadding(
          padding: EdgeInsetsDirectional.symmetric(horizontal: 32),
          sliver: SliverToBoxAdapter(
            child: Align(
              alignment: AlignmentDirectional.topStart,
              child: LogoImageWidget(),
            ),
          ),
        ),
        SliverToBoxAdapter(
          child: 23.kh,
        ),
        SliverPadding(
            padding: const EdgeInsetsDirectional.symmetric(horizontal: 32),
            sliver: LabeledBorderBox(label: S.of(context).Get_the_Code)),
        SliverToBoxAdapter(
          child: 37.kh,
        ),
        const SliverToBoxAdapter(
          child: CodeSendToEmailTextWidget(
            email: "we******u@gmail.com",
          ),
        ),
        SliverToBoxAdapter(
          child: 37.kh,
        ),
        SliverToBoxAdapter(
            child: Image.asset(
          ImagePath.sendCodeImage,
          height: 160,
        )),
        const SliverToBoxAdapter(
          child: OtpTextInput(),
        ),
        SliverToBoxAdapter(
          child: 16.kh,
        ),
        SliverToBoxAdapter(
          child: ResendCode(
            onTapResend: () {},
          ),
        ),
        SliverToBoxAdapter(
          child: 16.kh,
        ),
        SliverPadding(
          padding: const EdgeInsetsDirectional.symmetric(horizontal: 35),
          sliver: SliverToBoxAdapter(
            child: AppButton(
                onPressed: () {
                  HelperFunctions.navigateToScreen(
                      context, (context) => const SuccessCodePageView());
                },
                text: S.of(context).Verify_Code),
          ),
        )
      ],
    );
  }
}
