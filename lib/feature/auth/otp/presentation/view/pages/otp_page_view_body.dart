import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:weisro/core/assets_path/image_path.dart';
import 'package:weisro/core/utils/helper_functions.dart';
import 'package:weisro/core/utils/sized_box_extension.dart';
import 'package:weisro/core/widgets/app_button.dart';
import 'package:weisro/core/widgets/custom_dialog.dart';
import 'package:weisro/core/widgets/logo_image_widget.dart';
import 'package:weisro/core/widgets/shimmer_app_button.dart';
import 'package:weisro/feature/auth/forget_password/presentation/view/pages/new_password_view_page.dart';
import 'package:weisro/feature/auth/otp/presentation/manager/verify_otp_cubit/verify_otp_cubit.dart';
import 'package:weisro/feature/auth/otp/presentation/view/pages/success_code_page_view.dart';
import 'package:weisro/feature/auth/register/presentation/manager/register_cubit/register_cubit.dart';
import 'package:weisro/feature/auth/register/presentation/view/widgets/labeled_border_box.dart';
import 'package:weisro/generated/l10n.dart';

import '../widgets/code_send_to_email_text_widget.dart';
import '../widgets/otp_text_input.dart';
import '../widgets/resend_code.dart';

class OtpPageViewBody extends StatelessWidget {
  const OtpPageViewBody(
      {super.key,
      required this.isForgetPassword,
      this.email,
      required this.isChangeEmail});
  final bool isForgetPassword;
  final bool isChangeEmail;
  final String? email;
  @override
  Widget build(BuildContext context) {
    VerifyOtpCubit verifyOtpCubit = VerifyOtpCubit.get(context);
    return Form(
      key: verifyOtpCubit.otpFormKey,
      child: CustomScrollView(
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
              sliver: LabeledBorderBox(
                  label: isForgetPassword
                      ? S.of(context).Forget_Password
                      : isChangeEmail
                          ? S.of(context).Change_Email
                          : S.of(context).Get_the_Code)),
          SliverToBoxAdapter(
            child: 37.kh,
          ),
          SliverToBoxAdapter(
            child: Visibility(
              visible: !isForgetPassword && !isChangeEmail,
              child: CodeSendToEmailTextWidget(
                //? I write Here the  !isForgetPassword for dont user RegisterCubit
                email: !isForgetPassword && !isChangeEmail
                    ? HelperFunctions.maskEmail(
                        RegisterCubit.get(context).getEmail())
                    : "",
              ),
            ),
          ),
          SliverToBoxAdapter(
            child: 37.kh,
          ),
          SliverToBoxAdapter(
              child: isForgetPassword
                  ? SvgPicture.asset(
                      ImagePath.imagesForgetPassword,
                      height: 160,
                      fit: BoxFit.scaleDown,
                    )
                  : Image.asset(
                      ImagePath.imagesSendCodeImage,
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
              child: BlocConsumer<VerifyOtpCubit, VerifyOtpState>(
                listener: (context, verifyState) {
                  if (verifyState is VerifyOtpSuccess) {
                    HelperFunctions.navigateToScreen(
                        context,
                        (context) => !isForgetPassword
                            ? const SuccessCodePageView()
                            : NewPasswordPageView(
                                code: verifyOtpCubit.otpController.text,
                              ));
                  } else if (verifyState is VerifyOtpFailure) {
                    CustomDialog.showCustomDialog(
                        context, "Error in Verify Otp", verifyState.errMessage);
                  }
                },
                builder: (context, verifyState) {
                  if (verifyState is VerifyOtpLoading) {
                    return const ShimmerAppButton.rectangular();
                  } else {
                    return AppButton(
                        onPressed: () async {
                          !isForgetPassword
                              ? await verifyOtpCubit.verifyOtp(context)
                              : await verifyOtpCubit.verifyOtp(context, email);
                        },
                        text: S.of(context).Verify_Code);
                  }
                },
              ),
            ),
          )
        ],
      ),
    );
  }
}
