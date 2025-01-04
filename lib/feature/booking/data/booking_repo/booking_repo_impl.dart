import 'package:dartz/dartz.dart';
import 'package:weisro/core/api/api_end_points.dart';
import 'package:weisro/core/api/api_error_handler.dart';
import 'package:weisro/core/api/api_service.dart';
import 'package:weisro/core/utils/service_locator.dart';
import 'package:weisro/feature/booking/data/booking_repo/booking_repo.dart';
import 'package:weisro/feature/booking/data/models/your_booking_model.dart';

class BookingRepositoryImplementation implements BookingRepository {
  final ApiService _apiService = getIt.get<ApiService>();
  @override
  Future<Either<Failure, String>> addBookingServiceApi(
      Map<String, dynamic> data) async {
    try {
      await _apiService.post(
          endPoint: ApiEndPoints.addServiceBooking, data: data);
      return right("");
    } catch (errorInBookingServiceApi) {
      return left(ErrorHandler.handleError(errorInBookingServiceApi));
    }
  }

  @override
  Future<Either<Failure, String>> addBookingWorkerApi(
      Map<String, dynamic> data) async {
    try {
      await _apiService.post(
          endPoint: ApiEndPoints.addWorkerBooking, data: data);
      return right("");
    } catch (errorInBookWorkerApi) {
      return left(ErrorHandler.handleError(errorInBookWorkerApi));
    }
  }

  @override
  Future<Either<Failure, YourBookingModel>> yourBookingApi() async {
    try {
      dynamic response = await _apiService.get(
        endPoint: ApiEndPoints.getYourBooking,
      );
      return right(YourBookingModel.fromJson(response));
    } catch (errorInGetYourBookingApi) {
      return left(ErrorHandler.handleError(errorInGetYourBookingApi));
    }
  }
}
