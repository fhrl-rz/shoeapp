import 'dart:developer';

import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';
import 'package:shoeapp/repo/repo_produk.dart';
import 'package:shoeapp/res/res_get_nike.dart';

part 'nike_state.dart';

class NikeCubit extends Cubit<NikeState> {
  NikeCubit() : super(NikeInitial());

  RepoProduk repo = RepoProduk();
  ResGetNike? resGetNike;

  Future<void> getDataNike() async {
    try {
      emit(NikeLoading());
      ResGetNike? res = await repo.getNike();
      if ( res != null){
        resGetNike = res;
        emit(NikeSuccess(resGetNike));
      } else{
        log('${res?.message}');
        emit(NikeError(res?.message));
      }
    } catch (e) {
      log("${e.toString()}");
      emit(NikeError(e.toString()));
    }
  }
}
