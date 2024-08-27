import 'dart:async';
import 'package:bloc/bloc.dart';
import 'package:ecommerce_app/Features/grocery_products/domain/entites/grocery.dart';
import 'package:ecommerce_app/Features/grocery_products/domain/usecases/get_groceryitem.dart';
import 'package:equatable/equatable.dart';
import 'package:dartz/dartz.dart';

// Import event and state parts
part 'grocery_event.dart';
part 'grocery_state.dart';

class GroceryBloc extends Bloc<GroceryEvent, GroceryState> {
  final GetProductsUseCase getProductsUseCase;

  // Update constructor parameter type
  GroceryBloc({required this.getProductsUseCase}) : super(GroceryInitial()) {
    // Handle specific event types
    on<GetProductEvent>(_getProducts);
  }
FutureOr<void> _getProducts(
  GetProductEvent event,
  Emitter<GroceryState> emit,
) async {
  emit(GroceryLoading()); // Emit loading state initially
  final productsEither = await getProductsUseCase(); // Fetch products from use case
  productsEither.fold(
    (failure) => emit(GroceryError(message: failure.message)),
    (products) => emit(GroceryLoaded(products: products)),
  );
}


}
