import 'package:bloc/bloc.dart';
import 'package:dartz/dartz.dart';
import 'package:meta/meta.dart';
import 'package:weisro/core/api/api_error_handler.dart';
import 'package:weisro/core/enums/order_status.dart';
import 'package:weisro/core/utils/service_locator.dart';
import 'package:weisro/feature/orders/data/models/order_model.dart';
import 'package:weisro/feature/orders/data/order_repo/order_repo.dart';

part 'get_orders_state.dart';

class GetOrdersCubit extends Cubit<GetOrdersState> {
  GetOrdersCubit() : super(GetOrdersInitial());
  Future<void> getAllOrders() async {
    emit(GetOrdersLoading());
    Either<Failure, Orders> result = await getIt
        .get<OrderRepository>()
        .getAllOrderApi(OrderStatus.accepted.name);
    result.fold(
      (errorInGetOrders) {
        emit(GetOrdersFailures(error: errorInGetOrders));
      },
      (orders) {
        emit(GetOrdersSuccess(orders: orders));
      },
    );
  }
}
// const validStatuses = [
//   'completed',
//   'accepted',
//   'pending',
//   'in_progress',
//   'rejected',
// ];
