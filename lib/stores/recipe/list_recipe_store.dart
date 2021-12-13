import 'package:boilerplate/models/recipe/Recipe.dart';
import 'package:mobx/mobx.dart';

part 'list_recipe_store.g.dart';

class RecipeListStore = _RecipeListStore with _$RecipeListStore;

abstract class _RecipeListStore with Store {
  @observable
  List<Recipe> listItem = <Recipe>[
    Recipe(
        id: 'recipe1',
        name: 'Grandmother\'s Old Fashioned Butter Roll',
        description:
            'If you like butter, you\'ll love these simple but delicious butter rolls. They\'re baked in a sweet milk sauce. Just the thing for a cold morning.',
        steps: [
          RecipeStep(
              stepDescription:
                  'Preheat oven to 350 degrees F (175 degrees C). Lightly grease a 7x11 inch baking pan.',
              stepImgUrl:
                  'https://imagesvc.meredithcorp.io/v3/mm/image?url=https%3A%2F%2Fimages.media-allrecipes.com%2Fuserphotos%2F9562.jpg&w=596&h=399&c=sc&poi=face&q=85'),
          RecipeStep(
              stepImgUrl:
                  'https://imagesvc.meredithcorp.io/v3/mm/image?url=https%3A%2F%2Fimages.media-allrecipes.com%2Fuserphotos%2F1110624.jpg&w=596&h=399&c=sc&poi=face&q=85',
              stepDescription:
                  'Bake in preheated oven until brown, about 30 to 40 minutes.')
        ],
        thumbnail:
            'https://imagesvc.meredithcorp.io/v3/mm/image?url=https%3A%2F%2Fimages.media-allrecipes.com%2Fuserphotos%2F1110624.jpg&w=596&h=399&c=sc&poi=face&q=85',
        images: [
          'https://imagesvc.meredithcorp.io/v3/mm/image?url=https%3A%2F%2Fimages.media-allrecipes.com%2Fuserphotos%2F1110624.jpg&w=596&h=399&c=sc&poi=face&q=85',
          'https://imagesvc.meredithcorp.io/v3/mm/image?url=https%3A%2F%2Fimages.media-allrecipes.com%2Fuserphotos%2F9562.jpg&w=596&h=399&c=sc&poi=face&q=85'
        ],
        ingredients: [
          '2 cups all-purpose flour',
          '½ teaspoon salt',
          '1 cup shortening',
          '½ cup water'
        ]),
    Recipe(
        id: 'recipe2',
        name: 'Vietnamese Banh mi',
        description:
            'Instead of stuffing this banh mi sandwich with meat, I fill it with zesty marinated tofu. Pickled veggies and cilantro leaves take it over the top.',
        steps: [
          RecipeStep(
              stepDescription:
                  'Make ahead: Place the daikon, carrots, cucumbers, and jalapeños in a medium jar with the white wine vinegar, rice vinegar, sugar, and salt. If the liquids don’t cover the veggies, add about 2 tablespoons water and more vinegar if necessary. Let chill for at least an hour, or store in the fridge for up to a week.',
              stepImgUrl:
                  'https://cdn.loveandlemons.com/wp-content/uploads/2015/01/IMG_2014_12_28_02411-580x555.jpg'),
          RecipeStep(
              stepImgUrl:
                  'https://cdn.loveandlemons.com/wp-content/uploads/2019/02/banh-mi-580x588.jpg',
              stepDescription:
                  'Heat a nonstick skillet to medium-high heat. Add a little oil to the pan and place the tofu pieces with enough space between each so that they’re not too crowded, working in batches if necessary. Without moving the tofu slices around too much, let them cook for a few minutes per side until they’re deeply golden brown and caramelized around the edges. Remove from heat and season to taste.')
        ],
        thumbnail:
            'https://cdn.loveandlemons.com/wp-content/uploads/2019/02/banh-mi-580x588.jpg',
        images: [
          'https://cdn.loveandlemons.com/wp-content/uploads/2019/02/banh-mi-580x588.jpg',
          'https://hips.hearstapps.com/hmg-prod.s3.amazonaws.com/images/20200205-bahn-mi-delish-ehg-9647-jpg-1582818279.jpg?crop=0.676xw:0.507xh;0.308xw,0.293xh&resize=1200:*',
          'https://cdnimg.vietnamplus.vn/uploaded/ngtmbh/2019_12_19/battongnucuoicuabanvoicachlamtrangrangbangcacnguyenlieudongiantrangrangbangnuocgao021537172872880width600height450.jpg'
        ],
        ingredients: [
          '1 (14-ounce) package extra firm tofu (see notes)',
          'extra-virgin olive oil, for the pan',
          '4 baguette pieces, sliced in half',
          'Good quality mayo, or vegan mayo',
          'A few sprigs of cilantro per sandwich',
          'Sriracha'
        ]),
    Recipe(
        id: 'recipe3',
        name: 'Beef Pho',
        description:
            'This delicious homemade pho recipe is inspired by the Vietnamese soup we all know and love, yet made with a few time-saving shortcuts.',
        steps: [
          RecipeStep(
              stepDescription:
                  ' In order to slice the beef, chicken or pork as thinly as possible, I recommend popping the meat in the freezer for at least 30-45 minutes to chill. Then use a sharp knife to thinly slice the meat before adding it to the soup',
              stepImgUrl:
                  'https://image-us.eva.vn/upload/2-2019/images/2019-06-28/cach-nau-pho-bo-thom-ngon-chuan-vi-don-gian-tai-nha-cach-nau-pho-bo-5-1561709484-618-width600height370.jpg'),
          RecipeStep(
              stepImgUrl:
                  'https://maythucphamtoanphat.vn/uploads/images/nau-pho-ngon-bang-noi-nau-pho.jpg',
              stepDescription:
                  'Make the broth. Meanwhile, as the meat is chilling, char the onion and ginger (either in a skillet or under the broiler). Meanwhile, briefly toast the spices in a large stockpot. Then add in the onion, ginger, and broth. Cover and let everything simmer together for at least 30 minutes so that all of those flavors can meld. Strain out and discard all of the onions, ginger and spices. Then stir in the remaining ingredients and season with salt.'),
          RecipeStep(
              stepDescription:
                  'Meanwhile, as your broth is simmering, go ahead and cook the noodles al dente according to the package instructions. Drain in a strainer, then toss briefly with cold water to prevent the noodles from continuing to cook, and set aside. (I also recommend tossing the noodles with a drizzle of oil — such as sesame oil — to prevent them from sticking.)',
              stepImgUrl:
                  'https://phohuynhtram.com/wp-content/uploads/2018/07/pho-bo-cho-be-600x400.jpg')
        ],
        thumbnail:
            'https://image-us.eva.vn/upload/2-2019/images/2019-06-28/cach-nau-pho-bo-thom-ngon-chuan-vi-don-gian-tai-nha-cach-nau-pho-bo-5-1561709484-618-width600height370.jpg',
        images: [
          'https://image-us.eva.vn/upload/2-2019/images/2019-06-28/cach-nau-pho-bo-thom-ngon-chuan-vi-don-gian-tai-nha-cach-nau-pho-bo-5-1561709484-618-width600height370.jpg',
          'https://phohuynhtram.com/wp-content/uploads/2018/07/pho-bo-cho-be-600x400.jpg',
          'https://maythucphamtoanphat.vn/uploads/images/nau-pho-ngon-bang-noi-nau-pho.jpg'
        ],
        ingredients: [
          '1 large white onion, peeled and halved',
          '3-inch piece of fresh ginger, halved lengthwise',
          '5 star anise',
          '4 whole cloves',
          '3 (3-inch) cinnamon sticks',
          '2 cardamom pods'
        ]),
    Recipe(
        id: 'recipe4',
        name: 'Banh Xeo – Crispy & Savory Vietnamese Crêpes / Pancakes',
        description:
            'It’s got that irresistible crispy, yet delicate, golden brown crust. And the inside of the bánh xèo is filled with delicious flavors: pork and shrimp, and sprinklings of mung bean, onions and bean sprouts.',
        steps: [
          RecipeStep(
              stepDescription:
                  'Combine all batter ingredients except scallions in a large bowl for at least 3 hours, or overnight. Add scallions only right before making the crêpes.',
              stepImgUrl:
                  'https://www.hungryhuy.com/wp-content/uploads/1-banh-xeo-step1-200x100@2x.jpg'),
          RecipeStep(
              stepImgUrl:
                  'https://www.hungryhuy.com/wp-content/uploads/1-banh-xeo-step2-200x100@2x.jpg',
              stepDescription:
                  'On medium-high heat add 1-2 teaspoons of oil and some onions')
        ],
        thumbnail:
            'https://www.hungryhuy.com/wp-content/uploads/make-banh-xeo-step-by-step-300x686@2x.jpg',
        images: [
          'https://www.hungryhuy.com/wp-content/uploads/1-banh-xeo2-300x450@2x.jpg',
          'https://www.hungryhuy.com/wp-content/uploads/3-banh-xeo2-300x200@2x.jpg',
          'https://www.hungryhuy.com/wp-content/uploads/2-banh-xeo-300x300@2x.jpg',
          'https://www.hungryhuy.com/wp-content/uploads/make-banh-xeo-step-by-step-300x686@2x.jpg',
        ],
        ingredients: [
          '255 g (1 3/4 c) rice flour',
          '85 g (0.7 c) all-purpose flour',
          '2-3 tsp turmeric',
          '▢28 fl oz (3.5 c) water',
          '14 fl oz (396.9 ml) coconut cream if unavailable, use coconut milk',
          '1 tsp salt',
          '▢1 sprig green onion chopped about 1/2" long'
        ]),
    Recipe(
      id: 'recipe5',
      name: 'Peanut Sticky Rice',
      description:
          'Sticky rice with peanuts? This rice dish is in a league of its own. The subtle sweet and salty flavors are simply delicious.',
      steps: [
        RecipeStep(
            stepDescription:
                'Transfer the raw shelled peanuts into a medium bowl filled with cold water. Swirl the peanuts gently in the water for 30 seconds. Remove any separated skin and discard. Drain well. Transfer the peanuts to a rice cooker. Add 1/4 tsp salt and 3 cups water. Set the rice cooker to the “Mixed” or “Sweet Rice” cooking mode and press “Start”. Allow to cook for the duration, approximately 1 1/2 hours.',
            stepImgUrl:
                'https://imagesvc.meredithcorp.io/v3/mm/image?url=https%3A%2F%2Fimages.media-allrecipes.com%2Fuserphotos%2F9562.jpg&w=596&h=399&c=sc&poi=face&q=85'),
        RecipeStep(
            stepImgUrl:
                'https://imagesvc.meredithcorp.io/v3/mm/image?url=https%3A%2F%2Fimages.media-allrecipes.com%2Fuserphotos%2F1110624.jpg&w=596&h=399&c=sc&poi=face&q=85',
            stepDescription:
                'Transfer the roasted peanuts into a small food processor. Pulse for just a few seconds to chop. Add the roasted sesame seeds, sugar and salt. Pulse again for a few more seconds. Transfer to a small bowl.')
      ],
      thumbnail:
          'https://runawayrice.com/wp-content/uploads/2017/06/Sticky-Rice-and-Peanuts-Xoi-Dau-Phong-1024x576.jpg',
      images: [
        'https://runawayrice.com/wp-content/uploads/2017/06/Sticky-Rice-and-Peanuts-Xoi-Dau-Phong-1024x576.jpg',
        'https://image-us.24h.com.vn/upload/2-2020/images/2020-04-24/Thu-theo-cach-nay-mon-xoi-lac-tuong-kho-nau-se-deo-bui-thom-ngon-vo-doi-2-1587697351-483-width600height450.jpg',
        'https://i.ytimg.com/vi/yPX8UOu0iyA/maxresdefault.jpg',
        'https://thptchuyenlamson.vn/wp-content/uploads/2020/04/cach-lam-xoi-lac.jpg',
        'https://sohanews.sohacdn.com/zoom/600_315/2020/photo1583289059625-1583289059824-crop-1583289112720837300485.jpg'
      ],
    ),
  ];

  @observable
  Recipe recipe = Recipe();

  @observable
  List<Recipe> personalList = <Recipe>[];

  @action
  void addToList() {
    listItem.add(recipe);
    personalList.add(recipe);
  }

  @action
  void updateRecipeName(String name) {
    recipe.name = name;
  }

  @action
  void updateRecipeDescription(String description) {
    recipe.name = description;
  }

  @action
  void updateRecipeImages(List<String> images) {
    recipe.images = images;
  }

  @action
  void removeImage(int index) {
    print(index);
    print('length ${recipe.images!.length}');
    recipe.images?.removeAt(index);
  }

  @action
  void updateRecipeSteps(RecipeStep step, int index) {
    recipe.steps![index] = step;
  }

  @action
  void addRecipeStep() {
    recipe.steps!.add(RecipeStep(
      stepDescription: 'New step',
      stepImgUrl: '',
    ));
  }

  @action
  void updateRecipeThumbnail(String thumbnail) {
    recipe.thumbnail = thumbnail;
  }

  @action
  void updateRecipeIngredients(String ingredient, int index) {
    recipe.ingredients![index] = ingredient;
  }

  @action
  void addRecipeIngredients() {
    recipe.ingredients!.add('100g new ingredient');
  }

  @action
  void updateRecipeId(String id) {
    recipe.id = id;
  }

  @action
  void resetRecipe() {
    recipe = Recipe(
        name: '',
        ingredients: ['100g new ingredient'],
        images: [],
        thumbnail: '',
        steps: [RecipeStep(stepImgUrl: '', stepDescription: 'New Step')],
        description: '',
        id: '');
  }
}
