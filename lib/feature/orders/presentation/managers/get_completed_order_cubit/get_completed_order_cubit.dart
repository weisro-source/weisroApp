import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';
import 'package:weisro/core/utils/service_locator.dart';
import 'package:weisro/feature/orders/data/order_repo/order_repo.dart';

part 'get_completed_order_state.dart';

class GetCompletedOrderCubit extends Cubit<GetCompletedOrderState> {
  GetCompletedOrderCubit() : super(GetCompletedOrderInitial());
  Future<void> getAllCompletedOrders() async {
    emit(GetCompletedOrderLoading());
    var result = await getIt.get<OrderRepository>().getAllOrderApi();
    result.fold(
      (errorInGetCompletedOrders) {
        emit(GetCompletedOrderFailure());
      },
      (allCompletedOrders) {
        emit(GetCompletedOrderSuccess());
      },
    );
  }
}
