import 'package:dartz/dartz.dart';
import 'package:dio/dio.dart';
import 'package:weisro/core/api/api_end_points.dart';
import 'package:weisro/core/api/api_error_handler.dart';
import 'package:weisro/core/api/api_service.dart';
import 'package:weisro/core/utils/constant.dart';
import 'package:weisro/core/utils/helper_functions.dart';
import 'package:weisro/core/utils/service_locator.dart';
import 'package:weisro/feature/ads/data/ads_repo/ads_repo.dart';
import 'package:weisro/feature/ads/data/models/ads_model.dart';

class AdsRepositoryImplementation implements AdsRepository {
  final ApiService _apiService = getIt<ApiService>();

  @override
  Future<Either<Failure, String>> addAds(
      dynamic data, CancelToken? cancelToken) async {
    try {
      var response = await _apiService.post(
          endPoint: ApiEndPoints.addAds, data: data, cancelToken: cancelToken);
      var message = response[Constants.messageFromResponse];
      String? validMessage = HelperFunctions.ensureStringOrNull(message);
      if (validMessage != null) {
        return right(validMessage);
      } else {
        return left(ErrorHandler.handleError(Constants.responseIsNull));
      }
    } catch (errorINAddAds) {
      return left(ErrorHandler.handleError(errorINAddAds));
    }
  }

  @override
  Future<Either<Failure, AdsModel>> getAdsForUserApi(
      [int pageNumber = 1]) async {
    try {
      var response = await _apiService.get(
          endPoint:
              "${ApiEndPoints.addAds}/?type=user&page=$pageNumber&limit=${Constants.limitInPage}");
      return right(AdsModel.fromJson(response));
    } catch (errorInGetUserAds) {
      return left(ErrorHandler.handleError(errorInGetUserAds));
    }
  }
}
