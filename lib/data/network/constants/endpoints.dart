class Endpoints {
  Endpoints._();

  // base url
  static const String baseUrl = "http://34.126.80.38/api";

  // receiveTimeout
  static const int receiveTimeout = 15000;

  // connectTimeout
  static const int connectionTimeout = 30000;

  // booking endpoints
  static const String getPosts = baseUrl + "/posts";

  static const String getRecipe = baseUrl + "/food/";
  static const String postRecipe = baseUrl + "/food";
}
