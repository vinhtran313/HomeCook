// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'cart_store.dart';

// **************************************************************************
// StoreGenerator
// **************************************************************************

// ignore_for_file: non_constant_identifier_names, unnecessary_brace_in_string_interps, unnecessary_lambdas, prefer_expression_function_bodies, lines_longer_than_80_chars, avoid_as, avoid_annotating_with_dynamic

mixin _$CartStore on _CartStore, Store {
  final _$listOrderAtom = Atom(name: '_CartStore.listOrder');

  @override
  List<Order> get listOrder {
    _$listOrderAtom.reportRead();
    return super.listOrder;
  }

  @override
  set listOrder(List<Order> value) {
    _$listOrderAtom.reportWrite(value, super.listOrder, () {
      super.listOrder = value;
    });
  }

  final _$badgeCountAtom = Atom(name: '_CartStore.badgeCount');

  @override
  int get badgeCount {
    _$badgeCountAtom.reportRead();
    return super.badgeCount;
  }

  @override
  set badgeCount(int value) {
    _$badgeCountAtom.reportWrite(value, super.badgeCount, () {
      super.badgeCount = value;
    });
  }

  final _$_CartStoreActionController = ActionController(name: '_CartStore');

  @override
  void addToList(Order order) {
    final _$actionInfo =
        _$_CartStoreActionController.startAction(name: '_CartStore.addToList');
    try {
      return super.addToList(order);
    } finally {
      _$_CartStoreActionController.endAction(_$actionInfo);
    }
  }

  @override
  void updateQuantity(int index, int value) {
    final _$actionInfo = _$_CartStoreActionController.startAction(
        name: '_CartStore.updateQuantity');
    try {
      return super.updateQuantity(index, value);
    } finally {
      _$_CartStoreActionController.endAction(_$actionInfo);
    }
  }

  @override
  void increaseBadge() {
    final _$actionInfo = _$_CartStoreActionController.startAction(
        name: '_CartStore.increaseBadge');
    try {
      return super.increaseBadge();
    } finally {
      _$_CartStoreActionController.endAction(_$actionInfo);
    }
  }

  @override
  void decreaseBadge() {
    final _$actionInfo = _$_CartStoreActionController.startAction(
        name: '_CartStore.decreaseBadge');
    try {
      return super.decreaseBadge();
    } finally {
      _$_CartStoreActionController.endAction(_$actionInfo);
    }
  }

  @override
  void resetCart() {
    final _$actionInfo =
        _$_CartStoreActionController.startAction(name: '_CartStore.resetCart');
    try {
      return super.resetCart();
    } finally {
      _$_CartStoreActionController.endAction(_$actionInfo);
    }
  }

  @override
  String toString() {
    return '''
listOrder: ${listOrder},
badgeCount: ${badgeCount}
    ''';
  }
}
