import 'package:dio/dio.dart';
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
import 'package:weisro/feature/notifications/data/repo/notifications_repo_impl.dart';
import 'package:weisro/feature/notifications/data/repo/notifications_repo.dart';
import 'package:weisro/feature/orders/data/order_repo/order_repo.dart';
import 'package:weisro/feature/orders/data/order_repo/order_repo_impl.dart';
import 'package:weisro/feature/profile/data/account_repo/account_repo.dart';
import 'package:weisro/feature/profile/data/account_repo/account_repo_impl.dart';
import 'package:weisro/feature/services/data/service_repo/service_repo.dart';
import 'package:weisro/feature/services/data/service_repo/service_repo_impl.dart';
import 'package:weisro/feature/worker/data/repo/worker_repo.dart';
import 'package:weisro/feature/worker/data/repo/worker_repo_imple.dart';

final getIt = GetIt.instance;

void setupServiceLocator() {
  getIt.registerSingleton<Dio>(
    Dio(
      BaseOptions(
        baseUrl: HelperFunctions.isDebugMode()
            ? Constants.debugUrl
            : Constants.releaseUrl,
      ),
    ),
  );
  getIt.registerSingleton<ApiService>(
    ApiService(
      getIt.get<Dio>(),
    ),
  );
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
