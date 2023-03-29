import 'package:dio/dio.dart';

String dioErrorHandler(DioError e) {
  final statusCode = e.error;
  final reasonPhrase = e.message;

  final errorMessage =
      'Request failed\nStatus Code: $statusCode\nReason: $reasonPhrase';

  return errorMessage;
}
