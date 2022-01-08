import 'package:bloc/bloc.dart';
import 'package:flutter/material.dart';
import 'package:shoeapp/repo/repo_produk.dart';
import 'package:shoeapp/res/res_insert_keranjang.dart';
import 'package:shoeapp/ui/home/list.dart';
import 'package:shoeapp/ui/home/pemesanan.dart';

part 'insert_cart_state.dart';

class InsertCartCubit extends Cubit<InsertCartState> {
  InsertCartCubit() : super(InsertCartInitial());

  RepoProduk repo = RepoProduk();
  ResInsertKeranjang? resInsertKeranjang;

  Future<void> addItemKeranjang(
    BuildContext context,
    String? cartIdOrder,
    String? cartIdProduk,
    int? cartQty,
    String? cartSize,
    int? cartHarga,
  ) async {
    try {
      emit(InsertCartLoading());
      ResInsertKeranjang? res = await repo.addKeranjang(
          cartIdOrder, cartIdProduk, cartQty, cartSize, cartHarga);
      print(res.toString());
      if (res != null) {
        resInsertKeranjang = res;
        // ScaffoldMessenger.of(context)
        //     .showSnackBar(SnackBar(content: Text('${res.message}')));
        emit(InsertCartSuccess(resInsertKeranjang));
        if (res.status == 200) {
          // Navigator.push(context,
          //     MaterialPageRoute(builder: (context) => PemesananPage()));
          emit(InsertCartError(res.message));
          ScaffoldMessenger.of(context)
              .showSnackBar(SnackBar(content: Text('${res.message}')));
        } else if (res.status == 404) {
          emit(InsertCartError(res.message));
          ScaffoldMessenger.of(context)
              .showSnackBar(SnackBar(content: Text('${res.message}')));
        }
      } else {
        ScaffoldMessenger.of(context)
            .showSnackBar(SnackBar(content: Text('${res?.message}')));
        emit(InsertCartError(res?.message));
      }
    } catch (e, st) {
      print(st);
      ScaffoldMessenger.of(context)
          .showSnackBar(SnackBar(content: Text('${e.toString()}')));
      emit(InsertCartError(e.toString()));
    }
  }
}
