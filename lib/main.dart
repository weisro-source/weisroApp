import 'package:device_preview/device_preview.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:weisro/core/cache/cache_helper.dart';
import 'package:weisro/core/utils/bloc_observer.dart';
import 'package:weisro/core/utils/helper_functions.dart';
import 'package:weisro/core/utils/service_locator.dart';
import 'package:weisro/wisro_app.dart';

void main() async {
  // for ensure doing all lines before "runApp function"
  WidgetsFlutterBinding.ensureInitialized();
  // --------------------------------------------------
  // for make device can not rotate
  SystemChrome.setPreferredOrientations([
    DeviceOrientation.portraitUp,
    DeviceOrientation.portraitDown,
  ]);
  // --------------------------------------------------
  // for initialized `bloc Observer` for `observing` package
  Bloc.observer = MyBlocObserver();

  // --------------------------------------------------
  // for initialized `ServiceLocator` for `getIt` package
  setupServiceLocator();
  // for initialized `cacheHelper`
  await Future.wait([
    // for initialized cash helper class
    CacheHelper.cacheInit(),
    // --------------------------------------------------
  ]);
  runApp(
    DevicePreview(
      availableLocales: const [Locale('en'), Locale('de')],
      enabled: HelperFunctions.isDebugMode() && !HelperFunctions.isAndroid(),
      builder: (context) => const WeisroApp(),
    ),
  );
}
