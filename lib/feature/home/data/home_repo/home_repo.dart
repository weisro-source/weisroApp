import 'package:dartz/dartz.dart';
import 'package:flutter/material.dart';
import 'package:weisro/core/api/api_error_handler.dart';
import 'package:weisro/feature/home/data/models/category_model.dart';

abstract class HomeRepository {
  Future<Either<Failure, CategoryModel>> getCategoriesByTypeApi(
      String type, BuildContext context, [int pageNumber]);
}
