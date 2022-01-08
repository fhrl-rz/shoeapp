import 'dart:developer';

import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';
import 'package:shoeapp/repo/repo_produk.dart';
import 'package:shoeapp/res/res_get_produk.dart';

part 'produk_state.dart';

class ProdukCubit extends Cubit<ProdukState> {
  ProdukCubit() : super(ProdukInitial());
  RepoProduk repo = RepoProduk();
  ResGesProduk? resGetProduk;

  Future<void> getDataProduk() async{
    try{
      emit(ProdukLoading());
      ResGesProduk? res = await repo.getProduk();
      if(res !=null){
        resGetProduk = res;
        emit(ProdukSuccess(resGetProduk));
      }else{
        log('${res?.message}');
        emit(ProdukError(res?.message));
      }
    } catch(e){
      log("${e.toString()}");
      emit(ProdukError(e.toString()));
    }
  }
}
