// lib/data/repositories/product_repository_impl.dart

import 'package:dartz/dartz.dart';
import 'package:ecommerce_app/Features/grocery_products/Data%20layer/dataSources/grocery_remote_datasourec.dart';
import 'package:ecommerce_app/Features/grocery_products/domain/entites/grocery.dart';
import 'package:ecommerce_app/Features/grocery_products/domain/repositeries/grocery_repsitory.dart';
import 'package:ecommerce_app/core/error/failure.dart';
import 'package:ecommerce_app/core/platform/network_info.dart';

class ProductRepositoryImpl implements ProductRepository {
  final ProductRemoteDataSource remoteDataSource;
  final NetworkInfo networkInfo;

  ProductRepositoryImpl({required this.remoteDataSource, required this.networkInfo});


  @override
  Future<Either<Failure, List<Product>>> getProducts() async {
    try {
      if (await networkInfo.isConnneted) {
        final remoteProducts = await remoteDataSource.getProducts();
        return Right(remoteProducts);
      } else {
        return left(NetworkFailure('There is no connection'));
      }
    } catch (e) {
      return Left(ServerFailure(''));
    }
  }
}
