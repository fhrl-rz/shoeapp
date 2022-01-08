import 'dart:convert';
import 'dart:developer';

import 'package:dio/dio.dart';
import 'package:shoeapp/network/api.dart';
import 'package:shoeapp/res/res_get_adidas.dart';
import 'package:shoeapp/res/res_get_jordan.dart';
import 'package:shoeapp/res/res_get_keranjang.dart';
import 'package:shoeapp/res/res_get_nike.dart';
import 'package:shoeapp/res/res_get_produk.dart';
import 'package:shoeapp/res/res_insert_keranjang.dart';

import '../data_global.dart';

class RepoProduk {
  Future<ResGesProduk?> getProduk() async {
    try {
      Response res = await dio.get(apiProduk);
      return ResGesProduk.fromJson(jsonDecode(res.data));
    } catch (e) {
      log('${e.toString()}');
    }
  }

  Future<ResGetJordan?> getJordan() async {
    try {
      Response res = await dio.get(apiJordan);
      return ResGetJordan.fromJson(jsonDecode(res.data));
    } catch (e) {
      log('${e.toString()}');
    }
  }

  Future<ResGetAdidas?> getAdidas() async {
    try {
      Response res = await dio.get(apiAdidas);
      return ResGetAdidas.fromJson(jsonDecode(res.data));
    } catch (e) {
      log('${e.toString()}');
    }
  }

  Future<ResGetNike?> getNike() async {
    try {
      Response res = await dio.get(apiNike);
      return ResGetNike.fromJson(jsonDecode(res.data));
    } catch (e) {
      log('${e.toString()}');
    }
  }

  Future<ResGetKeranjang?> getKeranjang() async {
    try {
      Response res = await dio.get(apigetKeranjang);
      return ResGetKeranjang.fromJson(jsonDecode(res.data));
    } catch (e) {
      log('${e.toString()}');
    }
  }

  Future<ResInsertKeranjang?> addKeranjang(
      String? cartIdOrder,
      String? cartIdProduk,
      int? cartQty,
      String? cartSize,
      int? cartHarga) async {
    Response res = await dio.post(apiKeranjang,
        data: FormData.fromMap({
          'iduser': '${dataGlobal.user?.userId}',
          'idproduk': '$cartIdProduk',
          'idorder': '$cartIdOrder',
          'qty': '$cartQty',
          'size': '$cartSize',
          'harga': '$cartHarga',
        }));

    return ResInsertKeranjang.fromJson(jsonDecode(res.data));
  }
}
