import 'dart:developer';

import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';
import 'package:shoeapp/repo/repo_produk.dart';
import 'package:shoeapp/res/res_get_jordan.dart';

part 'jordan_state.dart';

class JordanCubit extends Cubit<JordanState> {
  JordanCubit() : super(JordanInitial());

  RepoProduk repo = RepoProduk();
  ResGetJordan? resGetJordan;

  Future<void> getDataJordan() async {
    try {
      emit(JordanLoading());
      ResGetJordan? res = await repo.getJordan();
      if (res != null) {
        resGetJordan = res;
        emit(JordanSuccess(resGetJordan));
      } else {
        log('${res?.message}');
        emit(JordanError(res?.message));
      }
    } catch (e) {
      log('${e.toString()}');
      emit(JordanError(e.toString()));
    }
  }
}
