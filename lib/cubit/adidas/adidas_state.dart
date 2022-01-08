part of 'adidas_cubit.dart';

@immutable
abstract class AdidasState {}

class AdidasInitial extends AdidasState {}

class AdidasLoading extends AdidasState{}

class AdidasSucces extends AdidasState{
  final ResGetAdidas? resGetAdidas;
  AdidasSucces(this.resGetAdidas);
}

class AdidasError extends AdidasState{
  final String? message;
  AdidasError(this.message);
}
