import 'package:boilerplate/data/repository.dart';
import 'package:boilerplate/stores/error/error_store.dart';
import 'package:mobx/mobx.dart';

part 'route_store.g.dart';

class RouteStore = _RouteStore with _$RouteStore;

abstract class _RouteStore with Store {
  static const String TAG = "RouteStore";
  // store for handling errors
  final ErrorStore errorStore = ErrorStore();

  // store variables:-----------------------------------------------------------
  @observable
  int pageIndex = 0;

  // actions:-------------------------------------------------------------------
  @action
  void changePage(int value) {
    pageIndex = value;
  }

  // dispose:-------------------------------------------------------------------
  @override
  dispose() {}
}
