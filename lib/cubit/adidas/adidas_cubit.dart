import 'dart:developer';

import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';
import 'package:shoeapp/repo/repo_produk.dart';
import 'package:shoeapp/res/res_get_adidas.dart';

part 'adidas_state.dart';

class AdidasCubit extends Cubit<AdidasState> {
  AdidasCubit() : super(AdidasInitial());

  RepoProduk repo = RepoProduk();
  ResGetAdidas? resGetAdidas;

  Future<void> getDataAdidas()async{
    try{
      emit(AdidasLoading());
      ResGetAdidas? res = await repo.getAdidas();
      if (res != null){
        resGetAdidas = res;
        emit(AdidasSucces(resGetAdidas));
      }else{
        log('${res?.message}');
        emit(AdidasError(res?.message));
      }
    } catch (e){
      log('${e.toString()}');
      emit(AdidasError(e.toString()));
    }
  }
}
