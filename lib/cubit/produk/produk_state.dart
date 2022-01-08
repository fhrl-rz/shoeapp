part of 'produk_cubit.dart';

@immutable
abstract class ProdukState {}

class ProdukInitial extends ProdukState {}

class ProdukLoading extends ProdukState {}

class ProdukSuccess extends ProdukState {
  final ResGesProduk? resGetProduk;
  ProdukSuccess(this.resGetProduk);
}

class ProdukError extends ProdukState {
  final String? message;
  ProdukError(this.message);
}
