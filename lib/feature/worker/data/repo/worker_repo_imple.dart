import 'package:dartz/dartz.dart';
import 'package:weisro/core/api/api_end_points.dart';
import 'package:weisro/core/api/api_error_handler.dart';
import 'package:weisro/core/api/api_service.dart';
import 'package:weisro/core/utils/constant.dart';
import 'package:weisro/core/utils/service_locator.dart';
import 'package:weisro/feature/worker/data/models/workers_for_category_model.dart';
import 'package:weisro/feature/worker/data/repo/worker_repo.dart';

class WorkerRepositoryImplementation implements WorkerRepository {
  final ApiService _apiService = getIt.get<ApiService>();
  @override
  Future<Either<Failure, WorkersForCategory>> getWorkerForOneCategoryApi(
      String categoryId,
      [int pageNumber = 1]) async {
    try {
      var response = await _apiService.get(
          endPoint:
              "${ApiEndPoints.getWorkForCategory}category_id=$categoryId&page=$pageNumber&limit=${Constants.limitInPage}");

      return right(WorkersForCategory.fromJson(response));
    } catch (e) {
      return left(ErrorHandler.handleError(e));
    }
  }
}