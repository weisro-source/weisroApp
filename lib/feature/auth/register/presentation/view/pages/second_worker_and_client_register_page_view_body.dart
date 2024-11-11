import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:weisro/core/utils/helper_functions.dart';
import 'package:weisro/core/utils/sized_box_extension.dart';
import 'package:weisro/core/utils/validate.dart';
import 'package:weisro/core/widgets/app_button.dart';
import 'package:weisro/core/widgets/custom_text_form_filed.dart';
import 'package:weisro/core/widgets/logo_image_widget.dart';
import 'package:weisro/core/widgets/shimmer_app_button.dart';
import 'package:weisro/core/widgets/title_for_text_from_filed.dart';
import 'package:weisro/feature/auth/register/presentation/manager/checkbox_cubit.dart';
import 'package:weisro/feature/auth/register/presentation/manager/register_cubit/register_cubit.dart';
import 'package:weisro/feature/auth/register/presentation/view/pages/worker_register_day_selected_page_view.dart';
import 'package:weisro/feature/auth/register/presentation/view/widgets/custom_phone_input_field.dart';
import 'package:weisro/feature/auth/register/presentation/view/widgets/custom_steeper_widget.dart';
import 'package:weisro/feature/auth/register/presentation/view/widgets/google_auth_button_widget.dart';
import 'package:weisro/feature/auth/register/presentation/view/widgets/labeled_border_box.dart';
import 'package:weisro/feature/auth/register/presentation/view/widgets/or_text_widget.dart';
import 'package:weisro/generated/l10n.dart';

import '../widgets/i_agree_checkbox.dart';

class SecondWorkerAndClientRegisterPageViewBody extends StatelessWidget {
  const SecondWorkerAndClientRegisterPageViewBody(
      {super.key, required this.isWorkerAuth});
  final bool isWorkerAuth;
  @override
  Widget build(BuildContext context) {
    RegisterCubit registerCubit = RegisterCubit.get(context);
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
                LabeledBorderBox(
                    label: isWorkerAuth
                        ? S.of(context).Create_Worker_Account
                        : S.of(context).Create_Client_account),
                SliverToBoxAdapter(
                  child: 44.kh,
                ),
                //* this a steeper widget
                const SliverToBoxAdapter(
                    child: CustomSteeperWidget(
                  isTowStepActive: true,
                )),
                SliverToBoxAdapter(
                    child: TitleForTextFromFiled(
                  title: S.of(context).Email,
                )),
                SliverToBoxAdapter(
                  child: 5.kh,
                ),
                // but the
                SliverToBoxAdapter(
                  child: CustomTextFormFiled(
                    hintText: "Username@example.com",
                    controller: registerCubit.emailController,
                    focusNode: registerCubit.emailFocusNode,
                    keyboardType: TextInputType.emailAddress,
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
                SliverToBoxAdapter(
                  child: 20.kh,
                ),
                SliverToBoxAdapter(
                    child: TitleForTextFromFiled(
                  title: S.of(context).Mobile_Number,
                )),
                SliverToBoxAdapter(
                  child: 5.kh,
                ),
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
                  ),
                )),

                SliverToBoxAdapter(
                    child: TitleForTextFromFiled(
                  title: S.of(context).Password,
                )),
                SliverToBoxAdapter(
                  child: 5.kh,
                ),
                // but the hint in cubit
                SliverToBoxAdapter(
                  child: CustomTextFormFiled(
                    hintText: registerCubit.hintTextPassword,
                    controller: registerCubit.passwordController,
                    keyboardType: TextInputType.visiblePassword,
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
                SliverToBoxAdapter(
                    child: TitleForTextFromFiled(
                  title: S.of(context).Confirm_Password,
                )),
                SliverToBoxAdapter(
                  child: 5.kh,
                ),
                SliverToBoxAdapter(
                  child: CustomTextFormFiled(
                    hintText: registerCubit.hintTextPassword,
                    controller: registerCubit.confirmationPasswordController,
                    focusNode: registerCubit.confirmationPasswordFocusNode,
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
                          // Handle Privacy Policy press
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
                        registerCubit.showAgreementDialog(context,
                            "Error in Register", registerState.errMessage);
                      }
                    },
                    builder: (context, state) {
                      if (state is RegisterLoading) {
                        return const ShimmerAppButton.rectangular();
                      } else {
                        return AppButton(
                          text: S.of(context).Create_Account,
                          onPressed: () async {
                            if (!registerCubit.isTermsOk ||
                                !registerCubit.isPrivacyOk) {
                              if (!registerCubit.isTermsOk) {
                                Future.delayed(const Duration(milliseconds: 50),
                                    () {
                                  FocusScope.of(context).requestFocus(
                                      registerCubit.termsFocusNode);
                                });
                              } else if (!registerCubit.isPrivacyOk) {
                                registerCubit.privacyFocusNode.requestFocus();
                              }
                            } else {
                              if (isWorkerAuth) {
                                HelperFunctions.navigateToScreen(
                                  context,
                                  (context) => BlocProvider.value(
                                    value: registerCubit,
                                    child:
                                        const WorkerRegisterDaySelectedPageView(),
                                  ),
                                );
                              } else {
                                await registerCubit.registerClient();
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
                  child: GoogleAuthButtonWidget(
                    onPressed: () {},
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
