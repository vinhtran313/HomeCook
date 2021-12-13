import 'package:boilerplate/models/food/Food.dart';
import 'package:mobx/mobx.dart';

part 'my_food_store.g.dart';

class MyFoodStore = _MyFoodStore with _$MyFoodStore;

abstract class _MyFoodStore with Store {
  @observable
  List<Food> listFood = [];

  @action
  void addToList(Food food){
    listFood.add(food);
  }
}
