import 'dart:async';
import 'dart:io';
import 'package:ecommerce/src/controllers/services/handle_error/app_exceptions.dart';
import 'package:flutter/foundation.dart';

class ErrorHandler {
  // Handle Error
  static Future<ErrorType> errorHandler({bool showError = true, required Function function}) async {
    try {
      await function();
      return ErrorType.done;
    } on SocketException {
      if (kDebugMode) print("ErrorHandler: SocketException");
      if (showError) InternetException();
      return ErrorType.internetException;
    } on TimeoutException {
      if (kDebugMode) print("ErrorHandler: TimeoutException");
      if (showError) RequestTimeOut();
      return ErrorType.requestTimeOut;
    } on ServiceUnavailable {
      if (kDebugMode) print("ErrorHandler: ServiceUnavailableException");
      if (showError) ServiceUnavailable();
      return ErrorType.serviceUnavailable;
    } catch (e) {
      if (e == 401) {
        if (kDebugMode) print("ErrorHandler: UnauthorizedException");
        if (showError) InvalidUser();
        return ErrorType.invalidUser;
      } else {
        if (kDebugMode) print("ErrorHandler: $e");
        if (showError) InternalError(message: "Code: $e");
        return ErrorType.unknownError;
      }
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
