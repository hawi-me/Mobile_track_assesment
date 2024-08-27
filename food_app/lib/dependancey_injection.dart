import 'package:ecommerce_app/Features/grocery_products/Data%20layer/dataSources/grocery_remote_datasourec.dart';
import 'package:ecommerce_app/Features/grocery_products/Data%20layer/repositeries/grocery_repositories.dart';
import 'package:ecommerce_app/Features/grocery_products/domain/repositeries/grocery_repsitory.dart';
import 'package:ecommerce_app/Features/grocery_products/domain/usecases/get_groceryitem.dart';
import 'package:ecommerce_app/Features/grocery_products/presentation/bloc/grocery_bloc.dart';
import 'package:ecommerce_app/core/platform/network_info.dart';
import 'package:get_it/get_it.dart';
import 'package:http/http.dart' as http;
import 'package:internet_connection_checker/internet_connection_checker.dart';

final sl = GetIt.instance;

Future<void> init() async {
  // BLoC
  // sl.registerFactory(() => ProductBloc(getProducts: sl()));

  // Repository
  sl.registerLazySingleton(() => http.Client());
  sl.registerLazySingleton<InternetConnectionChecker>(
      () => InternetConnectionChecker());
  sl.registerLazySingleton<NetworkInfo>(() => NetworkInfoImpl(
      internetConnectionChecker: sl<InternetConnectionChecker>()));

  sl.registerLazySingleton<ProductRemoteDataSource>(
      () => ProductRemoteDataSourceImpl(sl()));
  sl.registerLazySingleton<ProductRepository>(
      () => ProductRepositoryImpl(remoteDataSource: sl(), networkInfo: sl()));

  // Use cases
  sl.registerLazySingleton<GetProductsUseCase>(() => GetProductsUseCase(sl()));
  sl.registerLazySingleton(() => GroceryBloc(getProductsUseCase: sl()));

  // External
}
