import 'package:http/http.dart' as http;
import 'package:reqress_app/services/api_service.dart';

import '../models/response_model.dart';

class ApiServiceHttp implements ApiService {
  late final http.Client _httpClient;

  ApiServiceHttp() {
    _httpClient = http.Client();
  }

  @override
  Future<ResponseModel?> getAllUsers() async {
    const String baseUrl = 'https://reqres.in/api/users?page=2';
    final uri = Uri.parse(baseUrl);

    try {
      final response = await _httpClient.get(uri);
      if (response.statusCode == 200) {
        final data = response.body;

        /// mengembalikan string object/json

        return ResponseModel.fromJson(data);
      }
      return null;
    } catch (e) {
      throw Exception(e);
    }
  }
}
