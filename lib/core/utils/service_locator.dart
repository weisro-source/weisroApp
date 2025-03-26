import 'dart:io';

import 'package:dio/dio.dart';
import 'package:dio/io.dart';
import 'package:get_it/get_it.dart';
import 'package:weisro/core/api/api_service.dart';
import 'package:weisro/core/utils/constant.dart';
import 'package:weisro/core/utils/helper_functions.dart';
import 'package:weisro/feature/ads/data/ads_repo/ads_repo.dart';
import 'package:weisro/feature/ads/data/ads_repo/ads_repo_impl.dart';
import 'package:weisro/feature/auth/data/auth_repo/auth_repo.dart';
import 'package:weisro/feature/auth/data/auth_repo/auth_repo_impl.dart';
import 'package:weisro/feature/booking/data/booking_repo/booking_repo.dart';
import 'package:weisro/feature/booking/data/booking_repo/booking_repo_impl.dart';
import 'package:weisro/feature/favorite/data/favorite_repo/favorite_repo.dart';
import 'package:weisro/feature/favorite/data/favorite_repo/favorite_repo_impl.dart';
import 'package:weisro/feature/home/data/home_repo/home_repo.dart';
import 'package:weisro/feature/home/data/home_repo/home_repo_impl.dart';
import 'package:weisro/feature/notifications/data/repo/notifications_repo.dart';
import 'package:weisro/feature/notifications/data/repo/notifications_repo_impl.dart';
import 'package:weisro/feature/orders/data/order_repo/order_repo.dart';
import 'package:weisro/feature/orders/data/order_repo/order_repo_impl.dart';
import 'package:weisro/feature/profile/data/account_repo/account_repo.dart';
import 'package:weisro/feature/profile/data/account_repo/account_repo_impl.dart';
import 'package:weisro/feature/services/data/service_repo/service_repo.dart';
import 'package:weisro/feature/services/data/service_repo/service_repo_impl.dart';
import 'package:weisro/feature/worker/data/repo/worker_repo.dart';
import 'package:weisro/feature/worker/data/repo/worker_repo_imple.dart';

final GetIt getIt = GetIt.instance;

void setupServiceLocator() {
  final Dio dio = _createDioInstance();

  getIt.registerSingleton<Dio>(dio);
  getIt.registerSingleton<ApiService>(ApiService(dio));

  _registerRepositories();
}

Dio _createDioInstance() {
  final Dio dio = Dio(
    BaseOptions(
      baseUrl: HelperFunctions.isDebugMode()
          ? Constants.debugUrl
          : Constants.releaseUrl,
    ),
  );

  if (HelperFunctions.isDebugMode()) {
    (dio.httpClientAdapter as IOHttpClientAdapter).onHttpClientCreate =
        (HttpClient client) {
      client.badCertificateCallback =
          (X509Certificate cert, String host, int port) => true;
      return client;
    };
  }

  return dio;
}

void _registerRepositories() {
  getIt.registerSingleton<AuthenticationRepository>(
      AuthenticationRepositoryImplementation());
  getIt.registerSingleton<HomeRepository>(HomeRepositoryImplementation());
  getIt.registerSingleton<ServiceRepository>(ServiceRepositoryImplementation());
  getIt.registerSingleton<AccountRepository>(AccountRepositoryImplementation());
  getIt.registerSingleton<FavoriteRepository>(
      FavoriteRepositoryImplementation());
  getIt.registerSingleton<AdsRepository>(AdsRepositoryImplementation());
  getIt.registerSingleton<BookingRepository>(BookingRepositoryImplementation());
  getIt.registerSingleton<OrderRepository>(OrderRepositoryImplementation());
  getIt.registerSingleton<WorkerRepository>(WorkerRepositoryImplementation());
  getIt.registerSingleton<NotificationsRepository>(
      NotificationsRepositoryImplementation());
}
