import 'package:flutter/material.dart';
import 'package:weisro/core/assets_path/icons_path.dart';
import 'package:weisro/core/styles/app_color.dart';
import 'package:weisro/core/styles/app_style.dart';
import 'package:weisro/core/utils/helper_functions.dart';
import 'package:weisro/core/utils/sized_box_extension.dart';
import 'package:weisro/core/widgets/logo_image_widget.dart';
import 'package:weisro/feature/auth/register/presentation/view/pages/worker_and_client_register_page_view.dart';
import 'package:weisro/feature/onboarding/presentation/view/widgets/circle_button.dart';
import 'package:weisro/generated/l10n.dart';

import '../widgets/account_type.dart';

class SelectedAccountTypeView extends StatefulWidget {
  const SelectedAccountTypeView({Key? key}) : super(key: key);

  @override
  State<SelectedAccountTypeView> createState() =>
      _SelectedAccountTypeViewState();
}

class _SelectedAccountTypeViewState extends State<SelectedAccountTypeView> {
  int selectedAccountType = -1;
// 0 is worker
// 1 is client
  void _onAccountTypeTap(int accountType) {
    setState(() {
      selectedAccountType = accountType;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: SafeArea(
      child: Padding(
        padding: const EdgeInsetsDirectional.symmetric(horizontal: 20),
        child: CustomScrollView(slivers: [
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
          57.sKh,
          SliverToBoxAdapter(
            child: Row(
              children: [
                Container(
                  width: 10,
                  height: 10,
                  decoration: BoxDecoration(
                    color: AppColors.orangeColor,
                    border: Border.all(color: AppColors.greyColor, width: 0.5),
                  ),
                ),
                10.kw,
                Expanded(
                  child: Text(
                    S.of(context).Selected_account,
                    style: AppStyles.style16w500Black(context),
                  ),
                ),
              ],
            ),
          ),
          48.sKh,
          SliverPadding(
            padding: const EdgeInsetsDirectional.only(start: 20),
            sliver: SliverToBoxAdapter(
              child: Column(
                children: [
                  NewAccountTypeWidget(
                    title: S.of(context).Service_Provider,
                    iconPath: IconsPath.iconsWorkerIcon,
                    isSelected: selectedAccountType == 0,
                    onTap: () => _onAccountTypeTap(0),
                  ),
                  39.kh,
                  NewAccountTypeWidget(
                    title: S.of(context).Service_Seeker,
                    iconPath: IconsPath.iconsUserIcon,
                    isSelected: selectedAccountType == 1,
                    onTap: () => _onAccountTypeTap(1),
                  ),
                ],
              ),
            ),
          ),
          48.sKh,
          SliverToBoxAdapter(
            child: Row(
              mainAxisAlignment: MainAxisAlignment.end,
              children: [
                SizedBox(
                  height: 45,
                  width: 45,
                  child: CircleButton(
                    value: 0.5,
                    onTap: () {
                      if (selectedAccountType == 0) {
                        //! navigation to worker Auth
                        HelperFunctions.navigateToScreen(
                          context,
                          (context) => const WorkerAndClientRegisterPageView(
                            isWorkerAuth: true,
                          ),
                        );
                      } else if (selectedAccountType == 1) {
                        //*navigation to User Auth
                        HelperFunctions.navigateToScreen(
                          context,
                          (context) => const WorkerAndClientRegisterPageView(
                            isWorkerAuth: false,
                          ),
                        );
                      }
                    },
                  ),
                ),
              ],
            ),
          )
          // Row(
          //   mainAxisAlignment: MainAxisAlignment.center,
          //   children: [
          //     AccountType(
          //       title: S.of(context).Worker,
          //       iconPath: IconsPath.iconsWorkerIcon,
          //       isSelected: selectedAccountType == 0,
          //       onTap: () => _onAccountTypeTap(0),
          //     ),
          //     12.kw,
          //     AccountType(
          //       title: S.of(context).Client,
          //       iconPath: IconsPath.iconsUserIcon,
          //       isSelected: selectedAccountType == 1,
          //       onTap: () => _onAccountTypeTap(1),
          //     ),
          //   ],
          // ),
        ]),
      ),
    ));
  }
}
