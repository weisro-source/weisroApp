import 'package:dartz/dartz.dart';
import 'package:weisro/core/api/api_error_handler.dart';

abstract class BookingRepository {
  Future<Either<Failure, String>> addBookingServiceApi(Map<String, dynamic> data);
}
