import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:weisro/core/utils/helper_functions.dart';
import 'package:weisro/core/utils/sized_box_extension.dart';
import 'package:weisro/core/widgets/app_button.dart';
import 'package:weisro/core/widgets/custom_text_form_filed.dart';
import 'package:weisro/core/widgets/logo_image_widget.dart';
import 'package:weisro/core/widgets/title_for_text_from_filed.dart';
import 'package:weisro/feature/auth/otp/presentation/view/pages/otp_page_view.dart';
import 'package:weisro/feature/auth/register/presentation/manager/checkbox_cubit.dart';
import 'package:weisro/feature/auth/register/presentation/view/pages/worker_register_day_selected_page_view.dart';
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
    return BlocProvider(
      create: (context) => CheckboxCubit(),
      child: SafeArea(
        child: Padding(
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
              const SliverToBoxAdapter(
                child: CustomTextFormFiled(
                  hintText: "Username@example.com",
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
              const SliverToBoxAdapter(
                child: CustomTextFormFiled(
                  hintText: "+94",
                ),
              ),
              SliverToBoxAdapter(
                child: 20.kh,
              ),
              SliverToBoxAdapter(
                  child: TitleForTextFromFiled(
                title: S.of(context).Password,
              )),
              SliverToBoxAdapter(
                child: 5.kh,
              ),
              // but the hint in cubit
              const SliverToBoxAdapter(
                child: CustomTextFormFiled(
                  hintText: "********",
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
              // but the hint in cubit
              const SliverToBoxAdapter(
                child: CustomTextFormFiled(
                  hintText: "********",
                ),
              ),
              SliverToBoxAdapter(
                child: 16.kh,
              ),
              SliverToBoxAdapter(
                child: BlocBuilder<CheckboxCubit, bool>(
                  builder: (context, isChecked) {
                    return IAgreeCheckbox(
                      isChecked: isChecked,
                      onChanged: (value) {
                        context
                            .read<CheckboxCubit>()
                            .toggleCheckbox(value ?? false);
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
              SliverToBoxAdapter(child: BlocBuilder<CheckboxCubit, bool>(
                builder: (context, isChecked) {
                  return IAgreeCheckbox(
                    isChecked: isChecked,
                    onChanged: (value) {
                      context
                          .read<CheckboxCubit>()
                          .toggleCheckbox(value ?? false);
                    },
                    onTermsPressed: () {
                      // Handle Terms of Use press
                    },
                    agreeText: S.of(context).Privacy_Policy,
                  );
                },
              )),
              SliverToBoxAdapter(
                child: 20.kh,
              ),
              SliverToBoxAdapter(
                child: AppButton(
                  text: S.of(context).Create_Account,
                  onPressed: () {
                    /// is WorkerAuth is True navigate it to worker_register_day_selected
                    isWorkerAuth
                        ? HelperFunctions.navigateToScreen(
                            context,
                            (context) =>
                                const WorkerRegisterDaySelectedPageView())
                        : HelperFunctions.navigateToScreen(
                            context,
                            (context) => const OtpPageView(
                                  isForgetPassword: false,
                                ));
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
    );
  }
}
