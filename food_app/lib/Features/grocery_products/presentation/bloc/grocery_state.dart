part of 'grocery_bloc.dart';

sealed class GroceryState extends Equatable {
  const GroceryState();
  
  @override
  List<Object> get props => [];
}

final class GroceryInitial extends GroceryState {}
