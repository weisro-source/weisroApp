import 'dart:developer';
import 'dart:io';
import 'package:day_night_time_picker/day_night_time_picker.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:weisro/core/cache/cache_helper.dart';
import 'package:weisro/core/cache/cache_keys.dart';
import 'package:weisro/core/styles/app_color.dart';
import 'package:weisro/core/styles/app_style.dart';
import 'package:image/image.dart' as img;
import 'package:weisro/core/utils/ansi_color.dart';
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

  static Future<File> resizeImage(
    File imageFile, {
    int maxWidth = 341,
    int maxHeight = 220,
    int quality = 85,
    bool maintainAspectRatio = true,
    bool useWebP = false, // Use WebP for better compression
  }) async {
    try {
      final originalSize = await imageFile.length();
      log(
        AnsiColor.colorize(
          "Original size: ${originalSize / 1024} KB",
          AnsiColor.brightCyan,
        ),
        name: "Resize Image ",
      );

      // Decode the image
      final bytes = await imageFile.readAsBytes();
      final originalImage = img.decodeImage(Uint8List.fromList(bytes));

      if (originalImage == null) {
        log(
          AnsiColor.colorize(
            "Failed to decode image. Returning original file.",
            AnsiColor.red,
          ),
          name: "Resize Image ERROR",
        );
        return imageFile;
      }

      // Calculate new dimensions
      int newWidth = maxWidth;
      int newHeight = maxHeight;

      if (maintainAspectRatio) {
        final aspectRatio = originalImage.width / originalImage.height;
        if (originalImage.width > originalImage.height) {
          newWidth = maxWidth;
          newHeight = (maxWidth / aspectRatio).toInt();
        } else {
          newHeight = maxHeight;
          newWidth = (maxHeight * aspectRatio).toInt();
        }
      }

      // Resize the image
      final resizedImage =
          img.copyResize(originalImage, width: newWidth, height: newHeight);

      // Encode the image with selected format
      Uint8List resizedBytes;

      resizedBytes =
          Uint8List.fromList(img.encodeJpg(resizedImage, quality: quality));

      // Save to file
      final resizedFile = await writeToFile(resizedBytes, useWebP);

      final resizedSize = await resizedFile.length();

      log(
        AnsiColor.colorize(
          "esized size: ${resizedSize / 1024} KB  Size reduction: ${(1 - (resizedSize / originalSize)) * 100}%",
          AnsiColor.brightCyan,
        ),
        name: "Resize Image ",
      );

      return resizedFile;
    } catch (e) {
      log(
        AnsiColor.colorize(
          "Error resizing image: $e",
          AnsiColor.red,
        ),
        name: "Resize Image ERROR",
      );
      return imageFile;
    }
  }

  // Writes the resized image to a temporary file
  static Future<File> writeToFile(Uint8List bytes, bool useWebP) async {
    final tempDir = await Directory.systemTemp.createTemp();
    final filePath =
        '${tempDir.path}/resized_image_${DateTime.now().millisecondsSinceEpoch}.${useWebP ? 'webp' : 'jpg'}';
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
        is24HrFormat: true,
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

  static String getFormattedDate(DateTime date,
      {String format = 'dd/MM/yyyy'}) {
    /// formatting date based on the provided format
    return DateFormat(format).format(date);
  }

  /// Get the date for a specific day of the week (e.g., "Sunday", "Monday")
  static String getDateForDay(String dayKey) {
    // Define a mapping of day names to integers (Sunday = 0, Monday = 1, ..., Saturday = 6)
    Map<String, int> dayToIndex = {
      "Sunday": DateTime.sunday,
      "Monday": DateTime.monday,
      "Tuesday": DateTime.tuesday,
      "Wednesday": DateTime.wednesday,
      "Thursday": DateTime.thursday,
      "Friday": DateTime.friday,
      "Saturday": DateTime.saturday,
    };

    // Get the current date
    DateTime now = DateTime.now();

    // Find the weekday index of the current date (Sunday = 7 -> 0 for compatibility)
    int currentWeekday = now.weekday % 7;

    // Get the target weekday index
    int? targetWeekday = dayToIndex[dayKey];

    if (targetWeekday == null) {
      return ''; // Return an empty string if the dayKey is invalid
    }

    // Calculate the difference between the target and current weekday
    int difference = targetWeekday - currentWeekday;

    // Compute the date for the target day
    DateTime targetDate = now.add(Duration(days: difference));

    // Format the date as "MMM dd" (e.g., "Dec 18")
    String formattedDate = DateFormat('MMM dd').format(targetDate);

    return formattedDate;
  }

  /// Converts a date string (e.g., "2025-01-19") to the day of the week (e.g., "Sunday").
  static String dateToDay(String dateString) {
    try {
      // Parse the date string with the format "yyyy-MM-dd"
      final date = DateFormat('yyyy-MM-dd').parse(dateString);
      // Format to get the day name
      return DateFormat('EEEE').format(date); // e.g., "Sunday"
    } catch (e) {
      // Return a default value in case of an error
      return 'Invalid date';
    }
  }

  static String truncateToHour(String time) {
    // Split the time string (e.g., "11:45" -> ["11", "45"])
    List<String> parts = time.split(':');
    // Return the hour part only
    return parts[0];
  }

  static bool isCurrentUser(String userId) {
    if (userId == CacheHelper.getData(key: CacheKeys.kUserId)) {
      return true;
    } else {
      return false;
    }
  }

  static bool isWorker() {
    String userRole = CacheHelper.getData(key: CacheKeys.kUserRole);
    if (userRole == Constants.workerRole) {
      return true;
    } else {
      return false;
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
