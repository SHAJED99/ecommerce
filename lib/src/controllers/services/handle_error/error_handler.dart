import 'dart:async';
import 'dart:io';
import 'package:ecommerce/src/controllers/services/handle_error/app_exceptions.dart';
import 'package:flutter/foundation.dart';
import 'package:get/get_connect/http/src/exceptions/exceptions.dart';

class ErrorHandler {
  // Handle Error
  static Future<ErrorType> errorHandler(Function function) async {
    try {
      await function();
      return ErrorType.done;
    } on SocketException {
      if (kDebugMode) print("ErrorHandler: SocketException");
      InternetException();
      return ErrorType.internetException;
    } on TimeoutException {
      if (kDebugMode) print("ErrorHandler: TimeoutException");
      RequestTimeOut();
      return ErrorType.requestTimeOut;
    } on UnauthorizedException {
      if (kDebugMode) print("ErrorHandler: UnauthorizedException");
      InvalidUser();
      return ErrorType.invalidUser;
    } on ServiceUnavailable {
      if (kDebugMode) print("ErrorHandler: ServiceUnavailableException");
      ServiceUnavailable();
      return ErrorType.serviceUnavailable;
    } catch (e) {
      if (kDebugMode) print("ErrorHandler: $e");
      InternalError(message: "Code: $e");
      return ErrorType.unknownError;
    }
  }
}

enum ErrorType {
  done,
  internetException,
  requestTimeOut,
  invalidUser,
  serviceUnavailable,
  unknownError,
}
