import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:weisro/core/assets_path/image_path.dart';
import 'package:weisro/core/manager/language_cubit/language_cubit.dart';
import 'package:weisro/core/styles/app_color.dart';
import 'package:weisro/core/styles/app_style.dart';
import 'package:weisro/core/utils/constant.dart';
import 'package:weisro/core/utils/sized_box_extension.dart';
import 'package:weisro/core/widgets/app_button.dart';
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
