import 'package:dio/dio.dart';
import 'package:get_it/get_it.dart';
import 'package:weisro/core/api/api_service.dart';
import 'package:weisro/core/utils/constant.dart';
import 'package:weisro/core/utils/helper_functions.dart';
import 'package:weisro/feature/auth/data/auth_repo/auth_repo.dart';
import 'package:weisro/feature/auth/data/auth_repo/auth_repo_impl.dart';
import 'package:weisro/feature/home/data/home_repo/home_repo.dart';
import 'package:weisro/feature/home/data/home_repo/home_repo_impl.dart';

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
}
