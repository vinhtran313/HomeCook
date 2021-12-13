import 'package:boilerplate/data/network/apis/recipe/recipe_api.dart';
import 'package:boilerplate/models/recipe/Recipe.dart';

class RecipeRepository {
  final RecipeApi _recipeApi;

  RecipeRepository(this._recipeApi);

  Future<Recipe> getRecipe(String foodId) async {
    // check to see if posts are present in database, then fetch from database
    // else make a network call to get all posts, store them into database for
    // later use
    return await _recipeApi.getRecipe(foodId).then((recipe) {
      return recipe;
    }).catchError((error) => throw error);
  }

  Future<String> postRecipe(recipe) async {
    return await _recipeApi.postRecipe(recipe).then((msg) {
      return msg;
    }).catchError((error) => throw error);
  }
}
