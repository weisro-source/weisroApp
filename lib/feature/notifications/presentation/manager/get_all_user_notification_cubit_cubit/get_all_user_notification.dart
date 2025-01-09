import 'package:bloc/bloc.dart';
import 'package:dartz/dartz.dart';
import 'package:meta/meta.dart';
import 'package:weisro/core/api/api_error_handler.dart';
import 'package:weisro/core/utils/service_locator.dart';
import 'package:weisro/feature/notifications/data/models/notification_model.dart';
import 'package:weisro/feature/notifications/data/repo/notifications_repo.dart';

part 'get_all_user_notification_cubit_state.dart';

class GetAllUserNotificationCubit
    extends Cubit<GetAllUserNotificationCubitState> {
  GetAllUserNotificationCubit()
      : super(GetAllUserNotificationCubitInitial());

  Future<void> getAllUserNotification({int pageNumber = 1}) async {
    if (pageNumber == 1) {
      emit(GetAllUserNotificationCubitLoading());
    } else {
      emit(GetAllUserNotificationCubitLoadingPagination());
    }
    Either<Failure, NotificationModel> result = await getIt
        .get<NotificationsRepository>()
        .getAllUserNotificationApi(pageNumber);
    result.fold(
      (errorInGetUserNotification) {
        if (pageNumber == 1) {
          emit(GetAllUserNotificationCubitFailures(
              error: errorInGetUserNotification));
        } else {
          emit(GetAllUserNotificationCubitFailuresPagination(
              error: errorInGetUserNotification));
        }
      },
      (r) {},
    );
  }
}
