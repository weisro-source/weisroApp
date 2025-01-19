import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';
import 'package:weisro/core/enums/order_status.dart';
import 'package:weisro/core/utils/service_locator.dart';
import 'package:weisro/feature/orders/data/models/order_model.dart';
import 'package:weisro/feature/orders/data/order_repo/order_repo.dart';

part 'get_all_reject_orders_state.dart';

class GetAllRejectOrdersCubit extends Cubit<GetAllRejectOrdersState> {
  GetAllRejectOrdersCubit() : super(GetAllRejectOrdersInitial());

  Future<void> getAllRejectOrders() async {
    emit(GetAllRejectOrdersLoading());
    var result = await getIt
        .get<OrderRepository>()
        .getAllOrderApi(OrderStatus.rejected.name);
    result.fold(
      (errorInGetAllRejectOrders) {
        emit(GetAllRejectOrdersFailures());
      },
      (allRejectOrders) {
        emit(GetAllRejectOrdersSuccess(orders: allRejectOrders));
      },
    );
  }
}
