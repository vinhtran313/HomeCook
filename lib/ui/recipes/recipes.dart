import 'package:boilerplate/constants/colors.dart';
import 'package:boilerplate/di/components/service_locator.dart';
import 'package:boilerplate/stores/recipe/list_recipe_store.dart';
import 'package:boilerplate/widgets/food_list_item_widget.dart';
import 'package:boilerplate/widgets/search_bar_widget.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:provider/provider.dart';

class RecipesScreen extends StatefulWidget {
  const RecipesScreen({Key? key}) : super(key: key);

  @override
  _RecipesScreenState createState() => _RecipesScreenState();
}

class _RecipesScreenState extends State<RecipesScreen> {
  //stores:---------------------------------------------------------------------
  late RecipeListStore _recipeStore;
  final TextEditingController controller = TextEditingController();

  final TextStyle tabTextStyle = TextStyle(fontSize: 16);
  late List<Text> categories = [
    Text(
      'All',
      style: tabTextStyle,
    ),
    Text(
      'My Recipes',
      style: tabTextStyle,
    ),
  ];

  @override
  void initState() {
    super.initState();
    setState(() {});
  }

  @override
  void didChangeDependencies() {
    // TODO: implement didChangeDependencies
    super.didChangeDependencies();
    _recipeStore = Provider.of<RecipeListStore>(context);
  }

  @override
  Widget build(BuildContext context) {
    final double screenWidth = MediaQuery.of(context).size.width;
    final double screenHeight = MediaQuery.of(context).size.height;
    return Container(
      child: _buildBody(screenWidth, screenHeight),
    );
  }

  // body methods:--------------------------------------------------------------
  Widget _buildBody(screenWidth, screenHeight) {
    return Stack(
      children: <Widget>[
        _buildMainContent(screenWidth, screenHeight),
      ],
    );
  }

  Widget _buildAppbar() {
    return Padding(
      padding: EdgeInsets.fromLTRB(18, 0, 8, 25),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Text(
            'Recipes',
            style: TextStyle(
              fontSize: 34,
              fontWeight: FontWeight.bold,
            ),
          ),
          GestureDetector(
            onTap: () {
              Navigator.pushNamed(context, '/createRecipe');
            },
            child: Row(
              children: [
                Text('Create Recipe',
                    style: TextStyle(
                      fontSize: 16,
                      fontWeight: FontWeight.bold,
                    )),
                Icon(Icons.add_circle_outline, color: Colors.deepOrange),
              ],
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildTabBar() {
    return TabBar(
      labelColor: AppColors.appColor['orangeMain']!,
      unselectedLabelColor: Colors.grey,
      labelPadding: EdgeInsets.symmetric(
        horizontal: 0,
        vertical: 25,
      ),
      indicatorSize: TabBarIndicatorSize.label,
      indicatorWeight: 2,
      indicatorColor: AppColors.appColor['orangeMain']!,
      tabs: categories.sublist(0, 2),
    );
  }

  Widget _buildTabView(screenWidth, screenHeight) {
    return ConstrainedBox(
      constraints: new BoxConstraints(maxHeight: screenHeight * 0.4),
      child: TabBarView(
        children: [
          Container(
            color: Colors.transparent,
            child: ListView.builder(
              scrollDirection: Axis.horizontal,
              itemCount: _recipeStore.listItem.length,
              itemBuilder: (context, index) {
                return FoodListItem(
                  recipe: _recipeStore.listItem[index],
                );
              },
              reverse: true,
            ),
            // child: FoodListItem(),
          ),
          Container(
            color: Colors.transparent,
            child: ListView.builder(
              scrollDirection: Axis.horizontal,
              itemCount: _recipeStore.personalList.length,
              itemBuilder: (context, index) {
                return FoodListItem(
                  recipe: _recipeStore.personalList[index],
                );
              },
              reverse: true,
            ),

            // child: FoodListItem(),
          ),
        ],
      ),
    );
  }

  Widget _buildMainContent(screenWidth, screenHeight) {
    return DefaultTabController(
      length: categories.sublist(0, 2).length,
      child: Scaffold(
        backgroundColor: AppColors.appColor['appBackground'],
        body: SafeArea(
          child: Container(
            child: SingleChildScrollView(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  _buildAppbar(),
                  Padding(
                      padding: EdgeInsets.fromLTRB(18, 0, 18, 0),
                      child: SearchBar(controller: controller)),
                  _buildTabBar(),
                  SizedBox(
                    height: 25,
                  ),
                  _buildTabView(screenWidth, screenHeight),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
