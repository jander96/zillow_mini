import 'dart:async';
import 'dart:io';

import 'package:dio/dio.dart';
import 'package:fpdart/fpdart.dart';
import 'package:zillow_mini/src/core/data/app_error.dart';

mixin ErrorHandler {

  Future<Either<AppError, R>> runCatching<R>(Future<R> Function() task) async {
    try {
      final result = await task();
      return Right(result);
    } on Exception catch (e) {
      return Left(_mapExceptionToAppError(e));
    }
  }

  AppError _mapExceptionToAppError(dynamic e) {
    if (e is TimeoutException) return TimeoutError(message: e.message);

    if (e is SocketException) return ConnectionError(message: e.message);

    if (e is DioException) {
      final response = e.response;
      final statusCode = response?.statusCode;

      return switch (statusCode) {
        400 => RequestError(message: response?.statusMessage),
        401 => UnauthorizedError(message: response?.statusMessage),
        404 => NotFoundError(message: response?.statusMessage),
        500 => ServerError(message: response?.statusMessage),
        _ => switch (e.type) {
          DioExceptionType.connectionTimeout => TimeoutError(message: e.message),
          DioExceptionType.sendTimeout => TimeoutError(message: e.message),
          DioExceptionType.receiveTimeout => TimeoutError(message: e.message),
          DioExceptionType.badCertificate => ConnectionError(message: e.message),
          DioExceptionType.connectionError => ConnectionError(message: e.message),
          DioExceptionType.cancel => UnknownError(message: e.message),
          DioExceptionType.unknown => UnknownError(message: e.message),
          DioExceptionType.badResponse => UnknownError(message: response?.statusMessage),
        },
      };
    }

    return UnknownError(message: e.toString());
  }
}