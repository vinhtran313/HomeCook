// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'list_recipe_store.dart';

// **************************************************************************
// StoreGenerator
// **************************************************************************

// ignore_for_file: non_constant_identifier_names, unnecessary_brace_in_string_interps, unnecessary_lambdas, prefer_expression_function_bodies, lines_longer_than_80_chars, avoid_as, avoid_annotating_with_dynamic

mixin _$RecipeListStore on _RecipeListStore, Store {
  final _$listItemAtom = Atom(name: '_RecipeListStore.listItem');

  @override
  List<Recipe> get listItem {
    _$listItemAtom.reportRead();
    return super.listItem;
  }

  @override
  set listItem(List<Recipe> value) {
    _$listItemAtom.reportWrite(value, super.listItem, () {
      super.listItem = value;
    });
  }

  final _$recipeAtom = Atom(name: '_RecipeListStore.recipe');

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

  final _$personalListAtom = Atom(name: '_RecipeListStore.personalList');

  @override
  List<Recipe> get personalList {
    _$personalListAtom.reportRead();
    return super.personalList;
  }

  @override
  set personalList(List<Recipe> value) {
    _$personalListAtom.reportWrite(value, super.personalList, () {
      super.personalList = value;
    });
  }

  final _$_RecipeListStoreActionController =
      ActionController(name: '_RecipeListStore');

  @override
  void addToList() {
    final _$actionInfo = _$_RecipeListStoreActionController.startAction(
        name: '_RecipeListStore.addToList');
    try {
      return super.addToList();
    } finally {
      _$_RecipeListStoreActionController.endAction(_$actionInfo);
    }
  }

  @override
  void updateRecipeName(String name) {
    final _$actionInfo = _$_RecipeListStoreActionController.startAction(
        name: '_RecipeListStore.updateRecipeName');
    try {
      return super.updateRecipeName(name);
    } finally {
      _$_RecipeListStoreActionController.endAction(_$actionInfo);
    }
  }

  @override
  void updateRecipeDescription(String description) {
    final _$actionInfo = _$_RecipeListStoreActionController.startAction(
        name: '_RecipeListStore.updateRecipeDescription');
    try {
      return super.updateRecipeDescription(description);
    } finally {
      _$_RecipeListStoreActionController.endAction(_$actionInfo);
    }
  }

  @override
  void updateRecipeImages(List<String> images) {
    final _$actionInfo = _$_RecipeListStoreActionController.startAction(
        name: '_RecipeListStore.updateRecipeImages');
    try {
      return super.updateRecipeImages(images);
    } finally {
      _$_RecipeListStoreActionController.endAction(_$actionInfo);
    }
  }

  @override
  void removeImage(int index) {
    final _$actionInfo = _$_RecipeListStoreActionController.startAction(
        name: '_RecipeListStore.removeImage');
    try {
      return super.removeImage(index);
    } finally {
      _$_RecipeListStoreActionController.endAction(_$actionInfo);
    }
  }

  @override
  void updateRecipeSteps(RecipeStep step, int index) {
    final _$actionInfo = _$_RecipeListStoreActionController.startAction(
        name: '_RecipeListStore.updateRecipeSteps');
    try {
      return super.updateRecipeSteps(step, index);
    } finally {
      _$_RecipeListStoreActionController.endAction(_$actionInfo);
    }
  }

  @override
  void addRecipeStep() {
    final _$actionInfo = _$_RecipeListStoreActionController.startAction(
        name: '_RecipeListStore.addRecipeStep');
    try {
      return super.addRecipeStep();
    } finally {
      _$_RecipeListStoreActionController.endAction(_$actionInfo);
    }
  }

  @override
  void updateRecipeThumbnail(String thumbnail) {
    final _$actionInfo = _$_RecipeListStoreActionController.startAction(
        name: '_RecipeListStore.updateRecipeThumbnail');
    try {
      return super.updateRecipeThumbnail(thumbnail);
    } finally {
      _$_RecipeListStoreActionController.endAction(_$actionInfo);
    }
  }

  @override
  void updateRecipeIngredients(String ingredient, int index) {
    final _$actionInfo = _$_RecipeListStoreActionController.startAction(
        name: '_RecipeListStore.updateRecipeIngredients');
    try {
      return super.updateRecipeIngredients(ingredient, index);
    } finally {
      _$_RecipeListStoreActionController.endAction(_$actionInfo);
    }
  }

  @override
  void addRecipeIngredients() {
    final _$actionInfo = _$_RecipeListStoreActionController.startAction(
        name: '_RecipeListStore.addRecipeIngredients');
    try {
      return super.addRecipeIngredients();
    } finally {
      _$_RecipeListStoreActionController.endAction(_$actionInfo);
    }
  }

  @override
  void updateRecipeId(String id) {
    final _$actionInfo = _$_RecipeListStoreActionController.startAction(
        name: '_RecipeListStore.updateRecipeId');
    try {
      return super.updateRecipeId(id);
    } finally {
      _$_RecipeListStoreActionController.endAction(_$actionInfo);
    }
  }

  @override
  void resetRecipe() {
    final _$actionInfo = _$_RecipeListStoreActionController.startAction(
        name: '_RecipeListStore.resetRecipe');
    try {
      return super.resetRecipe();
    } finally {
      _$_RecipeListStoreActionController.endAction(_$actionInfo);
    }
  }

  @override
  String toString() {
    return '''
listItem: ${listItem},
recipe: ${recipe},
personalList: ${personalList}
    ''';
  }
}
