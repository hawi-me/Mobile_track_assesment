import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';

part 'grocery_event.dart';
part 'grocery_state.dart';

class GroceryBloc extends Bloc<GroceryEvent, GroceryState> {
  GroceryBloc() : super(GroceryInitial()) {
    on<GroceryEvent>((event, emit) {
      // TODO: implement event handler
    });
  }
}
