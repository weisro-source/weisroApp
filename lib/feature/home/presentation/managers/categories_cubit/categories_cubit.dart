import 'package:bloc/bloc.dart';
import 'package:dartz/dartz.dart';
import 'package:flutter/material.dart';
import 'package:weisro/core/api/api_error_handler.dart';
import 'package:weisro/core/utils/service_locator.dart';
import 'package:weisro/feature/home/data/home_repo/home_repo.dart';
import 'package:weisro/feature/home/data/models/category_model.dart';

part 'categories_state.dart';

class CategoriesCubit extends Cubit<CategoriesState> {
  CategoriesCubit() : super(CategoriesInitial());

  Future<void> fetchCategories(String type, BuildContext context,
      {int pageNumber = 1}) async {
    if (state is CategoriesSuccess) {
      return;
    }
    if (pageNumber == 1) {
      emit(CategoriesLoading());
    } else {
      emit(CategoriesPaginationLoading());
    }
    Either<Failure, CategoryModel> result = await getIt
        .get<HomeRepository>()
        .getCategoriesByTypeApi(type, context, pageNumber);
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
}