import 'package:bloc/bloc.dart';
import 'package:dartz/dartz.dart';
import 'package:meta/meta.dart';
import 'package:weisro/core/api/api_error_handler.dart';
import 'package:weisro/core/enums/order_status.dart';
import 'package:weisro/core/utils/service_locator.dart';
import 'package:weisro/feature/orders/data/models/order_model.dart';
import 'package:weisro/feature/orders/data/order_repo/order_repo.dart';

part 'get_all_pending_orders_state.dart';

class GetAllPendingOrdersCubit extends Cubit<GetAllPendingOrdersState> {
  GetAllPendingOrdersCubit() : super(GetAllPendingOrdersInitial());
  Future<void> getAllPendingOrders() async {
    emit(GetAllPendingOrdersLoading());
    Either<Failure, Orders> result = await getIt
        .get<OrderRepository>()
        .getAllOrderApi(OrderStatus.pending.name);
    result.fold(
      (errorInGetAllPending) {
        emit(GetAllPendingOrdersFailures());
      },
      (allPendingOrders) {
        emit(GetAllPendingOrdersSuccess(orders: allPendingOrders));
      },
    );
  }
}
