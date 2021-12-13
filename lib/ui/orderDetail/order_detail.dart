import 'package:boilerplate/models/recipe/Recipe.dart';
import 'package:boilerplate/widgets/order_detail_carousel.dart';
import 'package:boilerplate/widgets/search_bar_widget.dart';
import 'package:flutter/material.dart';
import 'package:boilerplate/widgets/custom_button.dart';

class OrderDetail extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final args =
        ModalRoute.of(context)!.settings.arguments as Map<String, Recipe>;
    final Recipe? _recipe = args['recipe'];
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

    Widget button(String title, void Function() onPress) {
      return Container(
        width: 150,
        child: CustomButton(
          title: title,
          onPress: onPress,
        ),
      );
    }

    void onPressSell() {
      Navigator.pushNamed(context, '/createFood', arguments: {
        'recipe': _recipe
      });
    }

    void onPressBuy() {
      Navigator.pushNamed(context, '/sellers',arguments: {
        'foodName': _recipe?.name
      });
    }

    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        elevation: 0.0,
      ),
      body: Padding(
        padding: const EdgeInsets.all(20.0),
        child: Column(
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
            foodInfo(),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                button('Sell', onPressSell),
                button('Buy', onPressBuy),
              ],
            )
          ],
        ),
      ),
    );
  }
}
