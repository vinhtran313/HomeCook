import 'package:boilerplate/data/local/datasources/post/post_datasource.dart';
import 'package:boilerplate/data/network/apis/posts/post_api.dart';
import 'package:boilerplate/data/network/apis/recipe/recipe_api.dart';
import 'package:boilerplate/data/network/apis/register/login_api.dart';
import 'package:boilerplate/data/network/apis/register/register_api.dart';
import 'package:boilerplate/data/network/dio_client.dart';
import 'package:boilerplate/data/network/rest_client.dart';
import 'package:boilerplate/data/repositories/recipe_repository.dart';
import 'package:boilerplate/data/repository.dart';
import 'package:boilerplate/data/sharedpref/shared_preference_helper.dart';
import 'package:boilerplate/di/module/local_module.dart';
import 'package:boilerplate/di/module/network_module.dart';
import 'package:boilerplate/stores/cart/cart_store.dart';
import 'package:boilerplate/stores/error/error_store.dart';
import 'package:boilerplate/stores/food/food_store.dart';
import 'package:boilerplate/stores/food/my_food_store.dart';
import 'package:boilerplate/stores/form/form_store.dart';
import 'package:boilerplate/stores/language/language_store.dart';
import 'package:boilerplate/stores/order/order_store.dart';
import 'package:boilerplate/stores/post/post_store.dart';
import 'package:boilerplate/stores/recipe/list_recipe_store.dart';
import 'package:boilerplate/stores/recipe/recipe_store.dart';
import 'package:boilerplate/stores/theme/theme_store.dart';
import 'package:boilerplate/stores/user/user_store.dart';
import 'package:dio/dio.dart';
import 'package:get_it/get_it.dart';
import 'package:sembast/sembast.dart';
import 'package:shared_preferences/shared_preferences.dart';

final getIt = GetIt.instance;

Future<void> setupLocator() async {
  // factories:-----------------------------------------------------------------
  getIt.registerFactory(() => ErrorStore());
  getIt.registerFactory(
      () => FormStore(getIt<Repository>(), getIt<SharedPreferenceHelper>()));
  getIt.registerFactory(() => RecipeRepository(getIt<RecipeApi>()));
  // async singletons:----------------------------------------------------------
  getIt.registerSingletonAsync<Database>(() => LocalModule.provideDatabase());
  getIt.registerSingletonAsync<SharedPreferences>(
      () => LocalModule.provideSharedPreferences());

  // singletons:----------------------------------------------------------------
  getIt.registerSingleton(
      SharedPreferenceHelper(await getIt.getAsync<SharedPreferences>()));
  getIt.registerSingleton<Dio>(
      NetworkModule.provideDio(getIt<SharedPreferenceHelper>()));
  getIt.registerSingleton(DioClient(getIt<Dio>()));
  getIt.registerSingleton(RestClient());

  // api's:---------------------------------------------------------------------
  getIt.registerSingleton(PostApi(getIt<DioClient>(), getIt<RestClient>()));
  getIt.registerSingleton(RegisterApi(getIt<DioClient>(), getIt<RestClient>()));
  getIt.registerSingleton(LoginApi(
    getIt<DioClient>(),
    getIt<RestClient>(),
  ));
  getIt.registerSingleton(RecipeApi(getIt<DioClient>()));
  // data sources
  getIt.registerSingleton(PostDataSource(await getIt.getAsync<Database>()));

  // repository:----------------------------------------------------------------
  getIt.registerSingleton(Repository(
    getIt<PostApi>(),
    getIt<SharedPreferenceHelper>(),
    getIt<PostDataSource>(),
    getIt<RegisterApi>(),
    getIt<LoginApi>(),
  ));

  // stores:--------------------------------------------------------------------
  getIt.registerSingleton(LanguageStore(getIt<Repository>()));
  getIt.registerSingleton(PostStore(getIt<Repository>()));
  getIt.registerSingleton(ThemeStore(getIt<Repository>()));
  getIt.registerSingleton(UserStore(getIt<Repository>()));
  getIt.registerSingleton(RecipeStore(getIt<RecipeRepository>()));
  getIt.registerSingleton(RecipeListStore());
  getIt.registerSingleton(FoodStore());
  getIt.registerSingleton(OrderStore());
  getIt.registerSingleton(CartStore());
  getIt.registerSingleton(MyFoodStore());
}
