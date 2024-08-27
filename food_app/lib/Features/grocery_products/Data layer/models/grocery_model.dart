
import 'package:ecommerce_app/Features/grocery_products/domain/entites/grocery.dart';

class ProductModel extends Product {
  ProductModel({
    required String id,
    required String title,
    required String imageUrl,
    required double rating,
    required double price,
    required double discount,
    required String description,
    required List<OptionModel> options,
  }) : super(
          id: id,
          title: title,
          imageUrl: imageUrl,
          rating: rating,
          price: price,
          discount: discount,
          description: description,
          options: options,
        );

  factory ProductModel.fromJson(Map<String, dynamic> json) {
    return ProductModel(
      id: json['id'],
      title: json['title'],
      imageUrl: json['imageUrl'],
      rating: json['rating'].toDouble(),
      price: json['price'].toDouble(),
      discount: json['discount'].toDouble(),
      description: json['description'],
      options: (json['options'] as List)
          .map((option) => OptionModel.fromJson(option))
          .toList(),
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'title': title,
      'imageUrl': imageUrl,
      'rating': rating,
      'price': price,
      'discount': discount,
      'description': description,
      'options': options.map((option) => (option as OptionModel).toJson()).toList(),
    };
  }
}

class OptionModel extends Option {
  OptionModel({
    required String id,
    required String name,
    required double price,
  }) : super(id: id, name: name, price: price);

  factory OptionModel.fromJson(Map<String, dynamic> json) {
    return OptionModel(
      id: json['id'],
      name: json['name'],
      price: json['price'].toDouble(),
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'name': name,
      'price': price,
    };
  }
}
