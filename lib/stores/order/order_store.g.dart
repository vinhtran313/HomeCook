// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'order_store.dart';

// **************************************************************************
// StoreGenerator
// **************************************************************************

// ignore_for_file: non_constant_identifier_names, unnecessary_brace_in_string_interps, unnecessary_lambdas, prefer_expression_function_bodies, lines_longer_than_80_chars, avoid_as, avoid_annotating_with_dynamic

mixin _$OrderStore on _OrderStore, Store {
  final _$listOrderAtom = Atom(name: '_OrderStore.listOrder');

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

  final _$_OrderStoreActionController = ActionController(name: '_OrderStore');

  @override
  void addToList(Order order) {
    final _$actionInfo = _$_OrderStoreActionController.startAction(
        name: '_OrderStore.addToList');
    try {
      return super.addToList(order);
    } finally {
      _$_OrderStoreActionController.endAction(_$actionInfo);
    }
  }

  @override
  String toString() {
    return '''
listOrder: ${listOrder}
    ''';
  }
}
