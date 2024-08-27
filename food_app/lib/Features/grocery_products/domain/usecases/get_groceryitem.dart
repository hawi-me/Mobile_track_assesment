// lib/domain/usecases/get_products_usecase.dart



import 'package:dartz/dartz.dart';
import 'package:ecommerce_app/Features/grocery_products/domain/entites/grocery.dart';
import 'package:ecommerce_app/Features/grocery_products/domain/repositeries/grocery_repsitory.dart';
import 'package:ecommerce_app/core/error/failure.dart';

class GetProductsUseCase {
  final ProductRepository repository;

  GetProductsUseCase(this.repository);

  Future<Either<Failure, List<Product>>> call() async {
    return await repository.getProducts();
  }
}
