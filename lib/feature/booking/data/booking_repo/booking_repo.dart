import 'package:dartz/dartz.dart';
import 'package:weisro/core/api/api_error_handler.dart';
import 'package:weisro/feature/booking/data/models/your_booking_model.dart';

abstract class BookingRepository {
  Future<Either<Failure, String>> addBookingServiceApi(
      Map<String, dynamic> data);
  Future<Either<Failure, String>> addBookingWorkerApi(
      Map<String, dynamic> data);
  Future<Either<Failure, YourBookingModel>> yourBookingApi(
      [int pageNumber = 1]);
}
