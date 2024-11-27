import 'package:bloc/bloc.dart';
import 'package:dartz/dartz.dart';
import 'package:flutter/material.dart';
import 'package:weisro/core/api/api_error_handler.dart';
import 'package:weisro/core/utils/service_locator.dart';
import 'package:weisro/feature/home/data/home_repo/home_repo.dart';
import 'package:weisro/feature/home/data/models/all_services_model.dart';

part 'services_by_category_id_state.dart';

class ServicesByCategoryIdCubit extends Cubit<ServicesByCategoryIdState> {
  ServicesByCategoryIdCubit() : super(ServicesByCategoryIdInitial());
  Future<void> fetchServicesByCategoryId(
      String categoryId, BuildContext context,
      {int pageNumber = 1}) async {
    if (pageNumber == 1) {
      emit(ServicesByCategoryIdLoading());
    } else {
      emit(ServicesByCategoryIdPaginationLoading());
    }
    Either<Failure, AllServicesModel> result = await getIt
        .get<HomeRepository>()
        .getServiceByCategoryIdApi(categoryId, context, pageNumber);
    result.fold(
      (errorInFetchServicesByCategoryId) {
        if (pageNumber == 1) {
          emit(ServicesByCategoryIdFailures(
              failure: errorInFetchServicesByCategoryId));
        } else {
          emit(ServicesByCategoryIdPaginationFailures(
              failure: errorInFetchServicesByCategoryId));
        }
      },
      (allServicesByCategoryId) {
        emit(ServicesByCategoryIdSuccess(services: allServicesByCategoryId));
      },
    );
  }
}
