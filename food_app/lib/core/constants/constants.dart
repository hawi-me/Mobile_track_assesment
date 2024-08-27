
class Urls {
  static const String baseurl = 'https://g5-flutter-learning-path-be.onrender.com/api/v2/products';

  // static String currentProductById(String id) {}h-be.onrender.com/';
  static String currentProductById(String id) => '$baseurl/$id';
  // static String ProductAll() => '';
  static String ProductAll() => '$baseurl';
  static String DelelteByid(String id) => '$baseurl/$id';
  // static Product insertProduct(ProductModel product) => '';
  static String updateById(String id) => '$baseurl/$id';
}
