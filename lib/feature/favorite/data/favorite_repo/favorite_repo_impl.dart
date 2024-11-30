import 'package:dartz/dartz.dart';
import 'package:weisro/core/api/api_end_points.dart';
import 'package:weisro/core/api/api_error_handler.dart';
import 'package:weisro/core/api/api_service.dart';
import 'package:weisro/core/utils/constant.dart';
import 'package:weisro/core/utils/service_locator.dart';
import 'package:weisro/feature/favorite/data/favorite_repo/favorite_repo.dart';
import 'package:weisro/feature/favorite/data/models/favorite_model.dart';

class FavoriteRepositoryImplementation implements FavoriteRepository {
  final ApiService _apiService = getIt<ApiService>();

  @override
  Future<Either<Failure, FavoriteModel>> getUserFavoriteApi(
      [int pageNumber = 1]) async {
    try {
      var response = await _apiService.get(
          endPoint:
              "${ApiEndPoints.getFavorite}?page=$pageNumber&limit=${Constants.limitInPage}");
      return right(FavoriteModel.fromJson(response));
    } catch (errorInGetFavorite) {
      return Left(ErrorHandler.handleError(errorInGetFavorite));
    }
  }
}
