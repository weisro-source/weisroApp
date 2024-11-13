import 'dart:developer';

import 'package:dartz/dartz.dart';
import 'package:dio/dio.dart';
import 'package:weisro/core/api/api_end_points.dart';
import 'package:weisro/core/api/api_error_handler.dart';
import 'package:weisro/core/api/api_service.dart';
import 'package:weisro/core/utils/constant.dart';
import 'package:weisro/core/utils/logger.dart';
import 'package:weisro/core/utils/service_locator.dart';
import 'package:weisro/feature/auth/data/auth_repo/auth_repo.dart';
import 'package:weisro/feature/auth/data/models/success_login_model.dart';
import 'package:weisro/feature/auth/data/models/success_register_model.dart';
import 'package:weisro/feature/auth/data/models/user_client_model.dart';

class AuthenticationRepositoryImplementation
    implements AuthenticationRepository {
  final ApiService _apiService = getIt<ApiService>();
  @override
  Future<Either<Failure, SuccessRegisterModel>> clientRegisterApi(
      UserClientModel userToRegister, CancelToken cancelToken) async {
    log("Register User Client Attempt With body ${userToRegister.toJson()}");

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

  @override
  Future<Either<Failure, SuccessLoginModel>> loginApi(
      UserClientModel userToRegister, CancelToken cancelToken) async {
    log("Login User Client Attempt With body ${userToRegister.loginBody()}");

    try {
      var response = await _apiService.post(
          endPoint: ApiEndPoints.loginEndPoint,
          data: userToRegister.loginBody());
      return right(SuccessLoginModel.fromJson(response));
    } catch (errorInLogin) {
      LoggerHelper.logError(errorInLogin, ApiEndPoints.loginEndPoint);
      return left(ErrorHandler.handleError(errorInLogin));
    }
  }

  @override
  Future<Either<Failure, String>> verifyOtpApi(
      Map<String, dynamic> dataToVerify, CancelToken cancelToken) async {
    log("verify Otp  Attempt With body ${dataToVerify.toString()}");
    try {
      var response = await _apiService.post(
          endPoint: ApiEndPoints.verifyAccountEndPoint, data: dataToVerify);
      var message = response['message'];

      if (message is List) {
        message = message.join(', ');
      }

      if (message != null && message is String) {
        return right(message);
      } else {
        return left(ErrorHandler.handleError(Constants.responseIsNull));
      }
    } catch (errorInVerifyOtp) {
      LoggerHelper.logError(errorInVerifyOtp, ApiEndPoints.loginEndPoint);
      return left(ErrorHandler.handleError(errorInVerifyOtp));
    }
  }
}
