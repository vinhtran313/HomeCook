import 'package:boilerplate/constants/colors.dart';
import 'package:boilerplate/stores/recipe/list_recipe_store.dart';
import 'package:boilerplate/widgets/render_tabview.dart';
import 'package:boilerplate/widgets/search_bar_widget.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  //stores:---------------------------------------------------------------------
  final TextEditingController controller = TextEditingController();
  late RecipeListStore _recipeStore;

  final TextStyle tabTextStyle = TextStyle(fontSize: 16);
  late List<Text> categories = [
    Text(
      'Foods',
      style: tabTextStyle,
    ),
    Text(
      'Drinks',
      style: tabTextStyle,
    ),
    Text(
      'Snacks',
      style: tabTextStyle,
    ),
    Text(
      'Salads',
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

  Widget _pageTitle() {
    return Padding(
      padding: EdgeInsets.fromLTRB(18, 0, 25, 40),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            'Delicious',
            style: TextStyle(
              fontSize: 34,
              fontWeight: FontWeight.bold,
            ),
          ),
          Text(
            'food for you',
            style: TextStyle(
              fontSize: 34,
              fontWeight: FontWeight.bold,
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildTabBar() {
    return TabBar(
      labelColor: AppColors.appColor['orangeMain'] ?? Colors.deepOrange,
      unselectedLabelColor: Colors.grey,
      labelPadding: EdgeInsets.symmetric(
        horizontal: 0,
        vertical: 25,
      ),
      indicatorSize: TabBarIndicatorSize.label,
      indicatorWeight: 2,
      indicatorColor: AppColors.appColor['orangeMain'] ?? Colors.deepOrange,
      tabs: categories.sublist(0, 3),
    );
  }

  Widget _buildTabView(screenWidth, screenHeight) {
    return Container(
      constraints: new BoxConstraints(
        maxHeight: screenHeight * 0.4,
      ),
      child: TabBarView(
        children: [
          RenderTabview(),
          RenderTabview(),
          RenderTabview(),
        ],
      ),
    );
  }

  Widget _buildMainContent(screenWidth, screenHeight) {
    return DefaultTabController(
      length: categories.sublist(0, 3).length,
      child: Scaffold(
        backgroundColor: AppColors.appColor['appBackground'],
        body: SafeArea(
          child: Container(
            child: SingleChildScrollView(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  _pageTitle(),
                  Padding(
                      padding: EdgeInsets.fromLTRB(18, 0, 18, 25),
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
