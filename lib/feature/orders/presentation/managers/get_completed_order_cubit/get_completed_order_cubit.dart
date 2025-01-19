import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';
import 'package:weisro/core/enums/order_status.dart';
import 'package:weisro/core/utils/service_locator.dart';
import 'package:weisro/feature/orders/data/models/order_model.dart';
import 'package:weisro/feature/orders/data/order_repo/order_repo.dart';

part 'get_completed_order_state.dart';

class GetCompletedOrderCubit extends Cubit<GetCompletedOrderState> {
  GetCompletedOrderCubit() : super(GetCompletedOrderInitial());
  Future<void> getAllCompletedOrders() async {
    emit(GetCompletedOrderLoading());
    var result = await getIt
        .get<OrderRepository>()
        .getAllOrderApi(OrderStatus.completed.name);
    result.fold(
      (errorInGetCompletedOrders) {
        emit(GetCompletedOrderFailure());
      },
      (allCompletedOrders) {
        emit(GetCompletedOrderSuccess(orders: allCompletedOrders));
      },
    );
  }
}
