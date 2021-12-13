import 'package:boilerplate/models/order/Order.dart';
import 'package:mobx/mobx.dart';

part 'cart_store.g.dart';

class CartStore = _CartStore with _$CartStore;

abstract class _CartStore with Store {
  @observable
  List<Order> listOrder = [];

  @observable
  int badgeCount = 0;

  @action
  void addToList(Order order) {
    listOrder.add(order);
  }

  @action
  void updateQuantity(int index, int value) {
    listOrder[index].quantity = value;
  }

  @action
  void increaseBadge() {
    badgeCount++;
  }

  @action
  void decreaseBadge() {
    badgeCount++;
  }

  @action
  void resetCart(){
    badgeCount = 0;
    listOrder = <Order>[];
  }
}
