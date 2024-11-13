import 'package:dartz/dartz.dart';
import 'package:dio/dio.dart';
import 'package:weisro/core/api/api_error_handler.dart';
import 'package:weisro/feature/auth/data/models/success_login_model.dart';
import 'package:weisro/feature/auth/data/models/success_register_model.dart';
import 'package:weisro/feature/auth/data/models/user_client_model.dart';

abstract class AuthenticationRepository {
  Future<Either<Failure, SuccessRegisterModel>> clientRegisterApi(
      UserClientModel userToRegister, CancelToken cancelToken);
  Future<Either<Failure, SuccessLoginModel>> loginApi(
      UserClientModel userToRegister, CancelToken cancelToken);
  Future<Either<Failure, String>> verifyOtpApi(
      Map<String, dynamic> dataToVerify, CancelToken cancelToken);
  Future<Either<Failure, String>> forgetPassword(
      String email, CancelToken cancelToken);
  Future<Either<Failure, String>> resetPassword(
      Map<String, dynamic> dataToResetPassword, CancelToken cancelToken);
}
