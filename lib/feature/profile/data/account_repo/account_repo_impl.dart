import 'package:dartz/dartz.dart';
import 'package:weisro/core/api/api_end_points.dart';
import 'package:weisro/core/api/api_error_handler.dart';
import 'package:weisro/core/api/api_service.dart';
import 'package:weisro/core/utils/service_locator.dart';
import 'package:weisro/feature/auth/data/models/user_client_model.dart';
import 'package:weisro/feature/profile/data/account_repo/account_repo.dart';

class AccountRepositoryImplementation implements AccountRepository {
  final ApiService _apiService = getIt<ApiService>();

  @override
  Future<Either<Failure, UserClientModel>> getUserClintInfo() async {
    try {
      var response =
          await _apiService.get(endPoint: ApiEndPoints.getInfoEndPoint);
      return right(UserClientModel.fromJson(response));
    } catch (errorInGetUserClintInfo) {
      return left(ErrorHandler.handleError(errorInGetUserClintInfo));
    }
  }
}
