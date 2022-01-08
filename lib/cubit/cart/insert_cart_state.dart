part of 'insert_cart_cubit.dart';

@immutable
abstract class InsertCartState {}

class InsertCartInitial extends InsertCartState {}

class InsertCartLoading extends InsertCartState {}

class InsertCartSuccess extends InsertCartState {
  final ResInsertKeranjang? resInsertKeranjang;
  InsertCartSuccess(this.resInsertKeranjang);
}

class InsertCartError extends InsertCartState {
  final String? message;
  InsertCartError(this.message);
}