import 'package:boilerplate/constants/colors.dart';
import 'package:boilerplate/stores/cart/cart_store.dart';
import 'package:boilerplate/widgets/cart_item.dart';
import 'package:boilerplate/widgets/custom_button.dart';
import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:provider/provider.dart';

class CartScreen extends StatefulWidget {
  const CartScreen({Key? key}) : super(key: key);

  @override
  _CartScreenState createState() => _CartScreenState();
}

class _CartScreenState extends State<CartScreen> {
  late CartStore _cartStore;

  @override
  void didChangeDependencies() {
    // TODO: implement didChangeDependencies
    super.didChangeDependencies();
    _cartStore = Provider.of<CartStore>(context);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: AppColors.appColor['appBackground'],
        appBar: AppBar(
          title: Text(
            'Cart',
            style: TextStyle(
              fontWeight: FontWeight.bold,
            ),
          ),
          centerTitle: true,
          backgroundColor: Colors.transparent,
          elevation: 0.0,
        ),
        body: Column(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Expanded(
              child: Observer(builder: (_) {
                return ListView.builder(
                  itemBuilder: (context, index) {
                    return CartItem(
                      order: _cartStore.listOrder[index],
                    );
                  },
                  itemCount: _cartStore.listOrder.length,
                );
              }),
            ),
            Container(
              width: double.infinity,
              padding: EdgeInsets.fromLTRB(16,16,16,25),
              child: CustomButton(title: 'Checkout', onPress: () {
                Navigator.pushNamed(context, '/checkout');
              }),
            )
          ],
        ));
  }
}
