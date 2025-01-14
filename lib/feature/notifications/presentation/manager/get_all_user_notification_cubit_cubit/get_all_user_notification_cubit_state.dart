part of 'get_all_user_notification.dart';

@immutable
sealed class GetAllUserNotificationCubitState {}

final class GetAllUserNotificationCubitInitial
    extends GetAllUserNotificationCubitState {}

final class GetAllUserNotificationCubitLoading
    extends GetAllUserNotificationCubitState {}

final class GetAllUserNotificationCubitLoadingPagination
    extends GetAllUserNotificationCubitState {}

final class GetAllUserNotificationCubitFailures
    extends GetAllUserNotificationCubitState {
  final Failure error;

  GetAllUserNotificationCubitFailures({required this.error});
}

final class GetAllUserNotificationCubitFailuresPagination
    extends GetAllUserNotificationCubitState {
  final Failure error;

  GetAllUserNotificationCubitFailuresPagination({required this.error});
}

final class GetAllUserNotificationCubitSuccess
    extends GetAllUserNotificationCubitState {
  final NotificationModel notificationModel;

  GetAllUserNotificationCubitSuccess({required this.notificationModel});
}
