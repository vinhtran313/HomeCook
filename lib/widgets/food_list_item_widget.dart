import 'package:boilerplate/models/recipe/Recipe.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class FoodListItem extends StatelessWidget {

  final Recipe recipe;

  const FoodListItem({Key? key, required this.recipe}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final route = ModalRoute.of(context)?.settings.name;
    final double screenWidth = MediaQuery.of(context).size.width;
    final containerWidth =
        route == '/render' ? screenWidth * 0.5 : screenWidth * 0.5;
    return LayoutBuilder(builder: (context, constraints) {
      return Container(
        width: containerWidth,
        child: GestureDetector(
          onTap: () {
            Navigator.pushNamed(context, '/orderDetail',arguments: {
              'recipe': recipe
            });
          },
          child: Stack(
            children: [
              Positioned.fill(
                child: Padding(
                  padding: EdgeInsets.only(
                    top: constraints.biggest.height * 0.3,
                  ),
                  child: Padding(
                    padding: EdgeInsets.fromLTRB(20, 0, 20, 10),
                    child: Container(
                        decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(30),
                            color: Colors.white,
                            boxShadow: [
                              BoxShadow(
                                color: Color.fromRGBO(141, 141, 141, 0.4),
                                spreadRadius: 0,
                                blurRadius: 5,
                                offset: Offset(0, 4),
                              ),
                            ]),
                        child: Padding(
                          padding: EdgeInsets.fromLTRB(10, 15, 10, 15),
                          child: Center(
                            child: Text(
                              recipe.name!.length > 40
                                  ? recipe.name!.substring(0, 40) + '...'
                                  : recipe.name.toString(),
                              textAlign: TextAlign.center,
                              style: TextStyle(
                                fontWeight: FontWeight.bold,
                                fontSize: route == '/render' ? 16 : 14,
                                color: Colors.black,
                              ),
                            ),
                          ),
                        )),
                  ),
                ),
              ),
              Positioned.fill(
                child: new LayoutBuilder(builder: (context, constraints) {
                  return Align(
                    alignment: Alignment.topCenter,
                    child: Container(
                      width: constraints.biggest.height * 0.45,
                      height: constraints.biggest.height * 0.45,
                      decoration: BoxDecoration(
                          shape: BoxShape.circle,
                          image: DecorationImage(
                            image: NetworkImage(recipe.thumbnail.toString()),
                            fit: BoxFit.cover,
                          ),
                          boxShadow: [
                            BoxShadow(
                              color: Color.fromRGBO(0, 0, 0, 0.15),
                              spreadRadius: 0,
                              blurRadius: 40,
                              offset: Offset(0, 40),
                            )
                          ]),
                    ),
                  );
                }),
              ),
            ],
          ),
        ),
      );
    });
  }
}
