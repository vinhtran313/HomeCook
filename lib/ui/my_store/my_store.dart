import 'package:boilerplate/stores/food/my_food_store.dart';
import 'package:boilerplate/widgets/store_item.dart';
import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:provider/provider.dart';

class MyStore extends StatefulWidget {
  @override
  _MyStoreState createState() => _MyStoreState();
}

class _MyStoreState extends State<MyStore> {
  late MyFoodStore _myFoodStore;

  void didChangeDependencies() {
    // TODO: implement didChangeDependencies
    super.didChangeDependencies();
    _myFoodStore = Provider.of<MyFoodStore>(context);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('My Store'),
        backgroundColor: Colors.transparent,
        elevation: 0.0,
        centerTitle: true,
      ),
      body: Observer(builder: (_) {

        return ListView.builder(
          itemBuilder: (context, index) {
            return StoreItem(food: _myFoodStore.listFood[index]
            );
          },
          itemCount: _myFoodStore.listFood.length,
        );
      }),
    );
  }
}
