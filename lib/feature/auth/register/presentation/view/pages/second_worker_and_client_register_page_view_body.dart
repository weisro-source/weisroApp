import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:weisro/core/cache/cache_helper.dart';
import 'package:weisro/core/cache/cache_keys.dart';
import 'package:weisro/core/styles/app_color.dart';
import 'package:weisro/core/styles/app_style.dart';
import 'package:weisro/core/utils/helper_functions.dart';
import 'package:weisro/core/utils/sized_box_extension.dart';
import 'package:weisro/core/utils/validate.dart';
import 'package:weisro/core/widgets/custom_dialog.dart';
import 'package:weisro/core/widgets/custom_text_form_filed.dart';
import 'package:weisro/core/widgets/logo_image_widget.dart';
import 'package:weisro/core/widgets/new_app_button.dart';
import 'package:weisro/core/widgets/shimmer_app_button.dart';
import 'package:weisro/feature/auth/otp/presentation/view/pages/otp_page_view.dart';
import 'package:weisro/feature/auth/register/presentation/manager/checkbox_cubit.dart';
import 'package:weisro/feature/auth/register/presentation/manager/register_cubit/register_cubit.dart';
import 'package:weisro/feature/auth/register/presentation/view/pages/worker_register_day_selected_page_view.dart';
import 'package:weisro/feature/auth/register/presentation/view/widgets/custom_phone_input_field.dart';
import 'package:weisro/feature/auth/register/presentation/view/widgets/google_auth_button_widget.dart';
import 'package:weisro/feature/auth/register/presentation/view/widgets/or_text_widget.dart';
import 'package:weisro/feature/home/presentation/view/pages/home_page_view.dart';
import 'package:weisro/feature/profile/presentation/view/pages/static_page_view.dart';
import 'package:weisro/generated/l10n.dart';

import '../widgets/i_agree_checkbox.dart';
import '../widgets/terms_and_privacy_dialog.dart';

class SecondWorkerAndClientRegisterPageViewBody extends StatelessWidget {
  const SecondWorkerAndClientRegisterPageViewBody(
      {super.key, required this.isWorkerAuth, this.isGoogleAuth = false});
  final bool isWorkerAuth;
  final bool isGoogleAuth;

  @override
  Widget build(BuildContext context) {
    RegisterCubit registerCubit = RegisterCubit.get(context);
    registerCubit.countryCodeController.text = "49";
    return MultiBlocProvider(
      providers: [
        BlocProvider(
          create: (context) =>
              CheckboxCubit()..initializeCheckboxes(['terms', 'privacy']),
        ),
        BlocProvider.value(value: registerCubit),
      ],
      child: SafeArea(
        child: Padding(
          padding: const EdgeInsetsDirectional.symmetric(horizontal: 32),
          child: Form(
            key: registerCubit.registerSecondFormKey,
            child: CustomScrollView(
              slivers: [
                34.sKh,
                const SliverToBoxAdapter(
                  child: Align(
                    alignment: AlignmentDirectional.topStart,
                    child: LogoImageWidget(),
                  ),
                ),
                24.sKh,
                SliverToBoxAdapter(
                  child: Text(
                    isGoogleAuth
                        ? S.of(context).Complete_Information
                        : isWorkerAuth
                            ? S.of(context).Create_Worker_Account
                            : S.of(context).Create_Client_account,
                    style: AppStyles.style18w500Grey(context).copyWith(
                        color: AppColors.orangeColor,
                        fontWeight: FontWeight.w700),
                  ),
                ),
                6.sKh,
                SliverToBoxAdapter(
                  child: Text(
                    S.of(context).Fill_Registration_Info,
                    style: AppStyles.style10w400Grey(context),
                  ),
                ),
                SliverToBoxAdapter(
                  child: 35.kh,
                ),
                // const SliverToBoxAdapter(
                //   child: Align(
                //     alignment: AlignmentDirectional.topStart,
                //     child: LogoImageWidget(),
                //   ),
                // ),
                // SliverToBoxAdapter(
                //   child: 23.kh,
                // ),
                // LabeledBorderBox(
                //     label:
                // isGoogleAuth
                //         ? S.of(context).Complete_Information
                //         : isWorkerAuth
                //             ? S.of(context).Create_Worker_Account
                //             : S.of(context).Create_Client_account),
                // SliverToBoxAdapter(
                //   child: 44.kh,
                // ),
                //* this a steeper widget
                // const SliverToBoxAdapter(
                //     child: CustomSteeperWidget(
                //   isTowStepActive: true,
                // )),
                // SliverToBoxAdapter(
                //     child: Visibility(
                //   visible: !isGoogleAuth,
                //   child: TitleForTextFromFiled(
                //     title: S.of(context).Email,
                //   ),
                // )),
                // SliverToBoxAdapter(
                //   child: Visibility(visible: !isGoogleAuth, child: 5.kh),
                // ),
                // but the
                SliverToBoxAdapter(
                  child: Visibility(
                    visible: !isGoogleAuth,
                    child: CustomTextFormFiled(
                      hintText: "Username@example.com",
                      controller: registerCubit.emailController,
                      focusNode: registerCubit.emailFocusNode,
                      keyboardType: TextInputType.emailAddress,
                      borderRadius: 20,
                      borderColor: AppColors.orangeColor,
                      validator: (value) =>
                          Validate.validateEmail(value, context),
                      onFieldSubmitted: (p0) {
                        HelperFunctions.requestNextFocus(
                            registerCubit.emailFocusNode,
                            registerCubit.phoneNumberFocusNode,
                            context);
                      },
                    ),
                  ),
                ),
                SliverToBoxAdapter(
                  child: Visibility(visible: !isGoogleAuth, child: 20.kh),
                ),
                // SliverToBoxAdapter(
                //     child: TitleForTextFromFiled(
                //   title: S.of(context).Mobile_Number,
                // )),
                // SliverToBoxAdapter(
                //   child: 5.kh,
                // ),
                // but the
                SliverToBoxAdapter(
                    child: SizedBox(
                  child: CustomPhoneInput(
                    phoneController: registerCubit.phoneController,
                    phoneNumberFocusNode: registerCubit.phoneNumberFocusNode,
                    onSubmitted: (_) {
                      HelperFunctions.requestNextFocus(
                          registerCubit.phoneNumberFocusNode,
                          registerCubit.passwordFocusNode,
                          context);
                    },
                    onCountryChanged: (value) async {
                      registerCubit.countryCodeController.text =
                          value.dialCode.toString();
                      await CacheHelper.setData(
                          key: CacheKeys.kCountryCode, value: value.dialCode);
                    }
                    //               (value) async {
                    //   await CacheHelper.setData(
                    //       key: CacheKeys.kCountryCode, value: value.dialCode);
                    // },,
                    ,
                  ),
                )),

                // SliverToBoxAdapter(
                //     child: TitleForTextFromFiled(
                //   title: S.of(context).Password,
                // )),
                SliverToBoxAdapter(
                  child: 5.kh,
                ),
                // but the hint in cubit
                SliverToBoxAdapter(
                  child: CustomTextFormFiled(
                    hintText: registerCubit.hintTextPassword,
                    controller: registerCubit.passwordController,
                    keyboardType: TextInputType.visiblePassword,
                    borderRadius: 20,
                    borderColor: AppColors.orangeColor,
                    validator: (value) =>
                        Validate.validatePassword(value, context),
                    onFieldSubmitted: (_) {
                      HelperFunctions.requestNextFocus(
                          registerCubit.passwordFocusNode,
                          registerCubit.confirmationPasswordFocusNode,
                          context);
                    },
                  ),
                ),
                SliverToBoxAdapter(
                  child: 20.kh,
                ),
                // SliverToBoxAdapter(
                //     child: TitleForTextFromFiled(
                //   title: S.of(context).Confirm_Password,
                // )),
                // SliverToBoxAdapter(
                //   child: 5.kh,
                // ),
                SliverToBoxAdapter(
                  child: CustomTextFormFiled(
                    hintText: registerCubit.hintTextPassword,
                    controller: registerCubit.confirmationPasswordController,
                    focusNode: registerCubit.confirmationPasswordFocusNode,
                    borderRadius: 20,
                    borderColor: AppColors.orangeColor,
                    validator: (value) => Validate.validateConfirmPassword(
                        value, registerCubit.passwordController.text, context),
                  ),
                ),
                SliverToBoxAdapter(
                  child: 16.kh,
                ),
                SliverToBoxAdapter(
                  child: BlocBuilder<CheckboxCubit, Map<String, bool>>(
                    builder: (context, state) {
                      return IAgreeCheckbox(
                        isChecked: state['terms'] ?? false,
                        focusNode: registerCubit.termsFocusNode,
                        onChanged: (value) {
                          context.read<CheckboxCubit>().toggleCheckbox('terms');
                          registerCubit.isTermsOk = value ?? false;
                        },
                        onTermsPressed: () {
                          // Handle Terms of Use press
                          HelperFunctions.navigateToScreen(
                            context,
                            (context) => PrivacyPolicyPageView(
                              appTitle: S.of(context).Terms_of_Use,
                            ),
                          );
                        },
                        agreeText: S.of(context).Terms_of_Use,
                      );
                    },
                  ),
                ),
                SliverToBoxAdapter(
                  child: 5.kh,
                ),
                SliverToBoxAdapter(
                  child: BlocBuilder<CheckboxCubit, Map<String, bool>>(
                    builder: (context, state) {
                      return IAgreeCheckbox(
                        isChecked: state['privacy'] ?? false,
                        focusNode: registerCubit.privacyFocusNode,
                        onChanged: (value) {
                          context
                              .read<CheckboxCubit>()
                              .toggleCheckbox('privacy');
                          registerCubit.isPrivacyOk = value ?? false;
                        },
                        onTermsPressed: () {
                          HelperFunctions.navigateToScreen(
                            context,
                            (context) => PrivacyPolicyPageView(
                              appTitle: S.of(context).Privacy_Policy,
                            ),
                          );
                        },
                        agreeText: S.of(context).Privacy_Policy,
                      );
                    },
                  ),
                ),
                SliverToBoxAdapter(
                  child: 20.kh,
                ),
                SliverToBoxAdapter(
                  child: BlocConsumer<RegisterCubit, RegisterState>(
                    listener: (context, registerState) {
                      if (registerState is RegisterFailures) {
                        CustomDialog.showCustomDialog(
                            context,
                            S.of(context).Error_In_Register,
                            registerState.errMessage);
                      } else if (registerState is RegisterSuccess) {
                        HelperFunctions.navigateToScreenAndRemove(
                            context,
                            (context) => BlocProvider.value(
                                  value: registerCubit,
                                  child: const OtpPageView(
                                      isForgetPassword: false),
                                ));
                      } else if (registerState is RegisterGoogleSuccess) {
                        HelperFunctions.navigateToScreenAndRemove(
                          context,
                          (context) => const HomePageView(),
                        );
                      }
                    },
                    builder: (context, state) {
                      if (state is RegisterLoading) {
                        return const ShimmerAppButton.rectangular();
                      } else {
                        return NewAppButton(
                          title: S.of(context).Create_Account,
                          onPressed: () async {
                            if (!registerCubit.isTermsOk ||
                                !registerCubit.isPrivacyOk) {
                              String message = '';

                              if (!registerCubit.isTermsOk) {
                                log("Terms not accepted.");
                                message +=
                                    "• ${S.of(context).Must_Agree_Terms}.\n";
                              }

                              if (!registerCubit.isPrivacyOk) {
                                log("Privacy policy not accepted.");
                                message +=
                                    "• ${S.of(context).Must_Accept_Privacy}.\n";
                              }

                              if (message.isNotEmpty) {
                                if (context.mounted) {
                                  showGeneralDialog(
                                    context: context,
                                    barrierDismissible: true,
                                    barrierLabel:
                                        MaterialLocalizations.of(context)
                                            .modalBarrierDismissLabel,
                                    transitionDuration:
                                        const Duration(milliseconds: 300),
                                    pageBuilder: (context, animation,
                                        secondaryAnimation) {
                                      return TermsAndPrivacyDialog(message: message);
                                    },
                                  );
                                }
                                return;
                              }
                            } else {
                              if (isWorkerAuth) {
                                if (registerCubit.isSecondScreenValidate()) {
                                  HelperFunctions.navigateToScreen(
                                    context,
                                    (context) => BlocProvider.value(
                                      value: registerCubit,
                                      child:
                                          const WorkerRegisterDaySelectedPageView(),
                                    ),
                                  );
                                }
                              } else {
                                if (isGoogleAuth) {
                                  await registerCubit.googleAuth();
                                } else {
                                  await registerCubit.registerClient();
                                }
                              }
                            }
                          },
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
                  child: Visibility(
                    visible: !isGoogleAuth,
                    child: GoogleAuthButtonWidget(
                      onPressed: () {},
                    ),
                  ),
                ),
                SliverToBoxAdapter(
                  child: 40.kh,
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
