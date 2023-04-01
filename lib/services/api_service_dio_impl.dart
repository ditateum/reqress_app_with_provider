import 'package:dio/dio.dart';
import 'package:reqress_app/models/response_model.dart';
import 'package:reqress_app/services/api_service.dart';
import 'package:reqress_app/services/dio_error_handler.dart';

class ApiServiceDio implements ApiService {
  late final Dio _dio;

  ApiServiceDio() {
    _dio = Dio();
  }

  @override
  Future<ResponseModel?> getAllUsers() async {
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
