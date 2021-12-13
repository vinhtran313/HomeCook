import 'package:boilerplate/stores/cart/cart_store.dart';
import 'package:boilerplate/utils/routes/routes.dart';
import 'package:boilerplate/widgets/complete_order.dart';
import 'package:flutter/material.dart';
import 'package:boilerplate/widgets/custom_button.dart';
import 'package:provider/provider.dart';

class CompleteOrderScreen extends StatefulWidget {
  @override
  _CompleteOrderScreenState createState() => _CompleteOrderScreenState();
}

class _CompleteOrderScreenState extends State<CompleteOrderScreen> {
  late CartStore _cartStore;

  void didChangeDependencies() {
    // TODO: implement didChangeDependencies
    super.didChangeDependencies();
    _cartStore = Provider.of<CartStore>(context);
  }

  @override
  Widget build(BuildContext context) {
    @override
    void onPress() {
      Navigator.of(context).popAndPushNamed(Routes.render);
      _cartStore.resetCart();
    }

    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        elevation: 0.0,
      ),
      body: Padding(
        padding: const EdgeInsets.all(20.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Container(
                margin: EdgeInsets.only(top: 100),
                child: CompleteOrderContent(
                  Icons.verified_outlined,
                  'Oder success',
                )),
            Container(
              width: double.infinity,
              child: CustomButton(
                title: 'Go To Home',
                onPress: onPress,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
