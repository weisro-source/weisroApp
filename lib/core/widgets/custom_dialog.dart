import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_svg/svg.dart';
import 'package:weisro/core/assets_path/image_path.dart';
import 'package:weisro/core/manager/language_cubit/language_cubit.dart';
import 'package:weisro/core/styles/app_color.dart';
import 'package:weisro/core/styles/app_style.dart';
import 'package:weisro/core/utils/constant.dart';
import 'package:weisro/core/utils/helper_functions.dart';
import 'package:weisro/core/utils/sized_box_extension.dart';
import 'package:weisro/core/widgets/app_button.dart';
import 'package:weisro/core/widgets/custom_loading.dart';
import 'package:weisro/feature/profile/presentation/manager/edit_user_info_cubit/edit_user_info_cubit.dart';
import 'package:weisro/generated/l10n.dart';

class CustomDialog {
  static void showCustomDialog(
      BuildContext context, String dialogTitle, String dialogContent) {
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return Dialog(
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(15),
          ),
          elevation: 5,
          backgroundColor: Colors.transparent,
          child: Container(
            width: MediaQuery.of(context).size.width * 0.85,
            decoration: BoxDecoration(
              color: AppColors.whiteColor,
              borderRadius: BorderRadius.circular(15),
              boxShadow: [
                BoxShadow(
                  color: Colors.black.withOpacity(0.1),
                  blurRadius: 10,
                  offset: const Offset(0, 5),
                ),
              ],
            ),
            child: Padding(
              padding: const EdgeInsets.all(20),
              child: Column(
                mainAxisSize: MainAxisSize.min,
                children: [
                  Container(
                    width: double.infinity,
                    padding: const EdgeInsets.symmetric(vertical: 10),
                    child: Column(
                      children: [
                        Image.asset(ImagePath.imagesLogo),
                        5.kh,
                        Text(
                          dialogTitle,
                          style: AppStyles.style20w500White(context).copyWith(
                            color: AppColors.whiteColor,
                            fontWeight: FontWeight.w700,
                          ),
                          textAlign: TextAlign.center,
                        ),
                      ],
                    ),
                  ),
                  const Divider(),
                  const SizedBox(height: 15),
                  Text(
                    dialogContent,
                    style: AppStyles.style16w500Black(context),
                    textAlign: TextAlign.center,
                  ),
                  const SizedBox(height: 25),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      AppButton(
                        height: 45,
                        width: 130,
                        borderColor: Colors.transparent,
                        buttonColor: AppColors.greenColor,
                        text: "Ok",
                        onPressed: () => Navigator.of(context).pop(),
                      ),
                    ],
                  ),
                ],
              ),
            ),
          ),
        );
      },
    );
  }

  static void showLanguageDialog(BuildContext context, String dialogTitle) {
    LanguageCubit languageCubit = LanguageCubit.get(context);
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return Dialog(
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(15),
          ),
          elevation: 5,
          backgroundColor: Colors.transparent,
          child: Container(
            width: MediaQuery.of(context).size.width * 0.85,
            decoration: BoxDecoration(
              color: AppColors.whiteColor,
              borderRadius: BorderRadius.circular(15),
              boxShadow: [
                BoxShadow(
                  color: Colors.black.withOpacity(0.1),
                  blurRadius: 10,
                  offset: const Offset(0, 5),
                ),
              ],
            ),
            child: Padding(
              padding: const EdgeInsets.all(20),
              child: BlocBuilder<LanguageCubit, LanguageState>(
                builder: (context, state) {
                  return Column(
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      Container(
                        width: double.infinity,
                        padding: const EdgeInsets.symmetric(vertical: 10),
                        child: Column(
                          children: [
                            Image.asset(ImagePath.imagesLogo),
                            5.kh,
                            Text(
                              dialogTitle,
                              style:
                                  AppStyles.style20w500White(context).copyWith(
                                color: AppColors.whiteColor,
                                fontWeight: FontWeight.w700,
                              ),
                              textAlign: TextAlign.center,
                            ),
                          ],
                        ),
                      ),
                      const Divider(),
                      const SizedBox(height: 15),
                      LanguageButton(
                        language: "English",
                        isSelected: state is EnglishLanguage,
                        onTap: () {
                          languageCubit.changeLocalLang(context,
                              selectedLang: Constants.englishLanguage);
                        },
                      ),
                      15.kh,
                      LanguageButton(
                        language: "Deutsch",
                        isSelected: state is DeutschLanguage,
                        onTap: () {
                          languageCubit.changeLocalLang(context,
                              selectedLang: Constants.deutschLanguage);
                        },
                      ),
                      const SizedBox(height: 25),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          AppButton(
                            height: 45,
                            width: 130,
                            borderColor: Colors.transparent,
                            buttonColor: AppColors.redColor,
                            text: S.of(context).Cancel,
                            onPressed: () => Navigator.of(context).pop(),
                          ),
                        ],
                      ),
                    ],
                  );
                },
              ),
            ),
          ),
        );
      },
    );
  }

  static void showEditDialog(
    BuildContext context,
    String dialogTitle,
    Widget body,
    String iconPath,
    void Function()? onPressed,
    void Function()? onSuccess,
  ) {
    showDialog(
      context: context,
      builder: (context) {
        return Dialog(
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(15),
          ),
          elevation: 5,
          backgroundColor: Colors.transparent,
          shadowColor: AppColors.shadow2Color,
          child: Container(
            width: MediaQuery.of(context).size.width * 0.9,
            height: MediaQuery.of(context).size.height * 0.35,
            decoration: BoxDecoration(
              color: AppColors.whiteColor,
              borderRadius: BorderRadius.circular(15),
              boxShadow: [
                BoxShadow(
                  color: Colors.black.withOpacity(0.1),
                  blurRadius: 10,
                  offset: const Offset(0, 5),
                ),
              ],
            ),
            child: Column(
              children: [
                31.kh,
                Center(
                  child: Row(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      SvgPicture.asset(iconPath, width: 20, height: 20),
                      2.kw,
                      Text(
                        dialogTitle,
                        style: AppStyles.style14w400Grey(context),
                      ),
                    ],
                  ),
                ),
                30.kh,
                Padding(
                  padding:
                      const EdgeInsetsDirectional.symmetric(horizontal: 24),
                  child: body,
                ),
                30.kh,
                BlocConsumer<EditUserInfoCubit, EditUserInfoState>(
                  listener: (context, editUserState) {
                    if (editUserState is EditUserInfoSuccess) {
                      onSuccess;
                    }
                  },
                  builder: (context, editUserState) {
                    if (editUserState is EditUserInfoLoading) {
                      return const CustomLoading(
                        animationType: "discreteCircular",
                        size: 40,
                      );
                    } else {
                      return AppButton(
                        width: 174,
                        height: 32,
                        text: S.of(context).Ok,
                        onPressed: onPressed,
                      );
                    }
                  },
                )
              ],
            ),
          ),
        );
      },
    );
  }

  static Future<bool> showDeleteConfirmationDialog(
      BuildContext context, String dialogTitle, String body) async {
    return await showDialog<bool>(
          context: context,
          builder: (context) {
            return Dialog(
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(15),
              ),
              elevation: 5,
              backgroundColor: Colors.transparent,
              shadowColor: AppColors.shadow2Color,
              child: Container(
                width: MediaQuery.of(context).size.width * 0.9,
                height: MediaQuery.of(context).size.height * 0.35,
                decoration: BoxDecoration(
                  color: AppColors.whiteColor,
                  borderRadius: BorderRadius.circular(15),
                  boxShadow: [
                    BoxShadow(
                      color: Colors.black.withOpacity(0.1),
                      blurRadius: 10,
                      offset: const Offset(0, 5),
                    ),
                  ],
                ),
                child: Column(
                  children: [
                    31.kh,
                    Center(
                      child: Row(
                        crossAxisAlignment: CrossAxisAlignment.center,
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Image.asset(ImagePath.imagesLogo),
                        ],
                      ),
                    ),
                    10.kh,
                    Text(
                      dialogTitle,
                      style: AppStyles.style14w500Grey(context),
                    ),
                    10.kh,
                    Text(
                      body,
                      style: AppStyles.style14w400Grey(context),
                    ),
                    30.kh,
                    Row(
                      children: [
                        10.kw,
                        Expanded(
                          child: AppButton(
                            width: 174,
                            height: 32,
                            text: S.of(context).Ok,
                            onPressed: () =>
                                Navigator.of(context).pop(true), // Confirm,
                          ),
                        ),
                        10.kw,
                        Expanded(
                          child: AppButton(
                              width: 174,
                              height: 32,
                              text: S.of(context).Cancel,
                              borderColor: AppColors.lightgrey2Color,
                              buttonColor: AppColors.lightgrey2Color,
                              onPressed: () =>
                                  Navigator.of(context).pop(false)),
                        ),
                        10.kw,
                      ],
                    ),
                  ],
                ),
              ),
            );
          },
        ) ??
        false; // Default to false if dialog is dismissed
  }

  static void showLogoutDialog(
    BuildContext context,
  ) {
    showDialog(
      context: context,
      builder: (context) {
        return Dialog(
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(15),
          ),
          elevation: 5,
          backgroundColor: Colors.transparent,
          shadowColor: AppColors.shadow2Color,
          child: Container(
            width: MediaQuery.of(context).size.width * 0.9,
            height: MediaQuery.of(context).size.height * 0.2,
            decoration: BoxDecoration(
              color: AppColors.whiteColor,
              borderRadius: BorderRadius.circular(15),
              boxShadow: [
                BoxShadow(
                  color: Colors.black.withOpacity(0.1),
                  blurRadius: 10,
                  offset: const Offset(0, 5),
                ),
              ],
            ),
            child: Column(
              children: [
                31.kh,
                Center(
                  child: Text(
                    S.of(context).Logout,
                    style: AppStyles.style18w400Grey(context)
                        .copyWith(color: AppColors.blackColor),
                  ),
                ),
                30.kh,
                Row(
                  children: [
                    19.kw,
                    Expanded(
                      child: AppButton(
                        width: 174,
                        height: 32,
                        text: S.of(context).Ok,
                        borderColor: AppColors.redColor,
                        buttonColor: AppColors.redColor,
                        onPressed: () async {
                          await HelperFunctions.logoutFunction(context);
                        },
                      ),
                    ),
                    10.kw,
                    Expanded(
                      child: AppButton(
                        width: 174,
                        height: 32,
                        text: S.of(context).Cancel,
                        borderColor: AppColors.lightgrey2Color,
                        buttonColor: AppColors.lightgrey2Color,
                        onPressed: () {
                          HelperFunctions.navigateToBack(context);
                        },
                      ),
                    ),
                    19.kw,
                  ],
                )
              ],
            ),
          ),
        );
      },
    );
  }
}

class LanguageButton extends StatelessWidget {
  const LanguageButton({
    super.key,
    required this.language,
    required this.isSelected,
    this.onTap,
  });
  final String language;
  final bool isSelected;
  final void Function()? onTap;
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        height: 60,
        decoration: BoxDecoration(
          color: AppColors.whiteColor,
          borderRadius: BorderRadius.circular(8),
          border: Border.all(
              color: isSelected ? AppColors.orangeColor : AppColors.greyColor,
              width: 1),
        ),
        child: Center(
          child: Text(
            language,
            style: AppStyles.style18w500Green(context),
          ),
        ),
      ),
    );
  }
}
