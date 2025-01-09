import 'package:dartz/dartz.dart';
import 'package:weisro/core/api/api_error_handler.dart';
import 'package:weisro/feature/notifications/data/models/notification_model.dart';

abstract class NotificationsRepository {
  Future<Either<Failure, NotificationModel>> getAllUserNotificationApi(
      [int pageNumber=1]);
}
