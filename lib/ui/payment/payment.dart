import 'package:boilerplate/utils/routes/routes.dart';
import 'package:flutter/material.dart';
import 'package:boilerplate/widgets/choose_method.dart';
import 'package:boilerplate/widgets/custom_button.dart';
import 'package:boilerplate/constants/font_family.dart';
import 'package:boilerplate/utils/currency/convertCurrency.dart';
import 'dart:io';

class PaymentScreen extends StatefulWidget {
  @override
  _PaymentScreenState createState() => _PaymentScreenState();
}

class _PaymentScreenState extends State<PaymentScreen> {
  int selectedRatio = 0;
  int selectedRatioPayment = 0;

  @override
  void initState() {
    selectedRatio = 0;
    selectedRatioPayment = 0;
    // TODO: implement initState
    super.initState();
  }

  void setSelectedRatio(int val) {
    setState(() {
      selectedRatio = val;
    });
  }

  void setSelectedRatioPayment(int val) {
    setState(() {
      selectedRatioPayment = val;
    });
  }

  void onPress() {
    Navigator.of(context).pushNamed(Routes.completeOrder);
  }

  @override
  Widget build(BuildContext context) {
    final dynamic appBar = AppBar(title: Text('Checkout'));
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        elevation: 0.0,
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
                  'Payment',
                  style: TextStyle(
                    fontSize: 30,
                    fontWeight: FontWeight.w900,
                    fontFamily: FontFamily.productSans,
                  ),
                ),
                ChooseMethod(
                  'Card',
                  'Bank account',
                  'Payment method',
                  selectedRatioPayment,
                  setSelectedRatioPayment,
                  true,
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
                  margin: EdgeInsets.only(top: 10, bottom: 10),
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
