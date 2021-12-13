import 'package:boilerplate/constants/font_family.dart';
import 'package:boilerplate/utils/routes/routes.dart';
import 'package:boilerplate/widgets/address_detail.dart';
import 'package:boilerplate/widgets/choose_method.dart';
import 'package:boilerplate/widgets/custom_button.dart';
import 'package:flutter/material.dart';
import 'package:boilerplate/utils/currency/convertCurrency.dart';
import 'dart:io';

class CheckoutScreen extends StatefulWidget {
  @override
  _CheckoutScreenState createState() => _CheckoutScreenState();
}

class _CheckoutScreenState extends State<CheckoutScreen> {
  int selectedRatio = 0;

  @override
  void initState() {
    selectedRatio = 0;
    // TODO: implement initState
    super.initState();
  }

  void setSelectedRatio(int val) {
    setState(() {
      selectedRatio = val;
    });
  }

  void onPress() {
    Navigator.of(context).pushNamed(Routes.payment);
  }

  @override
  Widget build(BuildContext context) {
    final dynamic appBar = AppBar(title: Text('Checkout'));
    return Scaffold(
      appBar: AppBar(
        title: Text(
          'Checkout',
          style: TextStyle(
            fontWeight: FontWeight.bold,
          ),
        ),
        backgroundColor: Colors.transparent,
        elevation: 0.0,
        centerTitle: true,
      ),
      body: Padding(
        padding: const EdgeInsets.all(20.0),
        child: SingleChildScrollView(
          child: Container(
            height: Platform.isIOS
                ? (MediaQuery.of(context).size.height -
                        appBar.preferredSize.height -
                        MediaQuery.of(context).padding.top) *
                    0.93
                : MediaQuery.of(context).size.height,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  'Delivery',
                  style: TextStyle(
                    fontSize: 30,
                    fontWeight: FontWeight.w900,
                    fontFamily: FontFamily.productSans,
                  ),
                ),
                AddressDetail(
                  'Marvis Kparobo',
                  'Km 5 refinery road oppsite re,public road, effurun, delta state',
                  '+234 9011039271',
                ),
                ChooseMethod(
                  'Door delivery',
                  'Pick up',
                  'Delivery method',
                  selectedRatio,
                  setSelectedRatio,
                  false,
                ),
                Container(
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(
                        'Total',
                        style: TextStyle(fontSize: 18),
                      ),
                      Text(
                        CurrencyUtils.covertCurrency(3000000),
                        style: TextStyle(
                          fontSize: 20,
                          fontWeight: FontWeight.w800,
                        ),
                      ),
                    ],
                  ),
                ),
                Container(
                  width: double.infinity,
                  child: CustomButton(
                    title: 'Proceed to payment',
                    onPress: onPress,
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
