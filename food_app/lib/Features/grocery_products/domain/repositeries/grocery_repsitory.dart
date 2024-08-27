// lib/domain/repositories/product_repository.dart

import 'package:dartz/dartz.dart';
import 'package:ecommerce_app/Features/grocery_products/domain/entites/grocery.dart';
import 'package:ecommerce_app/core/error/failure.dart';

abstract class ProductRepository {
  Future<Either<Failure, List<Product>>> getProducts();
}
