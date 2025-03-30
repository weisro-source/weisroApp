import 'dart:async';
import 'package:app_links/app_links.dart';
import 'package:flutter/material.dart';
import 'package:share_plus/share_plus.dart';
import 'package:weisro/feature/services/presentation/view/pages/services_details_page_view.dart';

class AppLinksDeepLink {
  AppLinksDeepLink._privateConstructor();

  static final AppLinksDeepLink _instance =
      AppLinksDeepLink._privateConstructor();

  static AppLinksDeepLink get instance => _instance;

  late final AppLinks _appLinks;
  StreamSubscription<Uri>? _linkSubscription;

  void initDeepLinks() async {
    _appLinks = AppLinks();

    try {
      final Uri? initialUri = await _appLinks.getInitialLink();
      if (initialUri != null) {
        _handleDeepLink(initialUri);
      }

      // Listen to deep links when app is running
      _linkSubscription = _appLinks.uriLinkStream.listen(
        (Uri uri) {
          _handleDeepLink(uri);
        },
        onError: (err) {
          debugPrint('Error handling deep link: $err');
        },
      );
    } catch (e) {
      debugPrint('Deep link initialization error: $e');
    }
  }

  void _handleDeepLink(Uri uri) {
    debugPrint('Received deep link: ${uri.toString()}');

    // Extract path and query parameters
    final pathSegments = uri.pathSegments;

    if (pathSegments.isNotEmpty &&
        pathSegments[0] == "en" &&
        pathSegments[1] == "service") {
      String serviceId = pathSegments[2];

      final navigatorKey = GlobalKey<NavigatorState>();

      navigatorKey.currentState?.push(
        MaterialPageRoute(
          builder: (context) => ServicesDetailsPageView(serviceId: serviceId),
        ),
      );
    } else {
      debugPrint("Unknown deep link: ${uri.toString()}");
    }
  }

  void shareDeepLink(String serviceId, String serviceDescription) {
    String deepLink = "https://weisro.com/en/service/$serviceId";
    Share.share('Check out this Service $serviceDescription: $deepLink');
  }

  void dispose() {
    _linkSubscription?.cancel();
  }
}
