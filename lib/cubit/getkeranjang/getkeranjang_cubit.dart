import 'dart:developer';

import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:shoeapp/cubit/getkeranjang/getkeranjang_state.dart';
import 'package:shoeapp/repo/repo_produk.dart';
import 'package:shoeapp/res/res_get_keranjang.dart';

class GetKeranjangCubit extends Cubit<GetkeranjangState> {
  GetKeranjangCubit() : super(GetkeranjangInitial());

  RepoProduk repo = RepoProduk();
  ResGetKeranjang? resGetKeranjang;

  Future<void> getDataKeranjang() async {
    try {
      emit(GetkeranjangLoading());
      ResGetKeranjang? res = await repo.getKeranjang();
      if (res != null) {
        resGetKeranjang = res;
        emit(GetkeranjangSuccess(resGetKeranjang));
      } else {
        log('${res?.message}');
        emit(GetkeranjangError(res?.message));
      }
    } catch (e) {
      log("${e.toString()}");
      emit(GetkeranjangError(e.toString()));
    }
  }
}
