import 'package:dartz/dartz.dart';
import 'package:weisro/core/api/api_error_handler.dart';
import 'package:weisro/feature/favorite/data/models/favorite_model.dart';

abstract class FavoriteRepository {
  Future<Either<Failure, FavoriteModel>> getUserFavoriteApi(
      [int pageNumber = 1]);
}
