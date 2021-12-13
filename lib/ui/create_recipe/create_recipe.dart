import 'package:boilerplate/di/components/service_locator.dart';
import 'package:boilerplate/models/recipe/Recipe.dart';
import 'package:boilerplate/stores/recipe/list_recipe_store.dart';
import 'package:boilerplate/widgets/create_recipe_carousel.dart';
import 'package:boilerplate/widgets/textfield_widget.dart';
import 'package:boilerplate/widgets/upload_images_widget.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:provider/provider.dart';

class CreateRecipe extends StatefulWidget {
  const CreateRecipe({Key? key}) : super(key: key);

  @override
  _CreateRecipeState createState() => _CreateRecipeState();
}

class _CreateRecipeState extends State<CreateRecipe> {
  List<String> _downloadUrls = [];
  bool _needScroll = false;
  bool _showImage = false;
  TextEditingController _nameCtrl = new TextEditingController();
  TextEditingController _descriptionCtrl = new TextEditingController();
  late final ScrollController _scrollCtrl;
  late RecipeListStore _recipeStore;

  @override
  void initState() {
    super.initState();
    _scrollCtrl = new ScrollController();
  }

  @override
  void didChangeDependencies() {
    // TODO: implement didChangeDependencies
    super.didChangeDependencies();
    _recipeStore = Provider.of<RecipeListStore>(context);
    _recipeStore.resetRecipe();
  }

  void removeImage(index) {
    setState(() {
      _downloadUrls.removeAt(index);
      _recipeStore.updateRecipeImages(_downloadUrls);
      if (_downloadUrls.isEmpty) {
        _showImage = false;
      }
    });
  }

  void updateImage(urls) {
    _recipeStore.updateRecipeImages(urls);
    setState(() {
      _downloadUrls = urls;
      _showImage = true;
    });
  }

  void addIngredient() {
    _recipeStore.addRecipeIngredients();
    setState(() {
      _needScroll = true;
    });
  }

  void addStep() {
    _recipeStore.addRecipeStep();
    setState(() {
      _needScroll = true;
    });
  }

  void _scroll(ScrollController ctrl) {
    Future.delayed(Duration(milliseconds: 300), () {
      ctrl.animateTo(ctrl.position.maxScrollExtent,
          duration: Duration(milliseconds: 1000), curve: Curves.fastOutSlowIn);
    });
    setState(() {
      _needScroll = false;
    });
  }

  Widget ingredientWidget(BuildContext context, int index) {
    TextEditingController ctrl = new TextEditingController();
    return Observer(
      builder: (_) {
        ctrl.text = _recipeStore.recipe.ingredients![index] != ''
            ? _recipeStore.recipe.ingredients![index]
            : '';
        return Padding(
          padding: const EdgeInsets.fromLTRB(0, 0, 0, 0),
          child: TextFieldWidget(
            textController: ctrl,
            inputBorder: InputBorder.none,
            icon: Icons.list,
            onFieldSubmitted: (value) {
              _recipeStore.updateRecipeIngredients(value, index);
              print(_recipeStore.recipe.ingredients);
            },
          ),
        );
      },
    );
  }

  Widget stepWidget(BuildContext context, int index) {
    TextEditingController ctrl = new TextEditingController();
    return Observer(builder: (_) {
      ctrl.text = _recipeStore.recipe.steps![index].stepDescription!;
      return Padding(
        padding: const EdgeInsets.fromLTRB(0, 0, 0, 0),
        child: TextFieldWidget(
          textController: ctrl,
          inputBorder: InputBorder.none,
          hint: '100g ingredients one',
          icon: Icons.circle,
          onFieldSubmitted: (value) {
            RecipeStep step = new RecipeStep(stepDescription: value);
            _recipeStore.updateRecipeSteps(step, index);
          },
        ),
      );
    });
  }

  @override
  Widget build(BuildContext context) {
    if (_needScroll) {
      _scroll(_scrollCtrl);
    }
    return Scaffold(
      appBar: AppBar(
        title: Text('Create Recipe'),
        centerTitle: true,
        backgroundColor: Colors.transparent,
        elevation: 0.0,
        actions: [
          IconButton(
              onPressed: () {
                _recipeStore.updateRecipeThumbnail(_recipeStore.recipe.images![0]);
                _recipeStore.updateRecipeId(_recipeStore.recipe.name.toString());
                _recipeStore.addToList();
                print(_recipeStore.listItem);
                Navigator.pushNamed(context, '/render');
              },
              icon: Icon(
                Icons.done_outlined,
                color: Colors.deepOrange,
              ))
        ],
      ),
      body: FutureBuilder(
        future: Firebase.initializeApp(),
        builder: (context, snapshot) {
          if (snapshot.hasError) {
            return Container(
              child: Center(
                child: Text('Something went wrong'),
              ),
            );
          }

          if (snapshot.connectionState == ConnectionState.done) {
            return ListView(
              controller: _scrollCtrl,
              children: [
                Visibility(
                  visible: !_showImage,
                  child: UploadImage(
                    callback: (urls) => updateImage(urls),
                  ),
                ),
                Visibility(
                    visible: _showImage,
                    child: RecipeCarousel(
                      urls: _downloadUrls,
                      removeItem: (index) => removeImage(index),
                    )),
                Center(child: LayoutBuilder(builder: (context, constraints) {
                  return Container(
                    width: constraints.biggest.width * 0.5,
                    child: Observer(
                      builder: (_) {
                        _nameCtrl.text = (_recipeStore.recipe.name != null
                            ? _recipeStore.recipe.name
                            : '')!;
                        return TextFieldWidget(
                          icon: Icons.edit,
                          hint: 'Recipe Name',
                          textController: _nameCtrl,
                          onFieldSubmitted: (value) {
                            _recipeStore.updateRecipeName(value);
                          },
                        );
                      },
                    ),
                  );
                })),
                Padding(
                  padding: const EdgeInsets.fromLTRB(25, 25, 25, 25),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Padding(
                        padding: const EdgeInsets.only(left: 5),
                        child: Text(
                          'Recipe Description',
                          style: TextStyle(
                            fontWeight: FontWeight.bold,
                            fontSize: 16,
                          ),
                        ),
                      ),
                      Card(
                        child: Padding(
                          padding: EdgeInsets.fromLTRB(10, 5, 10, 5),
                          child: Observer(
                            builder: (_) {
                              _descriptionCtrl.text =
                                  (_recipeStore.recipe.description != null
                                      ? _recipeStore.recipe.description
                                      : '')!;
                              return TextFieldWidget(
                                icon: Icons.edit,
                                textController: new TextEditingController(),
                                hint: 'Description',
                                inputBorder: InputBorder.none,
                                onFieldSubmitted: (value) {
                                  _recipeStore.updateRecipeDescription(value);
                                },
                              );
                            },
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.fromLTRB(25, 0, 25, 25),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Padding(
                        padding: const EdgeInsets.only(left: 5.0),
                        child: Text(
                          'Ingredients',
                          style: TextStyle(fontWeight: FontWeight.bold),
                        ),
                      ),
                      Card(
                        child: Observer(
                          builder: (_) => Padding(
                            padding: const EdgeInsets.fromLTRB(10, 0, 10, 0),
                            child: ListView.builder(
                              physics: ScrollPhysics(),
                              scrollDirection: Axis.vertical,
                              shrinkWrap: true,
                              itemCount: _recipeStore.recipe.ingredients != null
                                  ? _recipeStore.recipe.ingredients!.length
                                  : 0,
                              itemBuilder: (context, index) {
                                return ingredientWidget(context, index);
                              },
                            ),
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
                Center(
                  child: InkWell(
                    onTap: () {
                      addIngredient();
                    },
                    child: Container(
                      padding: EdgeInsets.fromLTRB(5, 2, 5, 2),
                      decoration: BoxDecoration(
                        border: Border.all(color: Colors.black12),
                        borderRadius: BorderRadius.circular(8.0),
                      ),
                      child: SizedBox(
                        width: 120,
                        child: Row(
                          children: [Text('Add ingredient'), Icon(Icons.add)],
                        ),
                      ),
                    ),
                  ),
                ),
                SizedBox(
                  height: 25,
                ),
                Padding(
                  padding: const EdgeInsets.fromLTRB(25, 0, 25, 25),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Padding(
                        padding: const EdgeInsets.only(left: 5.0),
                        child: Text(
                          'Steps',
                          style: TextStyle(fontWeight: FontWeight.bold),
                        ),
                      ),
                      Card(
                        child: Padding(
                          padding: const EdgeInsets.fromLTRB(10, 0, 10, 0),
                          child: ListView.builder(
                            physics: ScrollPhysics(),
                            scrollDirection: Axis.vertical,
                            shrinkWrap: true,
                            itemCount: _recipeStore.recipe.steps!.length,
                            itemBuilder: (context, index) {
                              return stepWidget(context, index);
                            },
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
                Center(
                  child: InkWell(
                    onTap: () {
                      addStep();
                    },
                    child: Container(
                      padding: EdgeInsets.fromLTRB(5, 2, 5, 2),
                      decoration: BoxDecoration(
                        border: Border.all(color: Colors.black12),
                        borderRadius: BorderRadius.circular(8.0),
                      ),
                      child: SizedBox(
                        width: 120,
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [Text('Add step'), Icon(Icons.add)],
                        ),
                      ),
                    ),
                  ),
                ),
                SizedBox(
                  height: 25,
                ),
              ],
            );
          }
          return Container(
            child: Center(),
          );
        },
      ),
    );
  }
}
