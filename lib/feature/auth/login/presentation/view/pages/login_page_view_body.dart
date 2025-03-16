import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_svg/svg.dart';
import 'package:weisro/core/assets_path/icons_path.dart';
import 'package:weisro/core/styles/app_color.dart';
import 'package:weisro/core/styles/app_style.dart';
import 'package:weisro/core/utils/helper_functions.dart';
import 'package:weisro/core/utils/sized_box_extension.dart';
import 'package:weisro/core/utils/validate.dart';
import 'package:weisro/core/widgets/custom_dialog.dart';
import 'package:weisro/core/widgets/custom_loading.dart';
import 'package:weisro/core/widgets/custom_text_form_filed.dart';
import 'package:weisro/core/widgets/logo_image_widget.dart';
import 'package:weisro/core/widgets/new_app_button.dart';
import 'package:weisro/core/widgets/shimmer_app_button.dart';
import 'package:weisro/core/widgets/title_for_text_from_filed.dart';
import 'package:weisro/feature/auth/forget_password/presentation/view/pages/forget_password_page_view.dart';
import 'package:weisro/feature/auth/google_auth/google_auth.dart';
import 'package:weisro/feature/auth/google_auth/google_auth_state.dart';
import 'package:weisro/feature/auth/login/presentation/managers/login_cubit.dart/login_cubit.dart';
import 'package:weisro/feature/auth/login/presentation/view/widgets/forget_password_button.dart';
import 'package:weisro/feature/auth/register/presentation/manager/register_cubit/register_cubit.dart';
import 'package:weisro/feature/auth/register/presentation/view/widgets/google_auth_button_widget.dart';
import 'package:weisro/feature/auth/register/presentation/view/widgets/have_an_account.dart';
import 'package:weisro/feature/auth/register/presentation/view/widgets/or_text_widget.dart';
import 'package:weisro/feature/home/presentation/view/pages/home_page_view.dart';
import 'package:weisro/feature/onboarding/presentation/view/pages/selected_account_type_view.dart';
import 'package:weisro/generated/l10n.dart';

class LoginPageViewBody extends StatefulWidget {
  const LoginPageViewBody({super.key, this.role});
  final String? role;

  @override
  State<LoginPageViewBody> createState() => _LoginPageViewBodyState();
}

class _LoginPageViewBodyState extends State<LoginPageViewBody> {
  @override
  void initState() {
    super.initState();
    GoogleAuthCubit.get(context).isUserLoggedIn();
  }

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
            24.sKh,
            SliverToBoxAdapter(
              child: Text(
                S.of(context).Login_Information,
                style: AppStyles.style18w500Grey(context).copyWith(
                    color: AppColors.orangeColor, fontWeight: FontWeight.w700),
              ),
            ),
            6.sKh,
            SliverToBoxAdapter(
              child: Text(
                S.of(context).Fill_Registration_Info,
                style: AppStyles.style10w400Grey(context),
              ),
            ),
            63.sKh,
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
                borderColor: AppColors.orangeColor,
                borderRadius: 20,
                prefix: Padding(
                  padding: const EdgeInsetsDirectional.only(top: 2, end: 10),
                  child: SvgPicture.asset(
                    IconsPath.iconsMail,
                  ),
                ),
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
                borderRadius: 20,
                borderColor: AppColors.orangeColor,
                prefix: Padding(
                  padding: const EdgeInsetsDirectional.only(top: 2, end: 10),
                  child: SvgPicture.asset(
                    IconsPath.iconsLockSecurity,
                  ),
                ),
                validator: (value) => Validate.validatePassword(value, context),
                onFieldSubmitted: (_) {
                  HelperFunctions.requestNextFocus(loginCubit.passwordFocusNode,
                      loginCubit.loginButtonFocusNode, context);
                },
              ),
            ),
            // SliverToBoxAdapter(
            //   child: 4.kh,
            // ),
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
              child: 21.kh,
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

                    // if (HelperFunctions.isDebugMode()) {
                    //   HelperFunctions.navigateToScreenAndRemove(
                    //       context, (context) => const HomePageView());
                    // }
                  }
                },
                builder: (context, loginState) {
                  if (loginState is LoginLoading) {
                    return const ShimmerAppButton.rectangular();
                  } else {
                    return StatefulBuilder(
                      builder: (context, setState) => NewAppButton(
                        height: 43,
                        focusNode: loginCubit.loginButtonFocusNode,
                        onPressed: () async {
                          RegisterCubit.get(context)
                              .googlAuthCancelToken
                              .cancel();
                          await loginCubit.login(context);
                        },
                        title: S.of(context).Log_in,
                        titleColor: AppColors.whiteColor,
                        borderColor: AppColors.orangeColor,
                        buttonColor: AppColors.orangeColor,
                      ),
                    );
                  }
                },
              ),
            ),
            SliverToBoxAdapter(
              child: 10.kh,
            ),
            const SliverToBoxAdapter(
              child: OrTextWidget(),
            ),
            SliverToBoxAdapter(
              child: 10.kh,
            ),
            SliverToBoxAdapter(
              child: BlocConsumer<GoogleAuthCubit, GoogleAuthState>(
                listener: (context, googleAuthState) {
                  if (googleAuthState is GoogleAuthTransactionSuccess) {
                    // HelperFunctions.navigateToScreenAndRemove(
                    //   context,
                    //   (context) => WorkerAndClientRegisterPageView(
                    //     isWorkerAuth: isWorkerAuth,
                    //     isGoogleAuth: true,
                    //   ),
                    // );
                  }
                },
                builder: (context, googleAuthState) {
                  if (googleAuthState is GoogleAuthLoading) {
                    return const CustomLoading(
                      animationType: "staggeredDotsWave",
                      size: 30,
                    );
                  } else {
                    return GoogleAuthButtonWidget(
                      onPressed: () async {
                        await GoogleAuthCubit.get(context)
                            .authenticateWithGoogleAndSendToApi(
                                widget.role ?? "");
                      },
                    );
                  }
                },
              ),
            ),
            SliverToBoxAdapter(
              child: 23.kh,
            ),
            SliverToBoxAdapter(
              child: HaveAnAccount(
                title: S.of(context).Dont_Have_Account,
                buttonTitle: S.of(context).Sign_Up,
                onPressed: () {
                  HelperFunctions.navigateToScreen(
                      context, (context) => const SelectedAccountTypeView());
                },
              ),
            ),
          ],
        ),
      ),
    );
  }
}
//  SliverToBoxAdapter(
//               child: 23.kh,
//             ),
//             LabeledBorderBox(label: S.of(context).Create_Client_account),