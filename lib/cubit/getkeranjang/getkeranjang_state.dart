import 'package:flutter/material.dart';
import 'package:shoeapp/res/res_get_keranjang.dart';

@immutable
abstract class GetkeranjangState {}

class GetkeranjangInitial extends GetkeranjangState {}

class GetkeranjangLoading extends GetkeranjangState {}

class GetkeranjangSuccess extends GetkeranjangState {
  final ResGetKeranjang? resGetKeranjang;
  GetkeranjangSuccess(this.resGetKeranjang);
}

class GetkeranjangError extends GetkeranjangState {
  final String? message;
  GetkeranjangError(this.message);
}
