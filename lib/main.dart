import 'dart:io';

import 'package:device_preview/device_preview.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:weisro/core/utils/helper_functions.dart';
import 'package:weisro/core/utils/service_locator.dart';
import 'package:weisro/wisro_app.dart';

void main() {
  // for ensure doing all lines before "runApp function"
  WidgetsFlutterBinding.ensureInitialized();

  // --------------------------------------------------
  // for make device can not rotate
  SystemChrome.setPreferredOrientations([
    DeviceOrientation.portraitUp,
    DeviceOrientation.portraitDown,
  ]);
  // --------------------------------------------------
  // for initialized `ServiceLocator` for `getIt` package
  setupServiceLocator();
  runApp(
    DevicePreview(
      availableLocales: const [Locale('en'), Locale('de')],
      enabled: HelperFunctions.isDebugMode() && !HelperFunctions.isAndroid(),
      builder: (context) => const WeisroApp(),
    ),
  );
}
