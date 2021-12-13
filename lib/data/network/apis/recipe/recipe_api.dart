import 'dart:async';
import 'package:boilerplate/data/network/constants/endpoints.dart';
import 'package:boilerplate/data/network/dio_client.dart';
import 'package:boilerplate/models/recipe/Recipe.dart';

class RecipeApi {
  final DioClient _dioClient;

  RecipeApi(this._dioClient);

  Future<Recipe> getRecipe(String foodId) async {
    try {
      final res = await _dioClient.get(
        Endpoints.getRecipe + foodId,
      );
      return Recipe.fromMap(res);
    } catch (e) {
      print(e.toString());
      throw e;
    }
  }

  Future<String> postRecipe(recipe) async {
    try {
      final res = await _dioClient.post(Endpoints.postRecipe);
      return res.status;
    } catch (e) {
      print(e.toString());
      throw e;
    }
  }
}
