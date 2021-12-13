import 'package:boilerplate/di/components/service_locator.dart';
import 'package:boilerplate/stores/recipe/list_recipe_store.dart';
import 'package:boilerplate/widgets/food_list_item_widget.dart';
import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:provider/provider.dart';

class RenderTabview extends StatefulWidget {
  const RenderTabview({Key? key}) : super(key: key);

  @override
  _RenderTabviewState createState() => _RenderTabviewState();
}

class _RenderTabviewState extends State<RenderTabview>
    with AutomaticKeepAliveClientMixin {
  late RecipeListStore _recipeStore;

  @override
  void didChangeDependencies() {
    // TODO: implement didChangeDependencies
    super.didChangeDependencies();
    _recipeStore = Provider.of<RecipeListStore>(context);
  }

  @override
  Widget build(BuildContext context) {
    super.build(context);
    return Scaffold(
      backgroundColor: Colors.transparent,
      body: Observer(
        builder: (_) {
          print(_recipeStore.listItem);
          return ListView.builder(
              scrollDirection: Axis.horizontal,
              itemCount: _recipeStore.listItem.length,
              itemBuilder: (context, index) {
                return FoodListItem(recipe: _recipeStore.listItem[index]);
              });
        },
      ),
    );
  }

  @override
  // TODO: implement wantKeepAlive
  bool get wantKeepAlive => true;
}
