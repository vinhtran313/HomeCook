import 'package:boilerplate/constants/colors.dart';
import 'package:boilerplate/di/components/service_locator.dart';
import 'package:boilerplate/stores/recipe/list_recipe_store.dart';
import 'package:boilerplate/widgets/food_list_item_widget.dart';
import 'package:boilerplate/widgets/search_bar_widget.dart';
import 'package:flutter/material.dart';

class SearchScreen extends StatefulWidget {
  const SearchScreen({Key? key}) : super(key: key);

  @override
  _SearchScreenState createState() => _SearchScreenState();
}

class _SearchScreenState extends State<SearchScreen> {
  final TextEditingController controller = TextEditingController();
  final _store = getIt<RecipeListStore>();
  Map data = {};

  @override
  void initState() {
    super.initState();
  }
  @override
  Widget build(BuildContext context) {
    data =  ModalRoute.of(context)!.settings.arguments as Map;
    controller.text = data['message'];
    return Scaffold(
      appBar: AppBar(
        title: SearchBar(
          controller: controller,
        ),
        backgroundColor: AppColors.appColor['appBackground'],
        elevation: 0.0,
        centerTitle: true,
      ),
      body: SafeArea(
        child: Container(
          color: Color.fromRGBO(242, 242, 242, 1),
          child: Stack(
            children: [
              GridView.builder(
                  gridDelegate: new SliverGridDelegateWithFixedCrossAxisCount(
                    crossAxisCount: 2,
                    childAspectRatio: 16 / 21,
                  ),
                  itemCount: _store.listItem.length,
                  itemBuilder: (context, index) {
                    return Row(
                      mainAxisAlignment: index % 2 != 0
                          ? MainAxisAlignment.end
                          : MainAxisAlignment.start,
                      children: [
                        Container(
                          child: FoodListItem(recipe: _store.listItem[index]),
                        ),
                      ],
                    );
                  })
            ],
          ),
        ),
      ),
    );
  }
}
