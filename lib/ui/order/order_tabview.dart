import 'package:boilerplate/models/order/Order.dart';
import 'package:boilerplate/widgets/order_item.dart';
import 'package:flutter/material.dart';

class OrderTabview extends StatefulWidget {
  final List<Order> listItem;

  const OrderTabview({Key? key, required this.listItem}) : super(key: key);

  @override
  _OrderTabviewState createState() => _OrderTabviewState();
}

class _OrderTabviewState extends State<OrderTabview>
    with AutomaticKeepAliveClientMixin {
  @override
  Widget build(BuildContext context) {
    super.build(context);
    return Padding(
      padding: const EdgeInsets.only(top: 16.0),
      child: ListView.builder(
        itemBuilder: (context, index) {
          return OrderItem(order: widget.listItem[index]);
        },
        itemCount: widget.listItem.length,
      ),
    );
  }

  @override
  // TODO: implement wantKeepAlive
  bool get wantKeepAlive => true;
}
