import '../models/response_model.dart';

abstract class ApiService {
  Future<ResponseModel?> getAllUsers();
}
