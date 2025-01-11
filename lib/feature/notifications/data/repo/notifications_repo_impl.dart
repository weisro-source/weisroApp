import 'package:dartz/dartz.dart';
import 'package:weisro/core/api/api_error_handler.dart';
import 'package:weisro/core/api/api_service.dart';
import 'package:weisro/core/utils/service_locator.dart';
import 'package:weisro/feature/notifications/data/models/notification_model.dart';
import 'package:weisro/feature/notifications/data/repo/notifications_repo.dart';

class NotificationsRepositoryImplementation implements NotificationsRepository {
  final ApiService _apiService = getIt.get<ApiService>();
  @override
  Future<Either<Failure, NotificationModel>> getAllUserNotificationApi(
      [int pageNumber = 1]) async {
    try {
       await _apiService.get(endPoint: "");
      return right(NotificationModel());
    } catch (errorInGetAllUserNotification) {
      return left(ErrorHandler.handleError(errorInGetAllUserNotification));
    }
  }
}
