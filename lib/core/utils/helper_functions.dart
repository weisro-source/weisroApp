import 'dart:developer';
import 'dart:io';

import 'package:day_night_time_picker/day_night_time_picker.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:weisro/core/cache/cache_helper.dart';
import 'package:weisro/core/styles/app_color.dart';
import 'package:weisro/core/styles/app_style.dart';
import 'package:image/image.dart' as img;
import 'package:weisro/core/utils/constant.dart';
import 'package:weisro/feature/auth/login/presentation/view/pages/login_page_view.dart';
import 'package:weisro/generated/l10n.dart';

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

  // Resizes the image to a specific width and height
  static Future<File> resizeImage(File imageFile,
      {int width = 200, int height = 200}) async {
    // Print the original file size
    final originalSize = await imageFile.length();
    log("Original size: ${originalSize / 1024} KB");

    // Read bytes and decode the image
    final bytes = await imageFile.readAsBytes();
    final originalImage = img.decodeImage(Uint8List.fromList(bytes));

    if (originalImage != null) {
      // Resize the image
      final resizedImage =
          img.copyResize(originalImage, width: width, height: height);
      final resizedBytes = Uint8List.fromList(img.encodeJpg(resizedImage));

      // Write resized image to a temporary file
      final resizedFile = await writeToFile(resizedBytes);

      // Print the resized file size
      final resizedSize = await resizedFile.length();
      log("Resized size: ${resizedSize / 1024} KB");

      return resizedFile;
    }

    // Return original file if resizing fails
    return imageFile;
  }

  // Writes the resized image to a temporary file
  static Future<File> writeToFile(Uint8List bytes) async {
    final tempDir = await Directory.systemTemp.createTemp();
    final filePath =
        '${tempDir.path}/resized_image_${DateTime.now().millisecondsSinceEpoch}.jpg';
    return File(filePath).writeAsBytes(bytes);
  }

  // this function to mask email as this na***@gmail.com
  static String maskEmail(String email) {
    // Split the email into username and domain parts
    final parts = email.split('@');
    if (parts.length != 2) {
      return email; // Return as-is if it’s not a valid email
    }

    final username = parts[0];
    final domain = parts[1];

    if (username.length < 3) {
      return "$username@$domain"; // Too short to mask, so return as-is
    }

    // Take the first two characters and the last character of the username
    final maskedUsername =
        "${username.substring(0, 2)}******${username.substring(username.length - 1)}";
    return "$maskedUsername@$domain";
  }

  static String? ensureStringOrNull(var message) {
    if (message != null && message is String) {
      return message;
    } else {
      return null;
    }
  }

  static String? ensureIsFirstItemOrNull(List<String> list) {
    if (list.isEmpty) {
      return null;
    } else {
      return list.first;
    }
  }

  static String addImageNameForUrl(String imageName) {
    return "${Constants.imageUrl}$imageName";
  }

  static EdgeInsetsDirectional get symmetricHorizontalPadding24 =>
      const EdgeInsetsDirectional.symmetric(horizontal: 24);
  static EdgeInsetsDirectional get symmetricHorizontalPadding34 =>
      const EdgeInsetsDirectional.symmetric(horizontal: 34);

  static showCustomTimePicker(
      BuildContext context, void Function(DateTime)? onChangeDateTime) {
    Navigator.of(context).push(showPicker(
        context: context,
        onChangeDateTime: onChangeDateTime,
        value: Time(hour: 11, minute: 11),
        sunrise: const TimeOfDay(hour: 6, minute: 0),
        sunset: const TimeOfDay(hour: 18, minute: 0),
        duskSpanInMinutes: 120,
        onChange: (p0) {},
        okText: S.of(context).Ok,
        okStyle: AppStyles.style18w500Green(context),
        cancelText: S.of(context).Cancel,
        cancelStyle: AppStyles.style12w400Black(context)
            .copyWith(color: AppColors.redColor)));
  }

  static Future<void> logoutFunction(BuildContext context) async {
    await CacheHelper.clearCache();
    if (context.mounted) {
      HelperFunctions.navigateToScreenAndRemove(
        context,
        (context) => const LoginPageView(),
      );
    }
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

  
