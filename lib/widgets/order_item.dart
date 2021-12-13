import 'package:boilerplate/models/order/Order.dart';
import 'package:flutter/material.dart';

class OrderItem extends StatelessWidget {
  final Order order;
  const OrderItem(
      {Key? key,
      required this.order,
     })
      : super(key: key);

  Text statusText() {
    if (order.status == 'pending') {
      return Text('Pending',
          style: TextStyle(
            color: Colors.grey,
          ));
    }
    if (order.status == 'delivering') {
      return Text('Delivering',
          style: TextStyle(
            color: Colors.blueAccent,
          ));
    }
    if (order.status == 'canceled') {
      return Text('Canceled',
          style: TextStyle(
            color: Colors.redAccent,
          ));
    }
    return Text('Done',
        style: TextStyle(
          color: Colors.green,
        ));
  }

  Widget build(BuildContext context) {
    return Card(
      color: Colors.white,
      elevation: 5.0,
      margin: EdgeInsets.fromLTRB(10, 10, 10, 20),
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(8)
      ),
      child: Padding(
        padding: const EdgeInsets.all(10),
        child: Column(
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  'Seller: ${order.sellerName}',
                  style: TextStyle(
                    fontWeight: FontWeight.bold,
                  ),
                ),
                statusText(),
              ],
            ),
            SizedBox(
              height: 10,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Container(
                  width: 60,
                  height: 60,
                  margin: EdgeInsets.only(right: 20),
                  decoration: BoxDecoration(
                      shape: BoxShape.circle,
                      image: DecorationImage(
                        image: NetworkImage(order.thumbnail.toString()),
                        fit: BoxFit.cover,
                      )),
                ),
                Column(
                  crossAxisAlignment: CrossAxisAlignment.end,
                  children: [
                    Text(order.foodName.toString()),
                    Text('x${order.quantity}'),
                    Text(
                      'Price: ${order.price}',
                      style: TextStyle(color: Colors.deepOrange),
                    )
                  ],
                ),
              ],
            ),
            Divider(
              height: 30,
              thickness: 1,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text('${order.buyerName}'),
                Text('Total: ${order.totalPrice}',
                    style: TextStyle(color: Colors.deepOrange)),
              ],
            )
          ],
        ),
      ),
    );
  }
}
