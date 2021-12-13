import 'package:boilerplate/data/repositories/recipe_repository.dart';
import 'package:boilerplate/models/recipe/Recipe.dart';
import 'package:boilerplate/stores/error/error_store.dart';
import 'package:boilerplate/utils/dio/dio_error_util.dart';
import 'package:mobx/mobx.dart';

part 'recipe_store.g.dart';

class RecipeStore = _RecipeStore with _$RecipeStore;

abstract class _RecipeStore with Store {
  late RecipeRepository _recipeRepository;

  final ErrorStore errorStore = ErrorStore();

  _RecipeStore(RecipeRepository recipeRepository)
      : this._recipeRepository = recipeRepository;

  static ObservableFuture<Recipe?> nullRecipe = ObservableFuture.value(null);

  @observable
  ObservableFuture<Recipe?> fetchRecipe = ObservableFuture<Recipe?>(nullRecipe);

  @observable
  Recipe recipe = Recipe();

  @observable
  bool success = false;

  @observable
  String name = '';

  @observable
  String description = '';

  @observable
  List<RecipeStep> steps = [];

  @computed
  bool get loading => fetchRecipe.status == FutureStatus.pending;

  @action
  void setName(String value) {
    name = value;
  }

  @action addStep(String value){
    steps.add(RecipeStep(
      stepDescription: value,
      stepImgUrl: 'hihi'
    ));
    print(recipeCom.steps![0].stepDescription);
  }

  @computed
  Recipe get recipeCom => Recipe(
        name: name,
        steps: steps,
      );

  @action
  Future getRecipe(String foodId) async {
    final future = _recipeRepository.getRecipe(foodId);
    fetchRecipe = ObservableFuture(future);

    future.then((recipe) {
      this.recipe = recipe;
    }).catchError((error) {
      errorStore.errorMessage = DioErrorUtil.handleError(error);
    });
  }

  @action
  Future postRecipe(recipeCom) async {
    final future = _recipeRepository.postRecipe(recipeCom);
    future.then((msg) {
      print(msg);
    }).catchError((error) {
      errorStore.errorMessage = DioErrorUtil.handleError(error);
    });
  }
}
