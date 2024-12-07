import 'package:dartz/dartz.dart';
import 'package:dio/dio.dart';
import 'package:weisro/core/api/api_error_handler.dart';
import 'package:weisro/feature/ads/data/models/ads_model.dart';

abstract class AdsRepository {
  Future<Either<Failure, String>> addAds(
      dynamic data, CancelToken? cancelToken);
  Future<Either<Failure, AdsModel>> getAdsForUserApi([int pageNumber = 1]);
}
