import 'package:badges/badges.dart';
import 'package:boilerplate/constants/colors.dart';
import 'package:boilerplate/stores/cart/cart_store.dart';
import 'package:boilerplate/ui/order/order.dart';
import 'package:boilerplate/ui/profile/profile.dart';
import 'package:boilerplate/widgets/bottom_navigation_bar_widget.dart';
import 'package:boilerplate/widgets/drawer_item.dart';
import 'package:flutter/material.dart';
import 'package:boilerplate/ui/home/home.dart';
import 'package:boilerplate/ui/recipes/recipes.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:provider/provider.dart';

class RenderScreen extends StatefulWidget {
  @override
  _RenderScreenState createState() => _RenderScreenState();
}

class _RenderScreenState extends State<RenderScreen> {
  //stores
  int pageIndex = 0;
  final PageStorageBucket bucket = PageStorageBucket();
  List<Widget> pages = <Widget>[
    HomeScreen(key: PageStorageKey('HomePage')),
    RecipesScreen(key: PageStorageKey('RecipesPage')),
    OrderScreen(key: PageStorageKey('OrderPage')),
    ProfileScreen(key: PageStorageKey('ProfileScreen')),
  ];

  late CartStore _cartStore;

  @override
  void initState() {
    super.initState();
  }

  @override
  void didChangeDependencies() {
    // TODO: implement didChangeDependencies
    super.didChangeDependencies();
    _cartStore = Provider.of<CartStore>(context);
  }

  //Render body pageview
  Widget _buildPageView() {
    return PageStorage(
      child: pages[pageIndex],
      bucket: bucket,
    );
  }

  Widget _buildDrawer() {
    return DrawerWidget();
  }

  //Change tab when click bottom item
  void bottomTapped(int index) {
    setState(() {
      pageIndex = index;
    });
  }

  Widget? appBarTitle() {
    switch (pageIndex) {
      case 2:
        return Text(
          'Orders',
          style: TextStyle(fontWeight: FontWeight.bold),
        );
      case 3:
        return Text(
          'Profile',
          style: TextStyle(fontWeight: FontWeight.bold),
        );
      default:
        return null;
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.deepOrange,
      body: _buildPageView(),
      appBar: pageIndex != 2
          ? AppBar(
              elevation: 0,
              backgroundColor: AppColors.appColor['appBackground'],
              title: appBarTitle(),
              centerTitle: true,
              actions: <Widget>[
                GestureDetector(
                  onTap: () {
                    Navigator.pushNamed(context, '/myStore');
                  },
                  child: Padding(
                    padding: const EdgeInsets.only(right: 16.0, top: 10),
                    child: Icon(
                      Icons.store_mall_directory_outlined,
                      color: Colors.deepOrange,
                    ),
                  ),
                ),
                GestureDetector(
                  onTap: () {
                    Navigator.pushNamed(context, '/cart');
                  },
                  child: Padding(
                    padding: const EdgeInsets.only(right: 16, top: 10),
                    child: Observer(
                      builder: (_) => Badge(
                        badgeContent: Text(
                          '${_cartStore.badgeCount}',
                          style: TextStyle(
                            color: Colors.white,
                          ),
                        ),
                        child: Icon(
                          Icons.shopping_cart_outlined,
                          color: AppColors.appColor['greyMain'],
                        ),
                        badgeColor: Colors.deepOrange,
                      ),
                    ),
                  ),
                ),
              ],
            )
          : null,
      drawer: pageIndex != 2 ? _buildDrawer() : null,
      bottomNavigationBar: new BottomNavigation(
        pageIndex: pageIndex,
        bottomTapped: (value) => bottomTapped(value),
      ),
    );
  }
}
