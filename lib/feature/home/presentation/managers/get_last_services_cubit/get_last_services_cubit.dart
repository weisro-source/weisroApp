import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:weisro/core/api/api_error_handler.dart';
import 'package:weisro/core/utils/service_locator.dart';
import 'package:weisro/feature/home/data/home_repo/home_repo.dart';
import 'package:weisro/feature/home/data/models/last_service_model.dart';

part 'get_last_services_state.dart';

class GetLastServicesCubit extends Cubit<GetLastServicesState> {
  GetLastServicesCubit() : super(GetLastServicesInitial());
  static GetLastServicesCubit get(context) => BlocProvider.of(context);

  /// to Get last Services in home page according to city name ....
  Future<void> getLastService(
      BuildContext context, String cityName, String? categoryId) async {
    emit(GetLastServicesLoading());
    var result = await getIt
        .get<HomeRepository>()
        .getLastServiceApi(context, cityName, categoryId);
    result.fold(
      (errorInGetLastService) {
        emit(GetLastServicesFailures(error: errorInGetLastService));
      },
      (getLastService) {
        emit(GetLastServicesSuccess(lastServices: getLastService));
      },
    );
  }

  void changeFavorite(String serviceId) {
    if (state is GetLastServicesSuccess) {
      final currentState = state as GetLastServicesSuccess;

      if (currentState.lastServices.docs != null) {
        for (int i = 0; i < currentState.lastServices.docs!.length; i++) {
          if (currentState.lastServices.docs![i].id == serviceId) {
            // Toggle the isFavorite value
            currentState.lastServices.docs![i] =
                currentState.lastServices.docs![i].copyWith(
                    isFavorite:
                        !(currentState.lastServices.docs![i].isFavorite ??
                            false));
          }
        }

        // Emit a new state with updated services
        emit(GetLastServicesSuccess(lastServices: currentState.lastServices));
      }
    }
  }
}
