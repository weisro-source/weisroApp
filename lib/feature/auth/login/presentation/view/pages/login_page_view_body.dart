import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:weisro/core/utils/helper_functions.dart';
import 'package:weisro/core/utils/sized_box_extension.dart';
import 'package:weisro/core/utils/validate.dart';
import 'package:weisro/core/widgets/app_button.dart';
import 'package:weisro/core/widgets/custom_dialog.dart';
import 'package:weisro/core/widgets/custom_text_form_filed.dart';
import 'package:weisro/core/widgets/logo_image_widget.dart';
import 'package:weisro/core/widgets/shimmer_app_button.dart';
import 'package:weisro/core/widgets/title_for_text_from_filed.dart';
import 'package:weisro/feature/auth/forget_password/presentation/view/pages/forget_password_page_view.dart';
import 'package:weisro/feature/auth/login/presentation/managers/login_cubit.dart/login_cubit.dart';
import 'package:weisro/feature/auth/login/presentation/view/widgets/forget_password_button.dart';
import 'package:weisro/feature/auth/register/presentation/view/widgets/labeled_border_box.dart';
import 'package:weisro/feature/home/presentation/view/pages/home_page_view.dart';
import 'package:weisro/generated/l10n.dart';

class LoginPageViewBody extends StatelessWidget {
  const LoginPageViewBody({super.key});

  @override
  Widget build(BuildContext context) {
    LoginCubit loginCubit = LoginCubit.get(context);
    return Padding(
      padding: const EdgeInsetsDirectional.symmetric(horizontal: 32),
      child: Form(
        key: loginCubit.loginFormKey,
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
            LabeledBorderBox(label: S.of(context).Create_Client_account),
            SliverToBoxAdapter(
              child: 100.kh,
            ),
            SliverToBoxAdapter(
              child: TitleForTextFromFiled(title: S.of(context).Email),
            ),
            SliverToBoxAdapter(
              child: 4.kh,
            ),
            SliverToBoxAdapter(
              child: CustomTextFormFiled(
                hintText: "Username@example.com",
                controller: loginCubit.emailController,
                focusNode: loginCubit.emailFocusNode,
                textInputAction: TextInputAction.next,
                keyboardType: TextInputType.emailAddress,
                validator: (value) => Validate.validateEmail(value, context),
                onFieldSubmitted: (p0) {
                  HelperFunctions.requestNextFocus(loginCubit.emailFocusNode,
                      loginCubit.passwordFocusNode, context);
                },
              ),
            ),
            SliverToBoxAdapter(
              child: 20.kh,
            ),
            SliverToBoxAdapter(
              child: TitleForTextFromFiled(title: S.of(context).Password),
            ),
            SliverToBoxAdapter(
              child: 4.kh,
            ),
            SliverToBoxAdapter(
              child: CustomTextFormFiled(
                hintText: loginCubit.hintTextPassword,
                controller: loginCubit.passwordController,
                focusNode: loginCubit.passwordFocusNode,
                maxLength: 15,
                validator: (value) => Validate.validatePassword(value, context),
                onFieldSubmitted: (_) {
                  HelperFunctions.requestNextFocus(loginCubit.passwordFocusNode,
                      loginCubit.loginButtonFocusNode, context);
                },
              ),
            ),
            SliverToBoxAdapter(
              child: 4.kh,
            ),
            SliverToBoxAdapter(
                child: Align(
              alignment: AlignmentDirectional.bottomEnd,
              child: ForgetPasswordButton(
                onPressed: () {
                  HelperFunctions.navigateToScreen(
                      context, (context) => const ForgetPasswordPageView());
                },
              ),
            )),
            SliverToBoxAdapter(
              child: 23.kh,
            ),
            SliverToBoxAdapter(
              child: BlocConsumer<LoginCubit, LoginState>(
                listener: (context, loginState) {
                  if (loginState is LoginSuccess) {
                    // change this to home page
                    HelperFunctions.navigateToScreenAndRemove(
                        context, (context) => const HomePageView());
                    log("Api login Response ${loginState.successLoginModel.toString()}");
                  } else if (loginState is LoginFailures) {
                    CustomDialog.showCustomDialog(
                        context, "error in login error", loginState.errMessage);

                    //! this for if no Internet connection and would to navigate to Home page
                    //! and dont forget this
                    //todo: remove this line ...

                    if (HelperFunctions.isDebugMode()) {
                      HelperFunctions.navigateToScreenAndRemove(
                          context, (context) => const HomePageView());
                    }
                  }
                },
                builder: (context, loginState) {
                  if (loginState is LoginLoading) {
                    return const ShimmerAppButton.rectangular();
                  } else {
                    return AppButton(
                      focusNode: loginCubit.loginButtonFocusNode,
                      onPressed: () async {
                        await loginCubit.login(context);
                      },
                      text: S.of(context).Log_in,
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
