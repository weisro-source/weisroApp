import 'package:bloc/bloc.dart';
import 'package:flutter/material.dart';
import 'package:weisro/core/api/api_error_handler.dart';
import 'package:weisro/core/utils/service_locator.dart';
import 'package:weisro/feature/home/data/home_repo/home_repo.dart';
import 'package:weisro/feature/home/data/models/last_service_model.dart';

part 'get_last_services_state.dart';

class GetLastServicesCubit extends Cubit<GetLastServicesState> {
  GetLastServicesCubit() : super(GetLastServicesInitial());

  Future<void> getLastService(BuildContext context) async {
    emit(GetLastServicesLoading());
    var result = await getIt.get<HomeRepository>().getLastServiceApi(context);
    result.fold(
      (errorInGetLastService) {
        emit(GetLastServicesFailures(error: errorInGetLastService));
      },
      (getLastService) {
        emit(GetLastServicesSuccess(lastServices: getLastService));
      },
    );
  }
}
