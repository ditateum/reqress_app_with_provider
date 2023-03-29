import 'package:dio/dio.dart';
import 'package:reqress_app/models/response_mode.dart';
import 'package:reqress_app/services/dio_error_handler.dart';

class ApiService {
  late final Dio _dio;

  ApiService() {
    _dio = Dio();
  }

  Future<ResponseModel?> getAllUser() async {
    const String baseUrl = 'https://reqres.in/api/users?page=2';
    final uri = Uri.parse(baseUrl);

    try {
      final response = await _dio.getUri(uri);
      if (response.statusCode == 200) {
        final data = response.data;
        return ResponseModel.fromMap(data);
      }
      return null;
    } on DioError catch (e) {
      throw Exception(dioErrorHandler(e));
    }
  }
}
