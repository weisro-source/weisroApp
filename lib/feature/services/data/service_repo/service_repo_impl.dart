import 'package:dartz/dartz.dart';
import 'package:flutter/material.dart';
import 'package:weisro/core/api/api_end_points.dart';
import 'package:weisro/core/api/api_error_handler.dart';
import 'package:weisro/core/api/api_service.dart';
import 'package:weisro/core/utils/service_locator.dart';
import 'package:weisro/feature/services/data/models/service_model.dart';
import 'package:weisro/feature/services/data/service_repo/service_repo.dart';

class ServiceRepositoryImplementation implements ServiceRepository {
  // Initialize the ApiService using dependency injection
  final ApiService _apiService = getIt<ApiService>();
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
}
