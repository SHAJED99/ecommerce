import 'package:ecommerce/src/controllers/services/user_message/snackbar.dart';
import 'package:ecommerce/src/models/app_models/app_constants.dart';
import 'package:flutter/material.dart';

abstract class AppExceptions {
  final String prefix;
  final String message;

  AppExceptions({this.prefix = "", this.message = ""}) {
    showSnackBar(
      title: prefix,
      message: message,
      icon: const Icon(Icons.error, color: defaultErrorColor),
    );
  }
}

// 1
class InternetException extends AppExceptions {
  InternetException({String? message}) : super(prefix: "Error", message: "No Internet Connection. ${message ?? ""}");
}

// 2
class RequestTimeOut extends AppExceptions {
  RequestTimeOut({String? message}) : super(prefix: "Error", message: "Request timeout. ${message ?? ""}");
}

// 3
class InternalError extends AppExceptions {
  InternalError({String? message}) : super(prefix: "Error", message: "There is an error while processing the request. ${message ?? ""}");
}

// 4
class ServiceUnavailable extends AppExceptions {
  ServiceUnavailable({String? message}) : super(prefix: "Error", message: "The server is temporarily busy, try again later! ${message ?? ""}");
}

// 5
class InvalidUser extends AppExceptions {
  InvalidUser({String? message}) : super(prefix: "Error", message: "User timeout. Please log in again. ${message ?? ""}");
}
