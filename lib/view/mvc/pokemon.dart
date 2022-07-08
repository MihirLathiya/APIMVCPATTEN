import 'package:all_widget/api_routs/api_response.dart';
import 'package:all_widget/controller/pokemon1_controller.dart';
import 'package:all_widget/model/pokemon_model.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:shimmer/shimmer.dart';

class Pokemon1Screen extends StatefulWidget {
  const Pokemon1Screen({Key? key}) : super(key: key);

  @override
  State<Pokemon1Screen> createState() => _Pokemon1ScreenState();
}

class _Pokemon1ScreenState extends State<Pokemon1Screen> {
  Pokemon1Controller pokemon1controller = Get.put(Pokemon1Controller());
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: GetBuilder<Pokemon1Controller>(
        builder: (controller) {
          if (controller.apiResponse.status == Status.COMPLETE) {
            PokemonModel response = controller.apiResponse.data;

            return GridView.builder(
              itemCount: response.pokemon?.length,
              gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                crossAxisCount: 2,
              ),
              itemBuilder: (context, index) {
                return ClipRRect(
                  borderRadius: BorderRadius.circular(10),
                  child: ImageLoading(
                    url: '${response.pokemon?[index].img}',
                    width: 100.0,
                    hight: 100.0,
                  ),
                );
              },
            );
          } else {
            if (controller.apiResponse.status == Status.ERROR) {
              return Center(child: Text('ERROR'));
            }
            return Center(child: Text('LOADING....'));
          }
        },
      ),
    );
  }
}

Widget ImageLoading({String? url, double? hight, double? width}) {
  return CachedNetworkImage(
    imageUrl: url!,
    height: hight!,
    width: width,
    fit: BoxFit.cover,
    placeholder: (context, url) => Shimmer.fromColors(
      baseColor: Colors.grey.shade200,
      highlightColor: Colors.grey.shade300,
      child: Container(
        height: hight,
        width: width!,
        color: Colors.grey.shade400,
      ),
    ),
    errorWidget: (context, url, error) => const Icon(Icons.error),
  );
}
