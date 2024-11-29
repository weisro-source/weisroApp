import 'package:dartz/dartz.dart';
import 'package:weisro/core/api/api_error_handler.dart';
import 'package:weisro/feature/auth/data/models/user_client_model.dart';

abstract class AccountRepository {
  Future<Either<Failure, UserClientModel>> getUserClintInfo();
}
