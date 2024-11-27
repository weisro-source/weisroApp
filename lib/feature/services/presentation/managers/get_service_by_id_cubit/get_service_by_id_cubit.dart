import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:weisro/core/api/api_error_handler.dart';
import 'package:weisro/core/utils/service_locator.dart';
import 'package:weisro/feature/services/data/models/service_model.dart';
import 'package:weisro/feature/services/data/service_repo/service_repo.dart';

part 'get_service_by_id_state.dart';

class GetServiceByIdCubit extends Cubit<GetServiceByIdState> {
  GetServiceByIdCubit() : super(GetServiceByIdInitial());
  static GetServiceByIdCubit get(context) => BlocProvider.of(context);
  Future<void> getServiceById(BuildContext context, String serviceId) async {
    emit(GetServiceByIdLoading());
    var result =
        await getIt.get<ServiceRepository>().getServiceById(context, serviceId);
    result.fold(
      (errorInGetServiceById) {
        emit(GetServiceByIdFailures(error: errorInGetServiceById));
      },
      (getServiceById) {
        emit(GetServiceByIdSuccess(oneService: getServiceById));
      },
    );
  }
}
