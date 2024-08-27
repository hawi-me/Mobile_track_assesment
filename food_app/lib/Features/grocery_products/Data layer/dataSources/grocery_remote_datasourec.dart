// lib/data/datasources/product_remote_data_source.dart

import 'package:ecommerce_app/Features/grocery_products/Data%20layer/models/grocery_model.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';

abstract class ProductRemoteDataSource {
  Future<List<ProductModel>> getProducts();
}

class ProductRemoteDataSourceImpl implements ProductRemoteDataSource {
  final http.Client client;

  ProductRemoteDataSourceImpl(this.client);

  @override
  Future<List<ProductModel>> getProducts() async {
    final response = await client.get(
      Uri.parse(
          'https://g5-flutter-learning-path-be.onrender.com/api/v1/groceries'),
    );

    if (response.statusCode == 200) {
      final List<dynamic> jsonData = json.decode(response.body)['data'];
      return jsonData.map((json) => ProductModel.fromJson(json)).toList();
    } else {
      throw Exception('Failed to load products');
    }
  }
}
