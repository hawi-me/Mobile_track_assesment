part of 'grocery_bloc.dart';

abstract class GroceryState extends Equatable {
  const GroceryState();

  @override
  List<Object> get props => [];
}

class GroceryInitial extends GroceryState {}

class GroceryLoading extends GroceryState {}

class GroceryLoaded extends GroceryState {
  final List<Product> products; // Adjust type as necessary

  const GroceryLoaded({required this.products});

  @override
  List<Object> get props => [products];
}

class GroceryError extends GroceryState {
  final String message;

  const GroceryError({required this.message});

  @override
  List<Object> get props => [message];
}
