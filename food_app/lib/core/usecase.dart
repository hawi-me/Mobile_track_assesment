import 'package:dartz/dartz.dart';
import 'package:equatable/equatable.dart';
import 'error/failure.dart';

abstract class useCase<Type, Paramter> {
  Future<Either<Failure, Type>> call(Paramter paramter);
}

class NoParmater extends Equatable {
  @override
  // TODO: implement props
  List<Object?> get props => [];
}