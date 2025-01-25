import 'package:dartz/dartz.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:weisro/core/api/api_error_handler.dart';
import 'package:weisro/core/utils/service_locator.dart';
import 'package:weisro/feature/services/data/service_repo/service_repo.dart';

part 'deleted_service_state.dart';

class DeletedServiceCubit extends Cubit<DeletedServiceState> {
  DeletedServiceCubit() : super(DeletedServiceInitial());
  static DeletedServiceCubit get(context) => BlocProvider.of(context);
  Future<void> deleteService(String serviceId, BuildContext context) async {
    emit(DeletedServiceLoading());
    Either<Failure, String> result =
        await getIt.get<ServiceRepository>().deleteService(context, serviceId);
    result.fold(
      (errorInDeletedService) {
        emit(DeletedServiceFailures(error: errorInDeletedService));
      },
      (deleted) {
        emit(DeletedServiceSuccess(deletedSuccessMessage: deleted));
      },
    );
  }
}
