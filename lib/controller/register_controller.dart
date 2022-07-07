import 'package:all_widget/api_routs/api_response.dart';
import 'package:all_widget/model/register_model.dart';
import 'package:all_widget/model/res_model.dart';
import 'package:all_widget/services/register_service.dart';
import 'package:get/get.dart';

class RegisterController extends GetxController {
  ApiResponse _apiResponse = ApiResponse.initial(message: 'Initialization');
  ApiResponse get apiResponse => _apiResponse;
  late RegisterResponseModel response;
  Future getUser(RegisterModel model) async {
    _apiResponse = ApiResponse.loading(message: 'Loading');
    update();
    try {
      response = await RegisterService.registerService(model.toJson());
      print('Register User :- $response');
      _apiResponse = ApiResponse.complete(response);
    } catch (e) {
      print('ERROR :- $e ');
      _apiResponse = ApiResponse.error(message: 'Error');
    }
    update();
  }
}
