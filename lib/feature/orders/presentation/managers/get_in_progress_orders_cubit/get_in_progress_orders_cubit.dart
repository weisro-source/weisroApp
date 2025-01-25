import 'package:bloc/bloc.dart';
import 'package:dartz/dartz.dart';
import 'package:meta/meta.dart';
import 'package:weisro/core/api/api_error_handler.dart';
import 'package:weisro/core/enums/order_status.dart';
import 'package:weisro/core/utils/service_locator.dart';
import 'package:weisro/feature/orders/data/models/order_model.dart';
import 'package:weisro/feature/orders/data/order_repo/order_repo.dart';

part 'get_in_progress_orders_state.dart';

class GetInProgressOrdersCubit extends Cubit<GetInProgressOrdersState> {
  GetInProgressOrdersCubit() : super(GetInProgressOrdersInitial());
  Future<void> getInProgressOrders() async {
    emit(GetInProgressOrdersLoading());
    Either<Failure, Orders> result = await getIt
        .get<OrderRepository>()
        .getAllOrderApi(OrderStatus.inProgress.name);
    result.fold(
      (errorInGetProgressOrders) {
        emit(GetInProgressOrdersFailures());
      },
      (allInProgressOrders) {
        emit(GetInProgressOrdersSuccess(orders: allInProgressOrders));
      },
    );
  }
}
