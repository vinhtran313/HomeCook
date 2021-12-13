import 'package:boilerplate/models/food/Food.dart';
import 'package:mobx/mobx.dart';

part 'food_store.g.dart';

class FoodStore = _FoodStore with _$FoodStore;

abstract class _FoodStore with Store {
  @observable
  List<Food> listFood = [
    Food(
        id: 'food1',
        description:
            'If you like butter, you\'ll love these simple but delicious butter rolls. They\'re baked in a sweet milk sauce. Just the thing for a cold morning.',
        thumbnail:
            'https://imagesvc.meredithcorp.io/v3/mm/image?url=https%3A%2F%2Fimages.media-allrecipes.com%2Fuserphotos%2F1110624.jpg&w=596&h=399&c=sc&poi=face&q=85',
        name: 'Grandmother\'s Old Fashioned Butter Roll',
        creatorName: 'Jonny Depp',
        price: '15000'),
    Food(
        id: 'food2',
        description:
            'If you like butter, you\'ll love these simple but delicious butter rolls. They\'re baked in a sweet milk sauce. Just the thing for a cold morning.',
        thumbnail:
            'https://imagesvc.meredithcorp.io/v3/mm/image?url=https%3A%2F%2Fimages.media-allrecipes.com%2Fuserphotos%2F1110624.jpg&w=596&h=399&c=sc&poi=face&q=85',
        name: 'Grandmother\'s Old Fashioned Butter Roll',
        creatorName: 'Alison Becker',
        price: '17000'),
    Food(
        id: 'food3',
        description:
            'Instead of stuffing this banh mi sandwich with meat, I fill it with zesty marinated tofu. Pickled veggies and cilantro leaves take it over the top.',
        thumbnail:
            'https://cdn.loveandlemons.com/wp-content/uploads/2019/02/banh-mi-580x588.jpg',
        name: 'Vietnamese Banh mi',
        creatorName: 'Alison Becker',
        price: '18000'),
    Food(
        id: 'food4',
        description:
            'Instead of stuffing this banh mi sandwich with meat, I fill it with zesty marinated tofu. Pickled veggies and cilantro leaves take it over the top.',
        thumbnail:
            'https://cdn.loveandlemons.com/wp-content/uploads/2019/02/banh-mi-580x588.jpg',
        name: 'Vietnamese Banh mi',
        creatorName: 'De Gea',
        price: '20000'),
    Food(
        id: 'food5',
        description:
            'Instead of stuffing this banh mi sandwich with meat, I fill it with zesty marinated tofu. Pickled veggies and cilantro leaves take it over the top.',
        thumbnail:
            'https://cdn.loveandlemons.com/wp-content/uploads/2019/02/banh-mi-580x588.jpg',
        name: 'Vietnamese Banh mi',
        creatorName: 'Cristiano Ronaldo',
        price: '22000'),
    Food(
        id: 'food6',
        description:
            'This delicious homemade pho recipe is inspired by the Vietnamese soup we all know and love, yet made with a few time-saving shortcuts.',
        thumbnail:
            'https://image-us.eva.vn/upload/2-2019/images/2019-06-28/cach-nau-pho-bo-thom-ngon-chuan-vi-don-gian-tai-nha-cach-nau-pho-bo-5-1561709484-618-width600height370.jpg',
        name: 'Beef Pho',
        creatorName: 'Cristiano Ronaldo',
        price: '25000'),
    Food(
        id: 'food7',
        description:
            'This delicious homemade pho recipe is inspired by the Vietnamese soup we all know and love, yet made with a few time-saving shortcuts.',
        thumbnail:
            'https://image-us.eva.vn/upload/2-2019/images/2019-06-28/cach-nau-pho-bo-thom-ngon-chuan-vi-don-gian-tai-nha-cach-nau-pho-bo-5-1561709484-618-width600height370.jpg',
        name: 'Beef Pho',
        creatorName: 'Vinh Tran',
        price: '30000'),
    Food(
        id: 'food7',
        description:
            'This delicious homemade pho recipe is inspired by the Vietnamese soup we all know and love, yet made with a few time-saving shortcuts.',
        thumbnail:
            'https://image-us.eva.vn/upload/2-2019/images/2019-06-28/cach-nau-pho-bo-thom-ngon-chuan-vi-don-gian-tai-nha-cach-nau-pho-bo-5-1561709484-618-width600height370.jpg',
        name: 'Beef Pho',
        creatorName: 'Hoang Anh',
        price: '30000'),
  ];

  @action
  void addToList(Food food){
    listFood.add(food);
  }
}
