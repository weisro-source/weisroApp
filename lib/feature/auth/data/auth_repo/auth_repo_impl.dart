import 'dart:developer';
import 'package:dartz/dartz.dart';
import 'package:dio/dio.dart';
import 'package:weisro/core/api/api_end_points.dart';
import 'package:weisro/core/api/api_error_handler.dart';
import 'package:weisro/core/api/api_service.dart';
import 'package:weisro/core/utils/constant.dart';
import 'package:weisro/core/utils/helper_functions.dart';
import 'package:weisro/core/utils/logger.dart';
import 'package:weisro/core/utils/service_locator.dart';
import 'package:weisro/feature/auth/data/auth_repo/auth_repo.dart';
import 'package:weisro/feature/auth/data/models/cities_model.dart';
import 'package:weisro/feature/auth/data/models/countries_model.dart';
import 'package:weisro/feature/auth/data/models/success_login_model.dart';
import 'package:weisro/feature/auth/data/models/success_register_model.dart';
import 'package:weisro/feature/auth/data/models/user_client_model.dart';
import 'package:weisro/feature/auth/data/models/worker_tags_model.dart';

/// Implementation of the Authentication Repository
/// Handles API requests for user registration, login, OTP verification, password reset, and password resending
class AuthenticationRepositoryImplementation
    implements AuthenticationRepository {
  // Initialize the ApiService using dependency injection
  final ApiService _apiService = getIt<ApiService>();

  /// Registers a new client user
  /// [userToRegister] - the user data model to register
  /// [cancelToken] - allows the request to be canceled if needed
  /// Returns either a [SuccessRegisterModel] on success or a [Failure] on error
  @override
  Future<Either<Failure, SuccessRegisterModel>> clientRegisterApi(
      UserClientModel userToRegister, CancelToken cancelToken) async {
    try {
      // Send POST request to client registration endpoint
      var response = await _apiService.post(
        endPoint: ApiEndPoints.clientRegisterEndPoint,
        needToken: false,
        cancelToken: cancelToken,
        data: userToRegister.toJson(),
      );
      return right(SuccessRegisterModel.fromJson(response));
    } catch (errorInClientRegister) {
      // Log and handle error in registration process
      LoggerHelper.logError(
          errorInClientRegister, ApiEndPoints.clientRegisterEndPoint);
      return left(ErrorHandler.handleError(errorInClientRegister));
    }
  }

  /// Logs in a client user
  /// [userToRegister] - the user data model for login
  /// [cancelToken] - allows the request to be canceled if needed
  /// Returns either a [SuccessLoginModel] on success or a [Failure] on error
  @override
  Future<Either<Failure, SuccessLoginModel>> loginApi(
      UserClientModel userToRegister, CancelToken cancelToken) async {
    try {
      // Send POST request to login endpoint
      var response = await _apiService.post(
        endPoint: ApiEndPoints.loginEndPoint,
        data: userToRegister.loginBody(),
      );
      return right(SuccessLoginModel.fromJson(response));
    } catch (errorInLogin) {
      // Log and handle error in login process
      LoggerHelper.logError(errorInLogin, ApiEndPoints.loginEndPoint);
      return left(ErrorHandler.handleError(errorInLogin));
    }
  }

  /// Verifies OTP for account activation
  /// [dataToVerify] - OTP and related information
  /// [cancelToken] - allows the request to be canceled if needed
  /// Returns either a success message or a [Failure] on error
  @override
  Future<Either<Failure, String>> verifyOtpApi(
      Map<String, dynamic> dataToVerify, CancelToken cancelToken) async {
    log("Attempting OTP verification with data: ${dataToVerify.toString()}");

    try {
      // Send POST request to OTP verification endpoint
      var response = await _apiService.post(
        endPoint: ApiEndPoints.verifyAccountEndPoint,
        data: dataToVerify,
      );
      var message = response['message'];

      // Handle case where message is a list by joining into a single string
      if (message is List) {
        message = message.join(', ');
      }

      // Check if message is a valid string and return response
      if (message is String) {
        return right(message);
      } else {
        return left(ErrorHandler.handleError(Constants.responseIsNull));
      }
    } catch (errorInVerifyOtp) {
      // Log and handle error in OTP verification
      LoggerHelper.logError(errorInVerifyOtp, ApiEndPoints.loginEndPoint);
      return left(ErrorHandler.handleError(errorInVerifyOtp));
    }
  }

  /// Requests a password reset by sending an OTP to the user's email
  /// [email] - the email address to send OTP
  /// [cancelToken] - allows the request to be canceled if needed
  /// Returns either a success message or a [Failure] on error
  @override
  Future<Either<Failure, String>> forgetPassword(
      String email, CancelToken cancelToken) async {
    try {
      // Send POST request to resend OTP endpoint
      var response = await _apiService.post(
        endPoint: ApiEndPoints.resendOtpEndPoint,
        data: {"email": email},
      );
      var message = response[Constants.messageFromResponse];

      // Ensure message is a non-null String
      String? validMessage = HelperFunctions.ensureStringOrNull(message);
      if (validMessage != null) {
        return right(validMessage);
      } else {
        return left(ErrorHandler.handleError(Constants.responseIsNull));
      }
    } catch (errorInResendOtp) {
      // Log and handle error in resend OTP request
      LoggerHelper.logError(errorInResendOtp, ApiEndPoints.resendOtpEndPoint);
      return left(ErrorHandler.handleError(errorInResendOtp));
    }
  }

  /// Resets the user's password
  /// [dataToResetPassword] - data needed for password reset
  /// [cancelToken] - allows the request to be canceled if needed
  /// Returns either a success message or a [Failure] on error
  @override
  Future<Either<Failure, String>> resetPassword(
      Map<String, dynamic> dataToResetPassword, CancelToken cancelToken) async {
    try {
      // Send PATCH request to reset password endpoint
      var response = await _apiService.patch(
        data: dataToResetPassword,
        endPoint: ApiEndPoints.resetPasswordEndPoint,
      );
      var message = response[Constants.messageFromResponse];

      // Ensure message is a non-null String
      String? validMessage = HelperFunctions.ensureStringOrNull(message);
      if (validMessage != null) {
        return right(validMessage);
      } else {
        return left(ErrorHandler.handleError(Constants.responseIsNull));
      }
    } catch (errorInResetPassword) {
      // Log and handle error in password reset
      LoggerHelper.logError(
          errorInResetPassword, ApiEndPoints.resetPasswordEndPoint);
      return left(ErrorHandler.handleError(errorInResetPassword));
    }
  }

  @override
  Future<Either<Failure, CountryList>> getAllCountries() async {
    try {
      var response = await _apiService.get(endPoint: ApiEndPoints.countries);

      if (response is List<dynamic>) {
        return right(CountryList.fromJson(response));
      }

      if (response is Map<String, dynamic>) {
        if (response.containsKey('result') &&
            response['result'] is List<dynamic>) {
          final List<dynamic> data = response['result'];
          return right(CountryList.fromJson(data));
        }
        throw const FormatException(
            'Response Map does not contain a valid list');
      }

      throw FormatException(
          'Unexpected response format: ${response.runtimeType}');
    } catch (errorInGetAllCountries) {
      return left(ErrorHandler.handleError(errorInGetAllCountries));
    }
  }

  @override
  Future<Either<Failure, CityList>> getCitiesOfASpecifiedCountry(
      String countryId) async {
    try {
      var response = await _apiService.get(
          endPoint: "${ApiEndPoints.countries}/$countryId");
      return right(CityList.fromJson(response));
    } catch (errorInGetCitiesOfASpecifiedCountry) {
      return left(
          ErrorHandler.handleError(errorInGetCitiesOfASpecifiedCountry));
    }
  }

  @override
  Future<Either<Failure, SuccessRegisterModel>> workerRegisterApi(
      data, CancelToken cancelToken) async {
    try {
      // Send POST request to client registration endpoint
      var response = await _apiService.post(
        endPoint: ApiEndPoints.workerRegisterEndPoint,
        needToken: false,
        cancelToken: cancelToken,
        data: data,
      );
      return right(SuccessRegisterModel.fromJson(response));
    } catch (errorInWorkerRegister) {
      // Log and handle error in registration process
      LoggerHelper.logError(
          errorInWorkerRegister, ApiEndPoints.workerRegisterEndPoint);
      return left(ErrorHandler.handleError(errorInWorkerRegister));
    }
  }

  @override
  Future<Either<Failure, WorkerTags>> getAllWorkerTagApi() async {
    try {
      var response =
          await _apiService.get(endPoint: ApiEndPoints.getWorkerTags);
      return right(WorkerTags.fromJson(response));
    } catch (errorInGetWorkerTags) {
      return left(ErrorHandler.handleError(errorInGetWorkerTags));
    }
  }
}
