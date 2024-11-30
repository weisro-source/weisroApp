import 'package:dartz/dartz.dart';
import 'package:flutter/material.dart';
import 'package:weisro/core/api/api_end_points.dart';
import 'package:weisro/core/api/api_error_handler.dart';
import 'package:weisro/core/api/api_service.dart';
import 'package:weisro/core/utils/constant.dart';
import 'package:weisro/core/utils/helper_functions.dart';
import 'package:weisro/core/utils/service_locator.dart';
import 'package:weisro/feature/services/data/models/service_model.dart';
import 'package:weisro/feature/services/data/service_repo/service_repo.dart';

class ServiceRepositoryImplementation implements ServiceRepository {
  // Initialize the ApiService using dependency injection
  final ApiService _apiService = getIt<ApiService>();

  // body to add Service to favorite
  Map<String, dynamic> addServiceToFavoriteBody(String serviceId) {
    return {"service": serviceId};
  }

  @override
  Future<Either<Failure, ServiceModel>> getServiceById(
      BuildContext context, String serviceId) async {
    try {
      var response = await _apiService.get(
          endPoint: "${ApiEndPoints.getServiceById}$serviceId");
      return right(ServiceModel.fromJson(response));
    } catch (errorInGetServiceById) {
      return left(ErrorHandler.handleError(errorInGetServiceById));
    }
  }

  @override
  Future<Either<Failure, String>> addService(
      BuildContext context, var service) async {
    try {
      var response = await _apiService.post(
          endPoint: ApiEndPoints.addService, data: service);
      if (response["message"] != null && response["message"] is String) {
        return right(response["message"]);
      } else {
        return left(ErrorHandler.handleError(Constants.responseIsNull));
      }
    } catch (errorInAddService) {
      return left(ErrorHandler.handleError(errorInAddService));
    }
  }

  @override
  Future<Either<Failure, String>> addServiceToFavorite(
      BuildContext context, String serviceId) async {
    try {
      dynamic response = await _apiService.post(
          endPoint: ApiEndPoints.addServiceToFavorite,
          data: addServiceToFavoriteBody(serviceId));
      var message = response[Constants.messageFromResponse];
      String? validMessage = HelperFunctions.ensureStringOrNull(message);
      if (validMessage != null) {
        return right(validMessage);
      } else {
        return left(ErrorHandler.handleError(Constants.responseIsNull));
      }
    } catch (errorInAddServiceToFavorite) {
      return left(ErrorHandler.handleError(errorInAddServiceToFavorite));
    }
  }
}
