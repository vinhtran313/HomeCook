import 'package:boilerplate/models/order/Order.dart';
import 'package:boilerplate/stores/order/order_store.dart';
import 'package:boilerplate/ui/order/order_tabview.dart';
import 'package:boilerplate/widgets/order_item.dart';
import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:provider/provider.dart';

class BuyingTab extends StatefulWidget {
  const BuyingTab({Key? key}) : super(key: key);

  @override
  _BuyingTabState createState() => _BuyingTabState();
}

class _BuyingTabState extends State<BuyingTab> with TickerProviderStateMixin {
  late OrderStore _orderStore;
  late TabController _tabController;

  static const List<Tab> listTabs = <Tab>[
    Tab(text: 'Pending'),
    Tab(text: 'Delivering'),
    Tab(text: 'Canceled'),
    Tab(text: 'Done')
  ];

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    _tabController = new TabController(length: listTabs.length, vsync: this);
  }

  @override
  void didChangeDependencies() {
    // TODO: implement didChangeDependencies
    super.didChangeDependencies();
    _orderStore = Provider.of<OrderStore>(context);
  }

  @override
  void dispose() {
    // TODO: implement dispose
    _tabController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    double screenHeight = MediaQuery.of(context).size.height;
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
                List<Order> listItem = _orderStore.listOrder.where((order) => order.sellerName !='alex').toList();
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
