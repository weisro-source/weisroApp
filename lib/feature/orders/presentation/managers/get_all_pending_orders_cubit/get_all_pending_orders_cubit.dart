import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';
import 'package:weisro/core/utils/service_locator.dart';
import 'package:weisro/feature/orders/data/order_repo/order_repo.dart';

part 'get_all_pending_orders_state.dart';

class GetAllPendingOrdersCubit extends Cubit<GetAllPendingOrdersState> {
  GetAllPendingOrdersCubit() : super(GetAllPendingOrdersInitial());
  Future<void> getAllPendingOrders() async {
    emit(GetAllPendingOrdersSuccess());
    var result = await getIt.get<OrderRepository>().getAllOrderApi();
    result.fold(
      (errorInGetAllPending) {
        emit(GetAllPendingOrdersFailures());
      },
      (allPendingOrders) {
        emit(GetAllPendingOrdersSuccess());
      },
    );
  }
}
