import 'package:boilerplate/constants/colors.dart';
import 'package:boilerplate/stores/route/route_store.dart';
import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';

class BottomNavigation extends StatefulWidget {
  final int pageIndex;
  final ValueChanged<int> bottomTapped;

  BottomNavigation({required this.pageIndex, required this.bottomTapped});

  @override
  _BottomNavigationState createState() => _BottomNavigationState();
}

class _BottomNavigationState extends State<BottomNavigation> {
  List<BottomNavigationBarItem> bottomItem() {
    return [
      BottomNavigationBarItem(
        icon: Icon(Icons.home),
        activeIcon: Container(
            decoration: BoxDecoration(boxShadow: [
              BoxShadow(
                color: Color.fromRGBO(250, 56, 0, 0.4),
                spreadRadius: 0,
                blurRadius: 20,
                offset: Offset(0, 6),
              ),
            ]),
            child: Icon(
              Icons.home,
            )),
        label: '',
      ),
      BottomNavigationBarItem(
        icon: Icon(Icons.fastfood),
        activeIcon: Container(
            decoration: BoxDecoration(boxShadow: [
              BoxShadow(
                color: Color.fromRGBO(250, 56, 0, 0.4),
                spreadRadius: 0,
                blurRadius: 20,
                offset: Offset(0, 6),
              ),
            ]),
            child: Icon(
              Icons.fastfood,
            )),
        label: '',
      ),
      BottomNavigationBarItem(
        icon: Icon(Icons.delivery_dining),
        activeIcon: Container(
            decoration: BoxDecoration(boxShadow: [
              BoxShadow(
                color: Color.fromRGBO(250, 56, 0, 0.4),
                spreadRadius: 0,
                blurRadius: 20,
                offset: Offset(0, 6),
              ),
            ]),
            child: Icon(
              Icons.delivery_dining,
            )),
        label: '',
      ),
      BottomNavigationBarItem(
        icon: Icon(Icons.person),
        activeIcon: Container(
            decoration: BoxDecoration(
              boxShadow: [
                BoxShadow(
                  color: Color.fromRGBO(250, 56, 0, 0.4),
                  spreadRadius: 0,
                  blurRadius: 20,
                  offset: Offset(0, 6),
                ),
              ],
            ),
            child: Icon(
              Icons.person,
            )),
        label: '',
      )
    ];
  }

  @override
  Widget build(BuildContext context) {
    return BottomNavigationBar(
      items: bottomItem(),
      currentIndex: widget.pageIndex,
      onTap: (index) => widget.bottomTapped(index),
      selectedItemColor: AppColors.appColor['orangeMain']?? Colors.deepOrange,
      type: BottomNavigationBarType.fixed,
      backgroundColor: AppColors.appColor['appBackground'],
      elevation: 0.0,
      showUnselectedLabels: false,
      showSelectedLabels: false,
    );
  }
}
