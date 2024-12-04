import 'package:dartz/dartz.dart';
import 'package:dio/dio.dart';
import 'package:weisro/core/api/api_error_handler.dart';

abstract class AdsRepository {
  Future<Either<Failure, String>> addAds(
      dynamic data, CancelToken? cancelToken);
}
