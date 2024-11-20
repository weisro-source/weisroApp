import 'dart:io';
import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:html/parser.dart' as html_parser;
import 'package:weisro/core/utils/constant.dart';
import 'package:weisro/core/utils/logger.dart';

abstract class Failure {
  final String errMassage;
  final int statusCode;

  const Failure(this.errMassage, this.statusCode);
}

class ServerFailure extends Failure {
  ServerFailure(super.errMassage, super.statusCode);

  factory ServerFailure.fromDioError(DioException dioException) {
    debugPrint('status code: ${dioException.response?.statusCode}');

    switch (dioException.type) {
      case DioExceptionType.connectionTimeout:
        return ServerFailure(
          'Connection timeout with ApiServer',
          dioException.response?.statusCode ?? 600,
        );
      case DioExceptionType.sendTimeout:
        return ServerFailure(
          'Send timeout with ApiServer',
          dioException.response?.statusCode ?? 601,
        );
      case DioExceptionType.receiveTimeout:
        return ServerFailure(
          'Receive timeout with ApiServer',
          dioException.response?.statusCode ?? 602,
        );
      case DioExceptionType.badCertificate:
        return ServerFailure(
          'badCertificate with ApiServer',
          dioException.response?.statusCode ?? 603,
        );
      case DioExceptionType.badResponse:
        return ServerFailure.fromResponse(
          dioException.response?.statusCode ?? 604,
          dioException.response?.data,
        );
      case DioExceptionType.cancel:
        return ServerFailure(
          'Request to  ApiServer was cancel',
          dioException.response?.statusCode ?? 605,
        );
      case DioExceptionType.connectionError:
        // Handle socket exceptions specifically
        if (dioException.error is SocketException) {
          return ServerFailure(
            'Network error: Please check your internet connection!',
            dioException.response?.statusCode ?? 606,
          );
        }
        return ServerFailure(
          'Connection error with ApiServer',
          dioException.response?.statusCode ?? 606,
        );
      case DioExceptionType.unknown:
        return ServerFailure('Ops There was an Error, Please try again!', 607);
    }
  }
  factory ServerFailure.fromResponse(int statusCode, dynamic response) {
    LoggerHelper.info('statusCode is $statusCode');

    bool isHtml(String response) {
      return response.startsWith('<!DOCTYPE html>') ||
          response.startsWith('<html>');
    }

    // Handle HTML error responses
    if (response is String && isHtml(response)) {
      final document = html_parser.parse(response);
      final errorMessage =
          document.body?.text ?? "Error: Unable to process HTML response";
      LoggerHelper.error("HTML error message: $errorMessage");
      return ServerFailure(errorMessage, statusCode);
    }

    // Default error message
    var error = "An error occurred";

    // Handle Map response
    if (response is Map) {
      if (statusCode == 409 && response['error'] == 'MongoServerError') {
        error = response['message'] ?? error;
      } else if (response.containsKey('message')) {
        // If `message` is a List, join it into a single string.
        var message = response['message'];
        if (message is List) {
          error = message.join(', ');
        } else if (message is String) {
          error = message;
        }
      } else if (response.containsKey('error')) {
        error = response['error'] as String? ?? error;
      }
    }

    // Handle List response
    if (response is List) {
      error = response.map((e) => e.toString()).join(', ');
    }

    LoggerHelper.error("Error extracted from response: $error");

    // Handle specific status codes
    if (statusCode == 409) {
      return ServerFailure(error, statusCode);
    } else if (statusCode == 401 || statusCode == 403 || statusCode == 422) {
      return ServerFailure(error, statusCode);
    } else if (statusCode == 404) {
      return ServerFailure("Not Found: $error", statusCode);
    } else if (statusCode == 500) {
      return ServerFailure("Internal Server Error: $error", statusCode);
    } else if (statusCode == 400) {
      return ServerFailure("Bad Request: $error", statusCode);
    } else {
      return ServerFailure('Unexpected Error: Please try again', statusCode);
    }
  }
}

class ErrorHandler {
  static Failure handleError(dynamic e) {
    if (e is DioException) {
      LoggerHelper.error('########### Dio Exception #################');
      LoggerHelper.error(e.message ?? "");
      return ServerFailure.fromDioError(e);
    } else if (e is SocketException) {
      // Handle SocketException separately if needed
      LoggerHelper.error('########### Socket Exception #################');
      LoggerHelper.error(e.message);
      return ServerFailure(
          'Network error: Please check your internet connection!', 606);
    } else if (e == 409) {
      return ServerFailure("Error Tyr agin", 409);
    } else if (e == Constants.responseIsNull) {
      return ServerFailure("Error Tyr agin Response Is null ", 409);
    }
    return ServerFailure(e.toString(), 500);
  }
}
