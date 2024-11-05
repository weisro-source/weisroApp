import 'package:device_preview/device_preview.dart';
import 'package:flutter/material.dart';
import 'package:weisro/core/utils/helper_functions.dart';
import 'package:weisro/wisro_app.dart';

void main() {
  // for ensure doing all lines before "runApp function"
  WidgetsFlutterBinding.ensureInitialized();
  // --------------------------------------------------
  runApp(
    DevicePreview(
      availableLocales: const [Locale('en'), Locale('de')],
      enabled: HelperFunctions.isDebugMode() && !HelperFunctions.isAndroid(),
      builder: (context) => const WeisroApp(),
    ),
  );
}
