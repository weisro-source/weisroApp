import 'package:dartz/dartz.dart';
import 'package:weisro/core/api/api_end_points.dart';
import 'package:weisro/core/api/api_error_handler.dart';
import 'package:weisro/core/api/api_service.dart';
import 'package:weisro/core/utils/service_locator.dart';
import 'package:weisro/feature/booking/data/booking_repo/booking_repo.dart';

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
}
