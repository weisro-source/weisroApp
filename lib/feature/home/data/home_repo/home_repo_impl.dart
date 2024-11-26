import 'dart:developer';

import 'package:dartz/dartz.dart';
import 'package:flutter/material.dart';
import 'package:weisro/core/api/api_end_points.dart';
import 'package:weisro/core/api/api_error_handler.dart';
import 'package:weisro/core/api/api_service.dart';
import 'package:weisro/core/utils/constant.dart';
import 'package:weisro/core/utils/service_locator.dart';
import 'package:weisro/feature/home/data/home_repo/home_repo.dart';
import 'package:weisro/feature/home/data/models/category_model.dart';

class HomeRepositoryImplementation implements HomeRepository {
  // Initialize the ApiService using dependency injection
  final ApiService _apiService = getIt<ApiService>();
  @override
  Future<Either<Failure, CategoryModel>> getCategoriesByTypeApi(
      String type, BuildContext context, [int pageNumber=1]) async {
    try {
      var response = await _apiService.get(
        endPoint:
            "${ApiEndPoints.getCategoryByType}$type&page=$pageNumber&limit=${Constants.limitInPage}",
      );
      return right(CategoryModel.fromJson(response));
    } catch (errorInGettingCategoriesByType) {
      log("Error getting category by type $errorInGettingCategoriesByType");
      return left(ErrorHandler.handleError(errorInGettingCategoriesByType));
    }
  }
}
