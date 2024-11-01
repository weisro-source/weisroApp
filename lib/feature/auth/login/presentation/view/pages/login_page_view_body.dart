import 'package:flutter/material.dart';
import 'package:weisro/core/utils/sized_box_extension.dart';
import 'package:weisro/core/widgets/app_button.dart';
import 'package:weisro/core/widgets/custom_text_form_filed.dart';
import 'package:weisro/core/widgets/logo_image_widget.dart';
import 'package:weisro/core/widgets/title_for_text_from_filed.dart';
import 'package:weisro/feature/auth/login/presentation/view/widgets/forget_password_button.dart';
import 'package:weisro/feature/auth/register/presentation/view/widgets/labeled_border_box.dart';
import 'package:weisro/generated/l10n.dart';

class LoginPageViewBody extends StatelessWidget {
  const LoginPageViewBody({super.key});

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
          const SliverToBoxAdapter(
            child: CustomTextFormFiled(hintText: "UserName@example.com"),
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
          const SliverToBoxAdapter(
            child: CustomTextFormFiled(hintText: "******"),
          ),
          SliverToBoxAdapter(
            child: 4.kh,
          ),
          SliverToBoxAdapter(
              child: Align(
            alignment: AlignmentDirectional.bottomEnd,
            child: ForgetPasswordButton(
              onPressed: () {},
            ),
          )),
          SliverToBoxAdapter(
            child: 23.kh,
          ),
          SliverToBoxAdapter(
            child: AppButton(
              onPressed: () {},
              text: S.of(context).Log_in,
            ),
          )
        ],
      ),
    );
  }
}
