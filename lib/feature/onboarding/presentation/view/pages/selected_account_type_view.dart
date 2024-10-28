import 'package:flutter/material.dart';
import 'package:weisro/core/assets_path/icons_path.dart';
import 'package:weisro/core/styles/app_color.dart';
import 'package:weisro/core/styles/app_style.dart';
import 'package:weisro/core/utils/sized_box_extension.dart';
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
    if (accountType == 0) {
      //! navigation to worker Auth
    } else if (accountType == 1) {
      //*navigation to User Auth
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            154.kh,
            Padding(
              padding: const EdgeInsetsDirectional.only(start: 32, end: 24),
              child: Row(
                children: [
                  Container(
                    width: 10,
                    height: 10,
                    decoration: BoxDecoration(
                      color: AppColors.orangeColor,
                      border:
                          Border.all(color: AppColors.greyColor, width: 0.5),
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
            28.kh,
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                AccountType(
                  title: S.of(context).Worker,
                  iconPath: IconsPath.iconsWorker,
                  isSelected: selectedAccountType == 0,
                  onTap: () => _onAccountTypeTap(0),
                ),
                12.kw,
                AccountType(
                  title: S.of(context).Client,
                  iconPath: IconsPath.iconsUser,
                  isSelected: selectedAccountType == 1,
                  onTap: () => _onAccountTypeTap(1),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
