// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'food_store.dart';

// **************************************************************************
// StoreGenerator
// **************************************************************************

// ignore_for_file: non_constant_identifier_names, unnecessary_brace_in_string_interps, unnecessary_lambdas, prefer_expression_function_bodies, lines_longer_than_80_chars, avoid_as, avoid_annotating_with_dynamic

mixin _$FoodStore on _FoodStore, Store {
  final _$listFoodAtom = Atom(name: '_FoodStore.listFood');

  @override
  List<Food> get listFood {
    _$listFoodAtom.reportRead();
    return super.listFood;
  }

  @override
  set listFood(List<Food> value) {
    _$listFoodAtom.reportWrite(value, super.listFood, () {
      super.listFood = value;
    });
  }

  final _$_FoodStoreActionController = ActionController(name: '_FoodStore');

  @override
  void addToList(Food food) {
    final _$actionInfo =
        _$_FoodStoreActionController.startAction(name: '_FoodStore.addToList');
    try {
      return super.addToList(food);
    } finally {
      _$_FoodStoreActionController.endAction(_$actionInfo);
    }
  }

  @override
  String toString() {
    return '''
listFood: ${listFood}
    ''';
  }
}
