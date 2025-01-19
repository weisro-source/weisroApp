import 'package:dartz/dartz.dart';
import 'package:weisro/core/api/api_error_handler.dart';
import 'package:weisro/feature/orders/data/models/order_model.dart';

abstract class OrderRepository {
  Future<Either<Failure, Orders>> getAllOrderApi(String status);
}
