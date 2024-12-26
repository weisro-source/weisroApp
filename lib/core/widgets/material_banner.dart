import 'package:awesome_snackbar_content/awesome_snackbar_content.dart';
import 'package:flutter/material.dart';

class CustomMaterialBanner {
  static MaterialBanner successMaterialBanner(String title, String message) {
    return MaterialBanner(
      /// need to set following properties for best effect of awesome_snackbar_content
      elevation: 0,
      backgroundColor: Colors.transparent,
      forceActionsBelow: true,
      
      content: AwesomeSnackbarContent(
        title: title,
        message: message,

        /// change contentType to ContentType.success, ContentType.warning or ContentType.help for variants
        contentType: ContentType.success,
        // to configure for material banner
        inMaterialBanner: true,
      ),
      actions: const [SizedBox.shrink()],
    );
  }

  static MaterialBanner failureMaterialBanner(String title, String message) {
    return MaterialBanner(
      elevation: 0,
      backgroundColor: Colors.transparent,
      forceActionsBelow: true,
      content: AwesomeSnackbarContent(
        title: title,
        message: message,

        /// ContentType set to warning for failure case
        contentType: ContentType.failure,
        inMaterialBanner: true,
      ),
      actions: const [SizedBox.shrink()],
    );
  }
}
