// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'recipe_store.dart';

// **************************************************************************
// StoreGenerator
// **************************************************************************

// ignore_for_file: non_constant_identifier_names, unnecessary_brace_in_string_interps, unnecessary_lambdas, prefer_expression_function_bodies, lines_longer_than_80_chars, avoid_as, avoid_annotating_with_dynamic

mixin _$RecipeStore on _RecipeStore, Store {
  Computed<bool>? _$loadingComputed;

  @override
  bool get loading => (_$loadingComputed ??=
          Computed<bool>(() => super.loading, name: '_RecipeStore.loading'))
      .value;
  Computed<Recipe>? _$recipeComComputed;

  @override
  Recipe get recipeCom =>
      (_$recipeComComputed ??= Computed<Recipe>(() => super.recipeCom,
              name: '_RecipeStore.recipeCom'))
          .value;

  final _$fetchRecipeAtom = Atom(name: '_RecipeStore.fetchRecipe');

  @override
  ObservableFuture<Recipe?> get fetchRecipe {
    _$fetchRecipeAtom.reportRead();
    return super.fetchRecipe;
  }

  @override
  set fetchRecipe(ObservableFuture<Recipe?> value) {
    _$fetchRecipeAtom.reportWrite(value, super.fetchRecipe, () {
      super.fetchRecipe = value;
    });
  }

  final _$recipeAtom = Atom(name: '_RecipeStore.recipe');

  @override
  Recipe get recipe {
    _$recipeAtom.reportRead();
    return super.recipe;
  }

  @override
  set recipe(Recipe value) {
    _$recipeAtom.reportWrite(value, super.recipe, () {
      super.recipe = value;
    });
  }

  final _$successAtom = Atom(name: '_RecipeStore.success');

  @override
  bool get success {
    _$successAtom.reportRead();
    return super.success;
  }

  @override
  set success(bool value) {
    _$successAtom.reportWrite(value, super.success, () {
      super.success = value;
    });
  }

  final _$nameAtom = Atom(name: '_RecipeStore.name');

  @override
  String get name {
    _$nameAtom.reportRead();
    return super.name;
  }

  @override
  set name(String value) {
    _$nameAtom.reportWrite(value, super.name, () {
      super.name = value;
    });
  }

  final _$descriptionAtom = Atom(name: '_RecipeStore.description');

  @override
  String get description {
    _$descriptionAtom.reportRead();
    return super.description;
  }

  @override
  set description(String value) {
    _$descriptionAtom.reportWrite(value, super.description, () {
      super.description = value;
    });
  }

  final _$stepsAtom = Atom(name: '_RecipeStore.steps');

  @override
  List<RecipeStep> get steps {
    _$stepsAtom.reportRead();
    return super.steps;
  }

  @override
  set steps(List<RecipeStep> value) {
    _$stepsAtom.reportWrite(value, super.steps, () {
      super.steps = value;
    });
  }

  final _$getRecipeAsyncAction = AsyncAction('_RecipeStore.getRecipe');

  @override
  Future<dynamic> getRecipe(String foodId) {
    return _$getRecipeAsyncAction.run(() => super.getRecipe(foodId));
  }

  final _$postRecipeAsyncAction = AsyncAction('_RecipeStore.postRecipe');

  @override
  Future<dynamic> postRecipe(dynamic recipeCom) {
    return _$postRecipeAsyncAction.run(() => super.postRecipe(recipeCom));
  }

  final _$_RecipeStoreActionController = ActionController(name: '_RecipeStore');

  @override
  void setName(String value) {
    final _$actionInfo = _$_RecipeStoreActionController.startAction(
        name: '_RecipeStore.setName');
    try {
      return super.setName(value);
    } finally {
      _$_RecipeStoreActionController.endAction(_$actionInfo);
    }
  }

  @override
  dynamic addStep(String value) {
    final _$actionInfo = _$_RecipeStoreActionController.startAction(
        name: '_RecipeStore.addStep');
    try {
      return super.addStep(value);
    } finally {
      _$_RecipeStoreActionController.endAction(_$actionInfo);
    }
  }

  @override
  String toString() {
    return '''
fetchRecipe: ${fetchRecipe},
recipe: ${recipe},
success: ${success},
name: ${name},
description: ${description},
steps: ${steps},
loading: ${loading},
recipeCom: ${recipeCom}
    ''';
  }
}
