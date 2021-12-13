import 'package:boilerplate/models/order/Order.dart';
import 'package:boilerplate/widgets/checkbox_widget.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class CartItem extends StatefulWidget {
  final Order order;
  late final bool checked;

  CartItem({required this.order});

  @override
  _CartItemState createState() => _CartItemState();
}

class _CartItemState extends State<CartItem> {
  void checkboxCallback(value) {
    setState(() {
      widget.checked = value;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      constraints: BoxConstraints(maxHeight: 150),
      decoration: BoxDecoration(
        color: Colors.white,
      ),
      child: Row(
        children: [
          CheckBoxWidget(
            callback: (value) => checkboxCallback(value),
          ),
          Container(
            width: 100,
            height: 100,
            decoration: BoxDecoration(
              image: DecorationImage(
                image: NetworkImage(widget.order.thumbnail.toString()),
                fit: BoxFit.cover,
              ),
            ),
          ),
          Expanded(
            child: Padding(
              padding: const EdgeInsets.fromLTRB(16,25,16,25),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    widget.order.foodName.toString(),
                    style: TextStyle(fontWeight: FontWeight.bold, fontSize: 16),
                  ),
                  Text(
                    'Seller: ${widget.order.sellerName.toString()}',
                    style: TextStyle(fontSize: 14),
                  ),
                  Text(
                    '${widget.order.price} \$',
                    style: TextStyle(
                        color: Colors.deepOrange,
                        fontSize: 14,
                        fontWeight: FontWeight.bold),
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Row(
                        children: [
                          Icon(Icons.remove),
                          Padding(
                            padding: const EdgeInsets.only(right: 8.0, left: 8.0),
                            child: Text(
                              '${widget.order.quantity}',
                              style: TextStyle(
                                  color: Colors.deepOrange,
                                  fontWeight: FontWeight.bold,
                                  fontSize: 14),
                            ),
                          ),
                          Icon(Icons.add)
                        ],
                      ),
                      Text(
                        '${widget.order.totalPrice} \$',
                        style: TextStyle(
                            color: Colors.deepOrange,
                            fontSize: 16,
                            fontWeight: FontWeight.bold),
                      ),
                    ],
                  ),

                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
