import 'package:all_widget/api_routs/api_response.dart';
import 'package:all_widget/model/pokemon_model.dart';
import 'package:all_widget/services/pokemon_services.dart';
import 'package:get/get.dart';

class Pokemon1Controller extends GetxController {
  ApiResponse _apiResponse = ApiResponse.initial(message: 'Initialazation');
  ApiResponse get apiResponse => _apiResponse;
  onInit() {
    getData();
  }

  Future getData() async {
    _apiResponse = ApiResponse.loading(message: 'Loading');

    try {
      PokemonModel? model = await PokemonService1.pokemonServices();
      _apiResponse = ApiResponse.complete(model);
    } catch (e) {
      print('ERROR :- $e ');
      _apiResponse = ApiResponse.error(message: 'Error');
    }
    update();
  }
}
