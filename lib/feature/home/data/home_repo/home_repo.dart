import 'package:dartz/dartz.dart';
import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:weisro/core/api/api_error_handler.dart';
import 'package:weisro/feature/home/data/models/all_services_model.dart';
import 'package:weisro/feature/home/data/models/category_model.dart';
import 'package:weisro/feature/home/data/models/last_service_model.dart';

abstract class HomeRepository {
  Future<Either<Failure, CategoryModel>> getCategoriesByTypeApi(
      String type, BuildContext context, CancelToken? cancelToken,
      [int pageNumber]);

  Future<Either<Failure, AllServicesModel>> getServiceByCategoryIdApi(
      String categoryId, BuildContext context,
      [int pageNumber]);
  Future<Either<Failure, LastServicesModel>> getLastServiceApi(
      BuildContext context, String cityName, String? categoryId,
      [int pageNumber]);
}
