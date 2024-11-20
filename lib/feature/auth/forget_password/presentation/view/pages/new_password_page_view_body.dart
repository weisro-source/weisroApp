import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_svg/svg.dart';
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
import 'package:weisro/feature/auth/forget_password/presentation/manager/reset_password_cubit/reset_password_cubit.dart';
import 'package:weisro/feature/auth/login/presentation/view/pages/login_page_view.dart';
import 'package:weisro/feature/auth/register/presentation/view/widgets/labeled_border_box.dart';
import 'package:weisro/generated/l10n.dart';

class NewPasswordPageViewBody extends StatelessWidget {
  const NewPasswordPageViewBody({super.key, required this.code});
  final String code;

  @override
  Widget build(BuildContext context) {
    ResetPasswordCubit resetPasswordCubit = ResetPasswordCubit.get(context);
    return Padding(
      padding: const EdgeInsetsDirectional.symmetric(horizontal: 32),
      child: Form(
        key: resetPasswordCubit.resetPasswordFormKey,
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
            SliverToBoxAdapter(
              child: CustomTextFormFiled(
                controller: resetPasswordCubit.passwordController,
                focusNode: resetPasswordCubit.passwordFocusNode,
                keyboardType: TextInputType.visiblePassword,
                textInputAction: TextInputAction.next,
                validator: (value) => Validate.validatePassword(value, context),
                onFieldSubmitted: (_) => HelperFunctions.requestNextFocus(
                    resetPasswordCubit.passwordFocusNode,
                    resetPasswordCubit.confirmationPasswordFocusNode,
                    context),
                hintText: "",
              ),
            ),
            SliverToBoxAdapter(
              child: 20.kh,
            ),
            SliverToBoxAdapter(
              child:
                  TitleForTextFromFiled(title: S.of(context).Confirm_Password),
            ),
            SliverToBoxAdapter(
              child: 4.kh,
            ),
            SliverToBoxAdapter(
              child: CustomTextFormFiled(
                controller: resetPasswordCubit.confirmationPasswordController,
                focusNode: resetPasswordCubit.confirmationPasswordFocusNode,
                keyboardType: TextInputType.visiblePassword,
                textInputAction: TextInputAction.next,
                validator: (value) => Validate.validateConfirmPassword(
                    value, resetPasswordCubit.passwordController.text, context),
                onFieldSubmitted: (_) => HelperFunctions.requestNextFocus(
                    resetPasswordCubit.confirmationPasswordFocusNode,
                    resetPasswordCubit.recoverPasswordButton,
                    context),
                hintText: "",
              ),
            ),
            SliverToBoxAdapter(
              child: 24.kh,
            ),
            SliverToBoxAdapter(
              child: BlocConsumer<ResetPasswordCubit, ResetPasswordState>(
                listener: (context, resetPasswordState) {
                  if (resetPasswordState is ResetPasswordFailures) {
                    CustomDialog.showCustomDialog(
                        context,
                        "Error In reset password",
                        resetPasswordState.errMessage);
                  } else if (resetPasswordState is ResetPasswordSuccess) {
                    HelperFunctions.navigateToScreenAndRemove(
                        context, (context) => const LoginPageView());
                  }
                },
                builder: (context, resetPasswordState) {
                  if (resetPasswordState is ResetPasswordLoading) {
                    return const ShimmerAppButton.rectangular();
                  } else {
                    return AppButton(
                      text: S.of(context).Recover_Password,
                      focusNode: resetPasswordCubit.recoverPasswordButton,
                      onPressed: () async {
                        await resetPasswordCubit.resetPassword(code);
                      },
                    );
                  }
                },
              ),
            ),
          ],
        ),
      ),
    );
  }
}
