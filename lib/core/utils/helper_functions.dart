import 'dart:io';

import 'package:flutter/cupertino.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:weisro/core/styles/app_style.dart';

class HelperFunctions {
  static void navigateToScreen(BuildContext context, WidgetBuilder screen) {
    Navigator.push(
      context,
      CupertinoPageRoute(
        builder: (context) => screen(context),
      ),
    );
  }

  static void navigateToScreenAndRemove(
      BuildContext context, WidgetBuilder screen) {
    Navigator.pushAndRemoveUntil(
      context,
      CupertinoPageRoute(
        builder: (_) => screen(context),
      ),
      (route) {
        return false;
      },
    );
  }

  static void navigateToBack(BuildContext context) {
    Navigator.of(context).pop();
  }

  static bool isDebugMode() {
    return kDebugMode;
  }

  static void showCustomDialog(BuildContext context, Widget dialog) {
    showDialog(
      context: context,
      builder: (context) {
        return dialog;
      },
    );
  }

  static double getScreenWidth(BuildContext context) {
    return MediaQuery.of(context).size.width;
  }

  static double getScreenHight(BuildContext context) {
    return MediaQuery.of(context).size.height;
  }

  static WidgetSpan textButtonSpan(
      BuildContext context, void Function()? onPressed, String text) {
    return WidgetSpan(
      child: TextButton(
        onPressed: onPressed,
        style: TextButton.styleFrom(
          padding: const EdgeInsetsDirectional.only(
            start: 5,
          ),
          minimumSize: const Size(0, 0),
          tapTargetSize: MaterialTapTargetSize.shrinkWrap,
        ),
        child: Text(
          text,
          style: AppStyles.style12w500Orange(context),
        ),
      ),
    );
  }

  static bool isAndroid() {
    return Platform.isAndroid;
  }

  static bool isIOS() {
    return Platform.isIOS;
  }

  static void requestNextFocus(
      FocusNode currentNode, FocusNode nextNode, BuildContext context) {
    currentNode.unfocus(); // Unfocus the current field

    FocusScope.of(context).requestFocus(nextNode); // Request focus
  }

  static bool validateForm(GlobalKey<FormState> formKey) {
    return formKey.currentState?.validate() ?? false;
  }
}




















  // static void failureSnackBar(
  //   BuildContext context, {
  //   required String errMessage,
  // }) {
  //   showTopSnackBar(
  //     Overlay.of(context),
  //     CustomSnackBar.error(
  //       message: errMessage,
  //     ),
  //   );
  // }

  // static void warningSnackBar(
  //   BuildContext context, {
  //   required String infoMessage,
  // }) {
  //   showTopSnackBar(
  //     Overlay.of(context),
  //     CustomSnackBar.info(
  //       message: infoMessage,
  //     ),
  //   );
  // }

  // static void successSnackBar(
  //   BuildContext context, {
  //   required String successMessage,
  // }) {
  //   showTopSnackBar(
  //     Overlay.of(context),
  //     CustomSnackBar.success(
  //       message: successMessage,
  //       backgroundColor: AppColor.primaryColor,
  //     ),
  //   );

  // static Future<dynamic> logOutFunctionDialog(BuildContext context) {
  //   return showDialog(
  //     context: context,
  //     builder: (context) => AlertDialog(
  //       // content: Text(""),
  //       title: AppTextTitle(
  //         text: S.of(context).are_you_sure_to_log_out,
  //       ),
  //       actions: [
  //         AppButton(
  //           buttonTitle: S.of(context).yes,
  //           onTap: () async {
  //             await HelperFunctions.handleLogout().then((value) {
  //               GoogleAuthCubit.get(context).signOut();
  //               HelperFunctions.navigateToScreenAndRemove(
  //                   context, const LoginPageView());
  //             });
  //           },
  //         ),
  //         const SizedBox(
  //           height: 10,
  //         ),
  //         AppButton(
  //           buttonTitle: S.of(context).no,
  //           onTap: () {
  //             HelperFunctions.navigateToBack(context);
  //           },
  //           buttonColor: AppColor.grey80Color,
  //         ),
  //       ],
  //     ),
  //   );
  // }

  // static SplitPhoneModel splitPhoneNumber(String phoneNumber) {
  //   // Map of country codes to country symbols (ISO 3166-1 alpha-2 codes)

  //   // Find the country code from the map that matches the phone number
  //   String countryCode = Constant.countryCodeMap.keys.firstWhere(
  //     (code) => phoneNumber.startsWith(code),
  //     orElse: () => '',
  //   );
  //   debugPrint('countryCode: ${countryCode}');

  //   // Extract the country symbol from the map
  //   String countrySymbol = Constant.countryCodeMap[countryCode] ?? '';
  //   debugPrint('countrySymbol: ${countrySymbol}');

  //   // Remove the country code from the phone number and add a leading "0" if needed
  //   String localNumber = phoneNumber.substring(countryCode.length);
  //   // if (!localNumber.startsWith('0')) {
  //   //   localNumber = '0$localNumber';
  //   // }

  //   return SplitPhoneModel.fromJson({
  //     'countrySymbol': countrySymbol,
  //     'phoneNumber': localNumber,
  //     "compleatPhone": phoneNumber,
  //   });
  // }

  
