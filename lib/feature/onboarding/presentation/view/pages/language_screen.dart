import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:weisro/core/assets_path/icons_path.dart';
import 'package:weisro/core/manager/language_cubit/language_cubit.dart';
import 'package:weisro/core/styles/app_color.dart';
import 'package:weisro/core/styles/app_style.dart';
import 'package:weisro/core/utils/constant.dart';
import 'package:weisro/core/utils/helper_functions.dart';
import 'package:weisro/core/utils/sized_box_extension.dart';
import 'package:weisro/feature/onboarding/presentation/view/pages/onboarding_page_view.dart';
import 'package:weisro/feature/onboarding/presentation/view/widgets/text_language_widget.dart';

class LanguageScreen extends StatelessWidget {
  const LanguageScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    LanguageCubit languageCubit = LanguageCubit.get(context);

    return Scaffold(
      body: SingleChildScrollView(
        child: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              SizedBox(
                height: MediaQuery.of(context).size.height * 0.15,
              ),
              const TextLanWidget(),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  10.kw,
                  Expanded(
                    child: _LanguageOption(
                      onTap: () => _changeLanguage(
                        context,
                        languageCubit,
                        Constants.englishLanguage,
                      ),
                      assetPath: IconsPath.iconsUnitedKingdom,
                      label: 'English',
                    ),
                  ),
                  10.kw,
                  Expanded(
                    child: _LanguageOption(
                      onTap: () => _changeLanguage(
                        context,
                        languageCubit,
                        Constants.deutschLanguage,
                      ),
                      assetPath: IconsPath.iconsFlagGermany,
                      label: 'Deutsch',
                    ),
                  ),
                  10.kw,
                ],
              ),
              10.kh,
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  10.kw,
                  Expanded(
                    child: _LanguageOption(
                      onTap: () => _changeLanguage(
                        context,
                        languageCubit,
                        Constants.espanolLanguage,
                      ),
                      assetPath: IconsPath.iconsSpain,
                      label: 'Espanol',
                    ),
                  ),
                  // 10.kw,
                  // Expanded(
                  //   child: _LanguageOption(
                  //     onTap: () => _changeLanguage(
                  //       context,
                  //       languageCubit,
                  //       Constants.deutschLanguage,
                  //     ),
                  //     assetPath: IconsPath.iconsFlagGermany,
                  //     label: 'Deutsch',
                  //   ),
                  // ),
                  10.kw,
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }

  Future<void> _changeLanguage(
    BuildContext context,
    LanguageCubit languageCubit,
    String selectedLang,
  ) async {
    await languageCubit.changeLocalLang(context, selectedLang: selectedLang);
    if (context.mounted) {
      HelperFunctions.navigateToScreenAndRemove(
        context,
        (context) => const OnBoardingPageView(),
      );
    }
  }
}

class _LanguageOption extends StatelessWidget {
  final VoidCallback onTap;
  final String assetPath;
  final String label;

  const _LanguageOption({
    Key? key,
    required this.onTap,
    required this.assetPath,
    required this.label,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        height: MediaQuery.of(context).size.height * 0.15,
        decoration: BoxDecoration(
          color: AppColors.whiteColor,
          borderRadius: BorderRadius.circular(15),
          boxShadow: const [
            BoxShadow(
              color: Colors.black26,
              offset: Offset(2, 2),
              blurRadius: 4,
            ),
          ],
        ),
        child: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              SvgPicture.asset(assetPath),
              Text(
                label,
                style: AppStyles.style20w500Seconder(context).copyWith(
                  color: AppColors.orangeColor,
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
