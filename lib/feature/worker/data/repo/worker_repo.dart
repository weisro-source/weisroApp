import 'package:dartz/dartz.dart';
import 'package:weisro/core/api/api_error_handler.dart';
import 'package:weisro/feature/worker/data/models/workers_for_category_model.dart';

abstract class WorkerRepository {
  Future<Either<Failure, WorkersForCategory>> getWorkerForOneCategoryApi(
      String categoryId,
      [int pageNumber]);
}
