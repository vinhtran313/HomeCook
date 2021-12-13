import 'package:boilerplate/models/order/Order.dart';
import 'package:boilerplate/stores/order/order_store.dart';
import 'package:boilerplate/ui/order/order_tabview.dart';
import 'package:boilerplate/widgets/order_item.dart';
import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:provider/provider.dart';

class SellingTab extends StatefulWidget {
  const SellingTab({Key? key}) : super(key: key);

  @override
  _SellingTabState createState() => _SellingTabState();
}

class _SellingTabState extends State<SellingTab> with TickerProviderStateMixin {
  late TabController _tabController;
  late OrderStore _orderStore;
  static const List<Tab> listTabs = <Tab>[
    Tab(text: 'Pending'),
    Tab(text: 'Delivering'),
    Tab(
      text: 'Canceled',
    ),
    Tab(text: 'Done')
  ];

  @override
  void didChangeDependencies() {
    // TODO: implement didChangeDependencies
    super.didChangeDependencies();
    _orderStore = Provider.of<OrderStore>(context);
  }

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    _tabController = new TabController(length: listTabs.length, vsync: this);
  }

  @override
  void dispose() {
    // TODO: implement dispose
    _tabController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.spaceAround,
      children: [
        TabBar(
          controller: _tabController,
          indicatorColor: Colors.deepOrangeAccent,
          tabs: listTabs.toList(),
          indicatorSize: TabBarIndicatorSize.tab,
          labelColor: Colors.deepOrange,
          unselectedLabelColor: Colors.black54,
        ),
        Expanded(
          child: Observer(
            builder:(_){
              List<Order> listItem = _orderStore.listOrder.where((order) => order.sellerName =='alex').toList();
              return Container(
              margin: EdgeInsets.only(left: 8, right: 8),
              child: TabBarView(
                controller: _tabController,
                children: <Widget>[
                  OrderTabview(listItem: listItem.where((item) => item.status=='pending').toList()),
                  OrderTabview(listItem: listItem.where((item) => item.status=='delivering').toList()),
                  OrderTabview(listItem: listItem.where((item) => item.status=='canceled').toList()),
                  OrderTabview(listItem: listItem.where((item) => item.status=='done').toList()),
                ],
              ),
            );}
          ),
        )
      ],
    );
  }
}
