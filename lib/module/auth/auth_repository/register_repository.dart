import 'package:seventh_sem_project/constant/api_url.dart';
import 'package:seventh_sem_project/module/auth/model/user_model.dart';
import 'package:seventh_sem_project/services/base_repo_services.dart';
import 'package:seventh_sem_project/services/debug_print_service.dart';

class RegisterRepository {
  Future<NewUserModel> registerUser(NewUserModel newUserModel) async {
    final response = await apiInstance.postData(url: ApiUrl.register, data: newUserModel.toJson());
    sPrint('response: $response');
    return NewUserModel.fromJson(response);
  }
}