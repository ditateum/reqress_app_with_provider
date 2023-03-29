import 'package:reqress_app/models/custom_error.dart';
import 'package:reqress_app/models/response_mode.dart';
import 'package:reqress_app/models/user_model.dart';
import 'package:reqress_app/services/api_service.dart';

class ReqresRepository {
  final ApiService apiService;

  ReqresRepository({
    required this.apiService,
  });

  Future<List<User>?> getAllUserReqress() async {
    try {
      final result = await apiService.getAllUser();
      if (result != null) {
        final ResponseModel response = result;
        return response.data;
      }
      return null;
    } catch (e) {
      throw CustomError(errMsg: e.toString());
    }
  }
}
