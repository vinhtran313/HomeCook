class Recipe {
  String? id;
  String? name;
  String? description;
  List<String>? ingredients;
  List<RecipeStep>? steps;
  List<String>? images;
  int? upVote;
  int? downVote;
  String? thumbnail;

  Recipe({
    this.id,
    this.name,
    this.description,
    this.ingredients,
    this.steps,
    this.images,
    this.upVote,
    this.downVote,
    this.thumbnail,
  });

  Recipe.fromMap(Map<String, dynamic> json) {
    id = json["id"];
    name = json["name"];
    description = json["description"];
    ingredients = List<String>.from(json["ingredients"].map((x) => x));
    steps = parseStep(json);
    images = List<String>.from(json["images"].map((x) => x));
    upVote = json["upVote"];
    downVote = json["downVote"];
    thumbnail = json["thumbnail"];
  }

  List<RecipeStep>? parseStep(json) {
    var list = json["steps"] as List;
    List<RecipeStep> listStep = list.map((data) => RecipeStep.fromMap(data)).toList();
    return listStep;
  }
}

class RecipeStep {
  String? stepDescription;
  String? stepImgUrl;

  RecipeStep({
    this.stepDescription,
    this.stepImgUrl,
  });

  factory RecipeStep.fromMap(Map<String, dynamic> json) => RecipeStep(
        stepDescription: json['stepDescription'],
        stepImgUrl: json['stepImgUrl'],
      );
}

List<Recipe> recipes = [
  Recipe(
    id: '1',
    name: 'Bánh bao',
    description: 'Bánh bao nhân thịt',
    ingredients: ['Bột mì', 'Nước'],
    steps: [
      RecipeStep(stepDescription: 'Bước 1: Trộn', stepImgUrl: 'http:///'),
    ],
    images: ['hiihihi', 'ádasdqwe'],
  )
];
