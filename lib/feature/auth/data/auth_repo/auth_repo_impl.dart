import 'dart:developer';

import 'package:dartz/dartz.dart';
import 'package:dio/dio.dart';
import 'package:weisro/core/api/api_end_points.dart';
import 'package:weisro/core/api/api_error_handler.dart';
import 'package:weisro/core/api/api_service.dart';
import 'package:weisro/core/utils/logger.dart';
import 'package:weisro/core/utils/service_locator.dart';
import 'package:weisro/feature/auth/data/auth_repo/auth_repo.dart';
import 'package:weisro/feature/auth/data/models/success_register_model.dart';
import 'package:weisro/feature/auth/data/models/user_client_model.dart';

class AuthenticationRepositoryImplementation
    implements AuthenticationRepository {
  final ApiService _apiService = getIt<ApiService>();
  @override
  Future<Either<Failure, SuccessRegisterModel>> clientRegisterApi(
      UserClientModel userToRegister, CancelToken cancelToken) async {
    log("Login User Client Attempt With body ${userToRegister.toJson()}");

    try {
      var response = await _apiService.post(
          endPoint: ApiEndPoints.clientRegisterEndPoint,
          needToken: false,
          cancelToken: cancelToken,
          data: userToRegister.toJson());
      return right(SuccessRegisterModel.fromJson(response));
    } catch (errorInClientRegister) {
      LoggerHelper.logError(
          errorInClientRegister, ApiEndPoints.clientRegisterEndPoint);
      return left(ErrorHandler.handleError(errorInClientRegister));
    }
  }
}
