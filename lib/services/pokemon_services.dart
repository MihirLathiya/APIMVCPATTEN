import 'dart:convert';

import 'package:all_widget/api_routs/api_handler.dart';
import 'package:all_widget/api_routs/api_routs.dart';
import 'package:http/http.dart' as http;

import '../model/pokemon_model.dart';

class PokemonServices {
  static Future<PokemonModel?> pokemonServices() async {
    http.Response response = await http.get(
      Uri.parse(ApiRouts.pokemonUrl),
    );
    if (response.statusCode == 200) {
      print('===>>> ${jsonDecode(response.body)}');
      var jsonString = response.body;
      return pokemonModelFromJson(jsonString);
    }
    return null;
  }
}

class PokemonService1 {
  static Future pokemonServices() async {
    var response = await ApiService()
        .getResponse(apiType: APIType.aGet, url: ApiRouts.pokemonUrl);
    PokemonModel pokemonModel = PokemonModel.fromJson(response);
    return pokemonModel;
  }
}
