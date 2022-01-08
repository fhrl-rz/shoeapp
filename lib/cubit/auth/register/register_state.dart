part of 'register_cubit.dart';

@immutable
abstract class RegisterState {}

class RegisterInitial extends RegisterState {}
class RegisterLoading extends RegisterState {}

class RegisterSuccess extends RegisterState {
  final ResRegister? resRegister;
  RegisterSuccess(this.resRegister);
}

class RegisterError extends RegisterState {
  final String? message;
  RegisterError(this.message);
}

