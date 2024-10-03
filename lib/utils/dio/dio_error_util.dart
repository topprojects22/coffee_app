import 'package:dio/dio.dart';

class DioExceptionUtil {
  // general methods:-----------------------------------------------------------
  static String handleError(DioException error) {
    String errorDescription = '';
    switch (error.type) {
      case DioExceptionType.cancel:
        errorDescription = 'Request to API server was cancelled';
      case DioExceptionType.connectionError:
      case DioExceptionType.connectionTimeout:
      case DioExceptionType.unknown:
        errorDescription = 'Connection timeout with API server';
      case DioExceptionType.receiveTimeout:
        errorDescription = 'Receive timeout in connection with API server';
      case DioExceptionType.badResponse:
        errorDescription =
            'Received invalid status code: ${error.response?.statusCode}';
      case DioExceptionType.sendTimeout:
        errorDescription = 'Send timeout in connection with API server';
      case DioExceptionType.badCertificate:
        errorDescription = 'Incorrect certificate';
    }
      return errorDescription;
  }
}
