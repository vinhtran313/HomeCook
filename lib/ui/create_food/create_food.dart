import 'dart:math';

import 'package:boilerplate/constants/colors.dart';
import 'package:boilerplate/models/food/Food.dart';
import 'package:boilerplate/models/recipe/Recipe.dart';
import 'package:boilerplate/stores/food/food_store.dart';
import 'package:boilerplate/stores/food/my_food_store.dart';
import 'package:boilerplate/stores/recipe/list_recipe_store.dart';
import 'package:boilerplate/widgets/custom_button.dart';
import 'package:boilerplate/widgets/order_detail_carousel.dart';
import 'package:boilerplate/widgets/textfield_widget.dart';
import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:provider/provider.dart';

class CreateFood extends StatefulWidget {
  const CreateFood({Key? key}) : super(key: key);

  @override
  _CreateFoodState createState() => _CreateFoodState();
}

class _CreateFoodState extends State<CreateFood> {
  bool _showButton = false;
  late RecipeListStore _recipeStore;
  String price = '';
  late FoodStore _foodStore;
  late MyFoodStore _myFoodStore;
  TextEditingController priceCtrl = new TextEditingController();

  @override
  void didChangeDependencies() {
    // TODO: implement didChangeDependencies
    super.didChangeDependencies();
    _recipeStore = Provider.of<RecipeListStore>(context);
    _foodStore = Provider.of<FoodStore>(context);
    _myFoodStore = Provider.of<MyFoodStore>(context);
  }

  Widget infoSection(String title, String description) {
    return Padding(
      padding: const EdgeInsets.only(top: 20),
      child: Container(
        width: double.infinity,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              title,
              style: TextStyle(
                fontSize: 20,
                fontWeight: FontWeight.w700,
              ),
            ),
            Container(
              margin: EdgeInsets.only(top: 5),
              child: Text(
                description,
                style: TextStyle(
                  fontSize: 17,
                  color: Colors.grey,
                ),
              ),
            )
          ],
        ),
      ),
    );
  }

  Widget button(String title, void Function() onPress, Color color) {
    return Container(
      width: 150,
      child: CustomButton(
        title: title,
        onPress: onPress,
        buttonColor: color,
      ),
    );
  }

  void onPressCancel() {
    Navigator.pop(context);
  }

  void onPressSubmit(Recipe recipe) {
    var random = Random();
    Food food = new Food(
        id: '${recipe.name}${random.nextInt(1000)}',
        price: '$price',
        thumbnail: '${recipe.thumbnail}',
        name: '${recipe.name}',
        description: '${recipe.description}',
        creatorName: 'alex');
    _foodStore.addToList(food);
    _myFoodStore.addToList(food);
    Navigator.pushNamed(context, '/myStore');
  }

  @override
  void initState() {
    super.initState();
  }

  @override
  void dispose() {
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final args =
        ModalRoute.of(context)!.settings.arguments as Map<String, Recipe?>;
    final Recipe? _recipe = args['recipe'];

    bool _keyboardVisible = MediaQuery.of(context).viewInsets.bottom != 0;
    setState(() {
      _showButton = !_keyboardVisible;
    });

    Widget descriptionSection({required String description}) {
      return Padding(
        padding: const EdgeInsets.only(top: 30),
        child: Container(
          width: double.infinity,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                'Description',
                style: TextStyle(
                  fontSize: 20,
                  fontWeight: FontWeight.w700,
                ),
              ),
              Container(
                margin: EdgeInsets.only(top: 5),
                child: Text(
                  description,
                  style: TextStyle(
                    fontSize: 17,
                    color: Colors.grey,
                  ),
                ),
              )
            ],
          ),
        ),
      );
    }

    Widget ingredientSection(
        {required List<String>? ingredients, required BuildContext context}) {
      return Padding(
        padding: const EdgeInsets.only(top: 30),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              'Ingredients',
              style: TextStyle(
                fontSize: 20,
                fontWeight: FontWeight.bold,
              ),
            ),
            Container(
              margin: EdgeInsets.only(top: 5),
              child: ListView.builder(
                scrollDirection: Axis.vertical,
                physics: NeverScrollableScrollPhysics(),
                shrinkWrap: true,
                itemBuilder: (context, index) {
                  return Padding(
                    padding: const EdgeInsets.only(top: 8.0),
                    child: Text(
                      '$index. ${ingredients![index]}',
                      style: TextStyle(
                        fontSize: 17,
                        color: Colors.grey,
                      ),
                    ),
                  );
                },
                itemCount: _recipe!.ingredients!.length,
              ),
            ),
          ],
        ),
      );
    }

    Widget stepSection(
        {required List<RecipeStep>? steps, required BuildContext context}) {
      return Padding(
        padding: const EdgeInsets.only(top: 30),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              'How to cook',
              style: TextStyle(
                fontSize: 20,
                fontWeight: FontWeight.bold,
              ),
            ),
            Container(
              margin: EdgeInsets.only(top: 5),
              child: ListView.builder(
                scrollDirection: Axis.vertical,
                physics: NeverScrollableScrollPhysics(),
                shrinkWrap: true,
                itemBuilder: (context, index) {
                  return Padding(
                    padding: const EdgeInsets.only(top: 8.0),
                    child: Text(
                      'Step $index. ${steps![index].stepDescription}',
                      style: TextStyle(
                        fontSize: 17,
                        color: Colors.grey,
                      ),
                    ),
                  );
                },
                itemCount: _recipe!.steps!.length,
              ),
            ),
          ],
        ),
      );
    }

    Widget priceAdd() {
      return TextFieldWidget(
        textController: priceCtrl,
        icon: Icons.edit,
        hint: 'Price',
        onFieldSubmitted: (value) {
          setState(() {
            price = value;
            priceCtrl.text = value;
          });
        },
      );
    }

    Widget foodInfo() {
      return Expanded(
        child: SingleChildScrollView(
          child: Column(
            children: [
              descriptionSection(description: _recipe!.description.toString()),
              ingredientSection(
                  ingredients: _recipe.ingredients, context: context),
              stepSection(steps: _recipe.steps, context: context),
            ],
          ),
        ),
      );
    }

    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        elevation: 0.0,
        title: Text('Create Food'),
        centerTitle: true,
      ),
      body: Padding(
        padding: const EdgeInsets.all(25),
        child: Observer(builder: (_) {
          return Column(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              CarouselOrderDetail(
                imgList: _recipe!.images!.toList(),
              ),
              Text(
                _recipe.name.toString(),
                textAlign: TextAlign.center,
                style: TextStyle(
                  fontSize: 25,
                  fontWeight: FontWeight.w700,
                ),
              ),
              priceAdd(),
              foodInfo(),
              Visibility(
                visible: _showButton,
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    button('Cancel', onPressCancel, Colors.black12),
                    button('Submit', () {
                      onPressSubmit(_recipe);
                    }, Colors.deepOrange),
                  ],
                ),
              )
            ],
          );
        }),
      ),
    );

    // return Scaffold(
    //   appBar: AppBar(
    //     backgroundColor: Colors.transparent,
    //     elevation: 0.0,
    //   ),
    //   body: Padding(
    //     padding: const EdgeInsets.all(20.0),
    //     child: Column(
    //       mainAxisAlignment: MainAxisAlignment.spaceBetween,
    //       children: [
    //         CarouselOrderDetail(),
    //         Column(
    //           mainAxisSize: MainAxisSize.max,
    //           children: [
    //             Text(
    //               'Gà Sả Chanh',
    //               style: TextStyle(
    //                 fontSize: 25,
    //                 fontWeight: FontWeight.w700,
    //               ),
    //             ),
    //             // Container(
    //             //   margin: EdgeInsets.only(top: 15),
    //             //   child: Text(
    //             //     'N1,900',
    //             //     style: TextStyle(
    //             //       fontSize: 18,
    //             //       fontWeight: FontWeight.w700,
    //             //       color: Colors.deepOrange,
    //             //     ),
    //             //   ),
    //             // )
    //           ],
    //         ),
    //         Card(
    //           child: Column(
    //             children: [
    //               Text('Delivery Info'),
    //               TextFormField(
    //                 controller: new TextEditingController(),
    //               ),
    //             ],
    //           ),
    //         ),
    //         Row(
    //           mainAxisAlignment: MainAxisAlignment.spaceBetween,
    //           children: [
    //             button('Sell', onPressSell),
    //             button('Buy', onPressBuy),
    //           ],
    //         )
    //       ],
    //     ),
    //   ),
    // );
  }
}
