import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';

part 'get_completed_order_state.dart';

class GetCompletedOrderCubit extends Cubit<GetCompletedOrderState> {
  GetCompletedOrderCubit() : super(GetCompletedOrderInitial());
}
