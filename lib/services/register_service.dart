import 'dart:developer';
import 'package:all_widget/api_routs/api_handler.dart';
import 'package:all_widget/model/res_model.dart';

class RegisterService {
  static Future registerService(Map<String, dynamic>? body) async {
    var response = await ApiService().getResponse(
        apiType: APIType.aPost,
        url: 'https://api.mursalexpress.com/store/register',
        body: body);
    log('response --------- $response');
    RegisterResponseModel registerResponseModel =
        RegisterResponseModel.fromJson(response);
    log('response --------- $response');
    return registerResponseModel;
  }
}
