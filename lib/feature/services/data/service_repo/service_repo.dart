import 'package:dartz/dartz.dart';
import 'package:flutter/material.dart';
import 'package:weisro/core/api/api_error_handler.dart';
import 'package:weisro/feature/services/data/models/service_model.dart';

abstract class ServiceRepository {
  Future<Either<Failure, ServiceModel>> getServiceById(
      BuildContext context, String serviceId);
  Future<Either<Failure, String>> addService(
      BuildContext context, var service);
}
