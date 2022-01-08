part of 'jordan_cubit.dart';

@immutable
abstract class JordanState {}

class JordanInitial extends JordanState {}

class JordanLoading extends JordanState{}

class JordanSuccess extends JordanState{
  final ResGetJordan? resGetJordan;
  JordanSuccess(this.resGetJordan);
}

class JordanError extends JordanState{
  final String? message;
  JordanError(this.message);
}