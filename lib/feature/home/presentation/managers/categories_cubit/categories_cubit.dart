import 'dart:developer';

import 'package:bloc/bloc.dart';
import 'package:dartz/dartz.dart';
import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:weisro/core/api/api_error_handler.dart';
import 'package:weisro/core/utils/ansi_color.dart';
import 'package:weisro/core/utils/service_locator.dart';
import 'package:weisro/feature/home/data/home_repo/home_repo.dart';
import 'package:weisro/feature/home/data/models/category_model.dart';

part 'categories_state.dart';

class CategoriesCubit extends Cubit<CategoriesState> {
  CategoriesCubit() : super(CategoriesInitial());
  CancelToken? cancelToken = CancelToken();
  Future<void> fetchCategories(String type, BuildContext context,
      {int pageNumber = 1}) async {
     if (pageNumber == 1) {
      emit(CategoriesLoading());
    } else {
      emit(CategoriesPaginationLoading());
    }
    Either<Failure, CategoryModel> result = await getIt
        .get<HomeRepository>()
        .getCategoriesByTypeApi(type, context, cancelToken, pageNumber);
    result.fold(
      (errorInFetchCategories) {
        if (pageNumber == 1) {
          emit(CategoriesFailures(getCategoryError: errorInFetchCategories));
        } else {
          emit(CategoriesPaginationFailures(
              getCategoryError: errorInFetchCategories));
        }
      },
      (allCategoriesByType) {
        emit(CategoriesSuccess(categoryModel: allCategoriesByType));
      },
    );
  }

  @override
  Future<void> close() async {
    super.close();
    log(
      AnsiColor.colorize(
        "Close Categories Cubit",
        AnsiColor.magenta,
      ),
      name: "Close",
    );
    cancelToken?.cancel();
  }
}
