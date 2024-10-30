import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:weisro/core/assets_path/icons_path.dart';
import 'package:weisro/core/styles/app_color.dart';
import 'package:weisro/core/styles/app_style.dart';
import 'package:weisro/core/utils/sized_box_extension.dart';
import 'package:weisro/core/widgets/logo_image_widget.dart';
import 'package:weisro/feature/auth/presentation/view/widgets/labeled_border_box.dart';
import 'package:weisro/generated/l10n.dart';

import '../../../../../core/widgets/app_button.dart';
import '../../../../../core/widgets/custom_text_form_filed.dart';
import '../../../../../core/widgets/title_for_text_from_filed.dart';
import '../widgets/custom_steeper_widget.dart';
import '../widgets/have_an_account.dart';

class ClientRegisterPageViewBody extends StatelessWidget {
  const ClientRegisterPageViewBody({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsetsDirectional.only(start: 32, end: 32),
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
            child: 44.kh,
          ),
          const SliverToBoxAdapter(child: CustomSteeperWidget()),
          SliverToBoxAdapter(
            child: 0.kh,
          ),
          SliverToBoxAdapter(
              child: TitleForTextFromFiled(
            title: S.of(context).First_Name,
          )),
          SliverToBoxAdapter(
            child: 5.kh,
          ),
          SliverToBoxAdapter(
            child: CustomTextFormFiled(
              hintText: S.of(context).First_Name,
            ),
          ),
          SliverToBoxAdapter(
            child: 20.kh,
          ),
          SliverToBoxAdapter(
              child: TitleForTextFromFiled(
            title: S.of(context).Last_Name,
          )),
          SliverToBoxAdapter(
            child: 5.kh,
          ),
          SliverToBoxAdapter(
            child: CustomTextFormFiled(
              hintText: S.of(context).Last_Name,
            ),
          ),
          SliverToBoxAdapter(
            child: 20.kh,
          ),
          SliverToBoxAdapter(
              child: TitleForTextFromFiled(
            title: S.of(context).Country,
          )),
          SliverToBoxAdapter(
            child: 5.kh,
          ),
          SliverToBoxAdapter(
            child: CustomTextFormFiled(
              hintText: S.of(context).Country,
            ),
          ),
          SliverToBoxAdapter(
            child: 20.kh,
          ),
          SliverToBoxAdapter(
              child: TitleForTextFromFiled(
            title: S.of(context).City,
          )),
          SliverToBoxAdapter(
            child: 5.kh,
          ),
          SliverToBoxAdapter(
            child: CustomTextFormFiled(
              hintText: S.of(context).City,
            ),
          ),
          SliverToBoxAdapter(
            child: 20.kh,
          ),
          SliverToBoxAdapter(
              child: TitleForTextFromFiled(
            title: S.of(context).Postal_Code,
          )),
          SliverToBoxAdapter(
            child: 5.kh,
          ),
          const SliverToBoxAdapter(
            child: CustomTextFormFiled(
              hintText: "xxxxxx",
            ),
          ),
          SliverToBoxAdapter(
            child: 20.kh,
          ),
          SliverToBoxAdapter(
              child: TitleForTextFromFiled(
            title: S.of(context).Street,
          )),
          SliverToBoxAdapter(
            child: 5.kh,
          ),
          const SliverToBoxAdapter(
            child: CustomTextFormFiled(
              hintText: "",
            ),
          ),
          SliverToBoxAdapter(
            child: 24.kh,
          ),
          SliverToBoxAdapter(
            child: AppButton(onPressed: () {}, text: S.of(context).Next_Step),
          ),
          SliverToBoxAdapter(
            child: 16.kh,
          ),
          SliverToBoxAdapter(
            child: Align(
              alignment: Alignment.center,
              child: Text(
                S.of(context).OR,
                style: AppStyles.style14w400Grey(context)
                    .copyWith(color: AppColors.second2Color),
              ),
            ),
          ),
          SliverToBoxAdapter(
            child: 9.kh,
          ),
          SliverToBoxAdapter(
            child: AppButton(
              onPressed: () {},
              buttonColor: AppColors.second1Color,
              child: Row(
                crossAxisAlignment: CrossAxisAlignment.center,
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  SvgPicture.asset(
                    IconsPath.iconsGoogle,
                  ),
                  8.kw,
                  Text(
                    S.of(context).Sign_Up_with_Google,
                    style: AppStyles.style14w500Grey(context),
                  )
                ],
              ),
            ),
          ),
          SliverToBoxAdapter(
            child: 24.kh,
          ),
          const SliverToBoxAdapter(
            child: HaveAnAccount(),
          ),
          SliverToBoxAdapter(
            child: 31.kh,
          ),
        ],
      ),
    );
  }
}
