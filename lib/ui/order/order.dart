import 'package:boilerplate/constants/colors.dart';
import 'package:boilerplate/ui/order/buying_tab.dart';
import 'package:boilerplate/ui/order/selling_tab.dart';
import 'package:boilerplate/widgets/drawer_item.dart';
import 'package:flutter/material.dart';

class OrderScreen extends StatefulWidget {
  const OrderScreen({Key? key}) : super(key: key);

  @override
  _OrderScreenState createState() => _OrderScreenState();
}

class _OrderScreenState extends State<OrderScreen> with SingleTickerProviderStateMixin {
  late TabController _tabController;
  static const List<Tab> listTabs = <Tab>[
    Tab(text: 'Selling'),
    Tab(text: 'Buying')
  ];
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    _tabController = new TabController(length: listTabs.length, vsync: this);
  }

  @override
  void dispose() {
    _tabController.dispose();
    super.dispose();
  }

  Widget sellingTab(){
    return Container();
  }
  Widget buyingTab(){
    return Container();
  }

  Widget _buildDrawer() {
    return DrawerWidget();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.appColor['appBackground'],
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        elevation: 0.0,
        title: Text(
          'Order',
          style: TextStyle(fontWeight: FontWeight.bold, fontSize: 18),
        ),
        centerTitle: true,
        bottom: TabBar(
          controller: _tabController,
          indicatorColor: Colors.deepOrange,
          indicator: UnderlineTabIndicator(
              borderSide: BorderSide(width: 2.0,color: Colors.deepOrange),
              insets: EdgeInsets.symmetric(horizontal:16.0)
          ),
          labelColor: Colors.deepOrange,
          unselectedLabelColor: Colors.black54,
          tabs: listTabs.toList(),
        ),
      ),
      body: TabBarView(
        controller: _tabController,
        children: [
          SellingTab(),
          BuyingTab()
        ],
      ),
      drawer: _buildDrawer(),
    );
  }
}
