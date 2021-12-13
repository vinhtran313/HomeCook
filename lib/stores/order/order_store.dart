import 'package:boilerplate/models/order/Order.dart';
import 'package:mobx/mobx.dart';

part 'order_store.g.dart';

class OrderStore = _OrderStore with _$OrderStore;

abstract class _OrderStore with Store {
  @observable
  List<Order> listOrder = [
    Order(
        id: 'order1',
        foodName: 'Grandmother\'s Old Fashioned Butter Roll',
        sellerName: 'Jonny Depp',
        price: '15000',
        quantity: 2,
        totalPrice: '30000',
        thumbnail:
            'https://imagesvc.meredithcorp.io/v3/mm/image?url=https%3A%2F%2Fimages.media-allrecipes.com%2Fuserphotos%2F1110624.jpg&w=596&h=399&c=sc&poi=face&q=85',
        buyerName: 'alex',
        status: 'pending'),
    Order(
        id: 'order2',
        foodName: 'Vietnamese Banh mi',
        sellerName: 'Alison Becker',
        price: '18000',
        quantity: 3,
        totalPrice: '54000',
        thumbnail:
            'https://cdn.loveandlemons.com/wp-content/uploads/2019/02/banh-mi-580x588.jpg',
        buyerName: 'alex',
        status: 'delivering'),
    Order(
        id: 'order3',
        foodName: 'Beef Pho',
        sellerName: 'Vinh Tran',
        price: '30000',
        quantity: 1,
        totalPrice: '30000',
        thumbnail:
            'https://image-us.eva.vn/upload/2-2019/images/2019-06-28/cach-nau-pho-bo-thom-ngon-chuan-vi-don-gian-tai-nha-cach-nau-pho-bo-5-1561709484-618-width600height370.jpg',
        buyerName: 'alex',
        status: 'canceled'),
    Order(
        id: 'order4',
        foodName: 'Vietnamese Banh mi',
        sellerName: 'alex',
        price: '25000',
        quantity: 2,
        totalPrice: '50000',
        thumbnail:
            'https://cdn.loveandlemons.com/wp-content/uploads/2019/02/banh-mi-580x588.jpg',
        buyerName: 'Vinh Tran',
        status: 'canceled'),
    Order(
        id: 'order4',
        foodName: 'Grandmother\'s Old Fashioned Butter Roll',
        sellerName: 'alex',
        price: '25000',
        quantity: 2,
        totalPrice: '50000',
        thumbnail:
            'https://imagesvc.meredithcorp.io/v3/mm/image?url=https%3A%2F%2Fimages.media-allrecipes.com%2Fuserphotos%2F1110624.jpg&w=596&h=399&c=sc&poi=face&q=85',
        buyerName: 'Cristiano Ronaldo',
        status: 'delivering'),
    Order(
        id: 'order4',
        foodName: 'Beef Pho',
        sellerName: 'alex',
        price: '25000',
        quantity: 2,
        totalPrice: '50000',
        thumbnail:
            'https://imagesvc.meredithcorp.io/v3/mm/image?url=https%3A%2F%2Fimages.media-allrecipes.com%2Fuserphotos%2F1110624.jpg&w=596&h=399&c=sc&poi=face&q=85',
        buyerName: 'Van Quyen',
        status: 'done'),
    Order(
        id: 'order4',
        foodName: 'Vietnamese Banh mi',
        sellerName: 'alex',
        price: '25000',
        quantity: 2,
        totalPrice: '50000',
        thumbnail:
            'https://cdn.loveandlemons.com/wp-content/uploads/2019/02/banh-mi-580x588.jpg',
        buyerName: 'Hoang Anh',
        status: 'pending'),
  ];

  @action
  void addToList(Order order) {
    listOrder.add(order);
  }
}
