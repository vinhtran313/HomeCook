import 'package:boilerplate/ui/cart/cart.dart';
import 'package:boilerplate/ui/complete_order/complete_order.dart';
import 'package:boilerplate/ui/create_food/create_food.dart';
import 'package:boilerplate/ui/create_recipe/create_recipe.dart';
import 'package:boilerplate/ui/my_store/my_store.dart';
import 'package:boilerplate/ui/orderDetail/order_detail.dart';
import 'package:boilerplate/ui/payment/payment.dart';
import 'package:boilerplate/ui/profile/profile.dart';
import 'package:boilerplate/ui/render.dart';
import 'package:boilerplate/ui/login/login.dart';
import 'package:boilerplate/ui/search/search.dart';
import 'package:boilerplate/ui/splash/splash.dart';
import 'package:flutter/material.dart';
import 'package:boilerplate/ui/sellers/sellers.dart';
import 'package:boilerplate/ui/checkout/checkout.dart';
import 'package:boilerplate/ui/home/home.dart';

class Routes {
  Routes._();

  //static variables
  static const String splash = '/splash';
  static const String login = '/login';
  static const String render = '/render';
  static const String home = '/home';
  static const String sellers = '/sellers';
  static const String checkout = '/checkout';
  static const String search = '/search';
  static const String payment = '/payment';
  static const String completeOrder = '/completeOrder';
  static const String orderDetail = '/orderDetail';
  static const String createRecipe = '/createRecipe';
  static const String createFood = '/createFood';
  static const String myStore = '/myStore';
  static const String profile = '/profile';
  static const String cart = '/cart';

  static final routes = <String, WidgetBuilder>{
    splash: (BuildContext context) => SplashScreen(),
    login: (BuildContext context) => LoginScreen(),
    render: (BuildContext context) => RenderScreen(),
    home: (BuildContext context) => HomeScreen(),
    sellers: (BuildContext context) => SellersScreen(),
    checkout: (BuildContext context) => CheckoutScreen(),
    search: (BuildContext context) => SearchScreen(),
    payment: (BuildContext context) => PaymentScreen(),
    completeOrder: (BuildContext context) => CompleteOrderScreen(),
    orderDetail: (BuildContext context) => OrderDetail(),
    createRecipe: (BuildContext context) => CreateRecipe(),
    createFood: (BuildContext context) => CreateFood(),
    myStore: (BuildContext context) => MyStore(),
    profile: (BuildContext context) => ProfileScreen(),
    cart: (BuildContext context) => CartScreen(),
  };
}
