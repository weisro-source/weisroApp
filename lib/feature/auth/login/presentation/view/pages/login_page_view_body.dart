import 'package:flutter/material.dart';
import 'package:weisro/core/utils/sized_box_extension.dart';
import 'package:weisro/core/widgets/logo_image_widget.dart';
import 'package:weisro/feature/auth/register/presentation/view/widgets/labeled_border_box.dart';
import 'package:weisro/generated/l10n.dart';

class LoginPageViewBody extends StatelessWidget {
  const LoginPageViewBody({super.key});

  @override
  Widget build(BuildContext context) {
    return CustomScrollView(
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
      ],
    );
  }
}
