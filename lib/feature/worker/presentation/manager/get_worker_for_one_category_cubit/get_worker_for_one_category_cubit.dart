import 'package:bloc/bloc.dart';
import 'package:flutter/material.dart';
import 'package:weisro/core/api/api_error_handler.dart';
import 'package:weisro/core/utils/service_locator.dart';
import 'package:weisro/feature/worker/data/models/workers_for_category_model.dart';
import 'package:weisro/feature/worker/data/repo/worker_repo.dart';

part 'get_worker_for_one_category_state.dart';

class GetWorkerForOneCategoryCubit extends Cubit<GetWorkerForOneCategoryState> {
  GetWorkerForOneCategoryCubit() : super(GetWorkerForOneCategoryInitial());

  Future<void> getAllWorkersForOneCategory(
      String categoryId, BuildContext context,
      {int pageNumber = 1}) async {
    if (pageNumber == 1) {
      emit(GetWorkerForOneCategoryLoading());
    } else {
      emit(GetWorkerForOneCategoryLoadingPagination());
    }

    var result = await getIt
        .get<WorkerRepository>()
        .getWorkerForOneCategoryApi(categoryId, pageNumber);
    result.fold(
      (errorInGetWorkers) {
        if (pageNumber == 1) {
          emit(GetWorkerForOneCategoryFailures(error: errorInGetWorkers));
        } else {
          emit(GetWorkerForOneCategoryFailuresPagination(
              error: errorInGetWorkers));
        }
      },
      (workers) {
        emit(GetWorkerForOneCategorySuccess(workers: workers));
      },
    );
  }
}
