import 'package:dartz/dartz.dart';
import 'package:weisro/core/api/api_end_points.dart';
import 'package:weisro/core/api/api_error_handler.dart';
import 'package:weisro/core/api/api_service.dart';
import 'package:weisro/core/utils/service_locator.dart';
import 'package:weisro/feature/orders/data/models/order_model.dart';
import 'package:weisro/feature/orders/data/order_repo/order_repo.dart';

class OrderRepositoryImplementation implements OrderRepository {
  final ApiService _apiService = getIt.get<ApiService>();
  @override
  Future<Either<Failure, Orders>> getAllOrderApi() async {
    try {
      var response =
          await _apiService.get(endPoint: ApiEndPoints.getUserBooking);
      return right(Orders.fromJson(response));
    } catch (errorInGetOrderApi) {
      return left(ErrorHandler.handleError(errorInGetOrderApi));
    }
  }
}
