import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_svg/svg.dart';
import 'package:weisro/core/assets_path/icons_path.dart';
import 'package:weisro/core/cache/cache_helper.dart';
import 'package:weisro/core/cache/cache_keys.dart';
import 'package:weisro/core/utils/helper_functions.dart';
import 'package:weisro/core/utils/sized_box_extension.dart';
import 'package:weisro/core/utils/validate.dart';
import 'package:weisro/core/widgets/custom_dialog.dart';
import 'package:weisro/core/widgets/custom_text_form_filed.dart';
import 'package:weisro/core/widgets/material_banner.dart';
import 'package:weisro/feature/auth/otp/presentation/view/pages/otp_page_view.dart';
import 'package:weisro/feature/auth/register/presentation/manager/register_cubit/register_cubit.dart';
import 'package:weisro/feature/auth/register/presentation/view/widgets/custom_phone_input_field.dart';
import 'package:weisro/feature/booking/presentation/view/pages/your_booking_page_view.dart';
import 'package:weisro/feature/home/presentation/managers/bottom_nav_bar_cubit.dart';
import 'package:weisro/feature/profile/presentation/manager/edit_user_info_cubit/edit_user_info_cubit.dart';
import 'package:weisro/feature/profile/presentation/view/pages/edit_profile_page_view.dart';
import 'package:weisro/feature/profile/presentation/view/pages/static_page_view.dart';
import 'package:weisro/feature/profile/presentation/view/pages/user_ads_page_view.dart';
import 'package:weisro/generated/l10n.dart';

class ProfileOption {
  final String title;
  final String icon;
  final void Function()? onTap;
  ProfileOption(this.onTap, {required this.title, required this.icon});
  static List<ProfileOption> profileOptionsList(BuildContext context) {
    EditUserInfoCubit editUserInfoCubit = EditUserInfoCubit.get(context);
    return [
      ProfileOption(() {
        HelperFunctions.navigateToScreen(
          context,
          (context) => const EditProfilePageView(),
        );
      },
          title: S.of(context).EditPersonalInformation,
          icon: IconsPath.iconsEdit),
      ProfileOption(() {
        CustomDialog.showEditDialog(
          context,
          S.of(context).change_phone_number,
          CustomPhoneInput(
            phoneController: context.read<EditUserInfoCubit>().phoneController,
            countryCode: CacheHelper.getData(key: CacheKeys.kCountryCode),
          ),
          IconsPath.iconsPhone,
          () async {
            await editUserInfoCubit.editUser({
              "phone": context.read<EditUserInfoCubit>().phoneController.text
            });
          },
          () {},
          () {},
        );
      }, title: S.of(context).ChangeMobileNumber, icon: IconsPath.iconsPhone),
      ProfileOption(() {
        editUserInfoCubit.oldPasswordController.clear();
        editUserInfoCubit.passwordController.clear();
        editUserInfoCubit.confirmPasswordController.clear();
        final messengerChangePassword = ScaffoldMessenger.of(context);

        CustomDialog.showEditDialog(
          context,
          S.of(context).change_password,
          Form(
            key: editUserInfoCubit.changePasswordFormKey,
            child: Column(
              children: [
                CustomTextFormFiled(
                  hintText: S.of(context).Old_Password,
                  controller: editUserInfoCubit.oldPasswordController,
                  prefixIcon: SvgPicture.asset(
                    width: 20,
                    height: 20,
                    IconsPath.iconsLock,
                    fit: BoxFit.scaleDown,
                  ),
                  validator: (value) =>
                      Validate.validatePassword(value, context),
                ),
                10.kh,
                CustomTextFormFiled(
                  hintText: S.of(context).Password,
                  controller: editUserInfoCubit.passwordController,
                  prefixIcon: SvgPicture.asset(
                    width: 20,
                    height: 20,
                    IconsPath.iconsLock,
                    fit: BoxFit.scaleDown,
                  ),
                  validator: (value) =>
                      Validate.validatePassword(value, context),
                ),
                10.kh,
                CustomTextFormFiled(
                  hintText: S.of(context).Confirm_Password,
                  controller: editUserInfoCubit.confirmPasswordController,
                  prefixIcon: SvgPicture.asset(
                    width: 20,
                    height: 20,
                    IconsPath.iconsLock,
                    fit: BoxFit.scaleDown,
                  ),
                  validator: (value) => Validate.validateConfirmPassword(value,
                      editUserInfoCubit.passwordController.text, context),
                ),
              ],
            ),
          ),
          IconsPath.iconsLock,
          () async {
            if (HelperFunctions.validateForm(
                editUserInfoCubit.changePasswordFormKey)) {
              await editUserInfoCubit.editUser({
                "old_password": editUserInfoCubit.oldPasswordController.text,
                "password": editUserInfoCubit.passwordController.text
              });
            }
          },
          () {
            MaterialBanner materialBanner =
                CustomMaterialBanner.successMaterialBanner(
                    S.of(context).Update_Successful,
                    S.of(context).Information_Updated_Successfully);
            ScaffoldMessenger.of(context)
              ..hideCurrentMaterialBanner()
              ..showMaterialBanner(materialBanner);

            Future.delayed(const Duration(seconds: 3), () {
              messengerChangePassword.hideCurrentMaterialBanner();
            });
          },
          () {
            MaterialBanner materialBanner =
                CustomMaterialBanner.failureMaterialBanner(
                    S.of(context).Update_Failed, "");
            ScaffoldMessenger.of(context)
              ..hideCurrentMaterialBanner()
              ..showMaterialBanner(materialBanner);

            Future.delayed(const Duration(seconds: 3), () {
              messengerChangePassword.hideCurrentMaterialBanner();
            });
          },
        );
      }, title: S.of(context).ChangePassword, icon: IconsPath.iconsLock),
      ProfileOption(() {
        CustomDialog.showEditDialog(
          context,
          S.of(context).change_email_address,
          Form(
            key: editUserInfoCubit.emailFormKey,
            child: CustomTextFormFiled(
              hintText: S.of(context).Email,
              controller: editUserInfoCubit.emailController,
              keyboardType: TextInputType.emailAddress,
              validator: (value) => Validate.validateEmail(value, context),
              prefixIcon: SvgPicture.asset(
                width: 20,
                height: 20,
                IconsPath.iconsMail,
                fit: BoxFit.scaleDown,
              ),
            ),
          ),
          IconsPath.iconsMail,
          () async {
            if (HelperFunctions.validateForm(editUserInfoCubit.emailFormKey)) {
              await editUserInfoCubit
                  .editUser({"email": editUserInfoCubit.emailController.text});
            }
          },
          () {
            HelperFunctions.navigateToScreen(
              context,
              (context) => BlocProvider(
                create: (context) => RegisterCubit(),
                child: OtpPageView(
                  isForgetPassword: false,
                  email: editUserInfoCubit.emailController.text,
                  isChangeEmail: true,
                ),
              ),
            );
          },
          () {},
        );
      }, title: S.of(context).ChangeEmail, icon: IconsPath.iconsMail),
      ProfileOption(() {
        context.read<BottomNavCubit>().changeIndex(0);
      }, title: S.of(context).YourFavorite, icon: IconsPath.iconsFavService),
      ProfileOption(() {
        context.read<BottomNavCubit>().changeIndex(1);
      }, title: S.of(context).YourOrder, icon: IconsPath.iconsTaks),
      ProfileOption(() {
        HelperFunctions.navigateToScreen(
            context, (context) => const UserAdsPageView());
      }, title: S.of(context).YourPosts, icon: IconsPath.iconsPost),
      ProfileOption(() {
        HelperFunctions.navigateToScreen(
            context, (context) => const YourBookingPageView());
      }, title: S.of(context).Your_Booking, icon: IconsPath.iconsUserBooking),
      ProfileOption(() {
        HelperFunctions.navigateToScreen(
          context,
          (context) => PrivacyPolicyPageView(
            appTitle: S.of(context).TermsCondition,
            body: "",
          ),
        );
      }, title: S.of(context).TermsCondition, icon: IconsPath.iconsPost),
      ProfileOption(() {
        HelperFunctions.navigateToScreen(
          context,
          (context) => PrivacyPolicyPageView(
            appTitle: S.of(context).Privacy_Policy,
            body: "",
          ),
        );
      }, title: S.of(context).PrivacyPolicy, icon: IconsPath.iconsAlert),
      ProfileOption(() {
        HelperFunctions.navigateToScreen(
          context,
          (context) => PrivacyPolicyPageView(
            appTitle: S.of(context).PrivacyPolicy,
            body: "",
          ),
        );
      }, title: S.of(context).PrivacyPolicy, icon: IconsPath.iconsAlert),
    ];
  }
}
