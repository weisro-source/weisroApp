import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:weisro/core/assets_path/image_path.dart';
import 'package:weisro/core/utils/helper_functions.dart';
import 'package:weisro/core/utils/sized_box_extension.dart';
import 'package:weisro/core/utils/validate.dart';
import 'package:weisro/core/widgets/app_button.dart';
import 'package:weisro/core/widgets/custom_dialog.dart';
import 'package:weisro/core/widgets/custom_text_form_filed.dart';
import 'package:weisro/core/widgets/logo_image_widget.dart';
import 'package:weisro/core/widgets/shimmer_app_button.dart';
import 'package:weisro/core/widgets/title_for_text_from_filed.dart';
import 'package:weisro/feature/auth/forget_password/presentation/manager/forget_password_cubit/forget_password_cubit.dart';
import 'package:weisro/feature/auth/otp/presentation/view/pages/otp_page_view.dart';
import 'package:weisro/feature/auth/register/presentation/view/widgets/labeled_border_box.dart';
import 'package:weisro/generated/l10n.dart';

class ForgetPasswordPageViewBody extends StatelessWidget {
  const ForgetPasswordPageViewBody({super.key});

  @override
  Widget build(BuildContext context) {
    ForgetPasswordCubit forgetPasswordCubit = ForgetPasswordCubit.get(context);
    return Padding(
      padding: const EdgeInsetsDirectional.symmetric(horizontal: 32),
      child: Form(
        key: forgetPasswordCubit.forgetPasswordFormKey,
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
            SliverToBoxAdapter(
                child: CustomTextFormFiled(
                    controller: forgetPasswordCubit.emailController,
                    focusNode: forgetPasswordCubit.emailFocusNode,
                    validator: (value) =>
                        Validate.validateEmail(value, context),
                    onFieldSubmitted: (p0) => HelperFunctions.requestNextFocus(
                        forgetPasswordCubit.emailFocusNode,
                        forgetPasswordCubit.sendOtpButtonFocusNode,
                        context),
                    hintText: "Example@gmail.com")),
            SliverToBoxAdapter(
              child: 20.kh,
            ),
            SliverToBoxAdapter(
                child: BlocConsumer<ForgetPasswordCubit, ForgetPasswordState>(
              listener: (context, forgetPasswordState) {
                if (forgetPasswordState is ForgetPasswordFailures) {
                  CustomDialog.showCustomDialog(context, 'error in send Otp',
                      forgetPasswordState.errMessage);
                } else if (forgetPasswordState is ForgetPasswordSuccess) {
                  HelperFunctions.navigateToScreenAndRemove(
                    context,
                    (context) =>  OtpPageView(
                        isForgetPassword: true,
                        email: forgetPasswordCubit.emailController.text),
                  );
                }
              },
              builder: (context, forgetPasswordState) {
                if (forgetPasswordState is ForgetPasswordLoading) {
                  return const ShimmerAppButton.rectangular();
                } else {
                  return AppButton(
                    focusNode: forgetPasswordCubit.sendOtpButtonFocusNode,
                    onPressed: () async {
                      await forgetPasswordCubit.resendOtp();
                    },
                    text: S.of(context).Send_Code,
                  );
                }
              },
            )),
          ],
        ),
      ),
    );
  }
}
