import 'package:flutter/foundation.dart';

import '../constants/app_exception_messages.dart';
import 'failures.dart';


class ServerException implements Exception {
  final String message;
  ServerException(this.message);
}


Failure handleException(dynamic e, StackTrace stackTrace) {
  if (kDebugMode) {
    print("Exception: $e \n StackTrace: $stackTrace");
  }
  if (e is FormatException) {
    return ResponseFailure(AppExceptionMessage.format);
  } else if (e is TypeError) {
    return ResponseFailure(AppExceptionMessage.type);
  } else if (e is ServerException) {
    return ResponseFailure(e.message);
  } else {
    return ResponseFailure(AppExceptionMessage.unknown);
  }
}