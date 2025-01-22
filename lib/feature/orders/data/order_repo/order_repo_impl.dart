import 'package:dartz/dartz.dart';
import 'package:weisro/core/api/api_end_points.dart';
import 'package:weisro/core/api/api_error_handler.dart';
import 'package:weisro/core/api/api_service.dart';
import 'package:weisro/core/utils/constant.dart';
import 'package:weisro/core/utils/helper_functions.dart';
import 'package:weisro/core/utils/service_locator.dart';
import 'package:weisro/feature/orders/data/models/order_model.dart';
import 'package:weisro/feature/orders/data/order_repo/order_repo.dart';

class OrderRepositoryImplementation implements OrderRepository {
  final ApiService _apiService = getIt.get<ApiService>();
  @override
  Future<Either<Failure, Orders>> getAllOrderApi(String status) async {
    try {
      var response = await _apiService.get(
          endPoint: "${ApiEndPoints.getUserBooking}$status");
      return right(Orders.fromJson(response));
    } catch (errorInGetOrderApi) {
      return left(ErrorHandler.handleError(errorInGetOrderApi));
    }
  }

  @override
  Future<Either<Failure, String>> bookingPayApi(String orderId) async {
    try {
      var response =
          await _apiService.get(endPoint: "${ApiEndPoints.bookingPay}$orderId");
      var message = response["result"];

      String? validMessage = HelperFunctions.ensureStringOrNull(message);
      if (validMessage != null) {
        return right(validMessage);
      } else {
        return left(ErrorHandler.handleError(Constants.responseIsNull));
      }
    } catch (errorInPay) {
      return left(ErrorHandler.handleError(errorInPay));
    }
  }
}
