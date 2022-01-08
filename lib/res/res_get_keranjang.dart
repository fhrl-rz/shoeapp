// To parse this JSON data, do
//
//     final resGetKeranjang = resGetKeranjangFromJson(jsonString);

import 'dart:convert';

ResGetKeranjang resGetKeranjangFromJson(String str) =>
    ResGetKeranjang.fromJson(json.decode(str));

String resGetKeranjangToJson(ResGetKeranjang data) =>
    json.encode(data.toJson());

class ResGetKeranjang {
  ResGetKeranjang({
    this.message,
    this.status,
    this.dataKeranjang,
  });

  String? message;
  bool? status;
  List<DataKeranjang>? dataKeranjang;

  factory ResGetKeranjang.fromJson(Map<String, dynamic> json) =>
      ResGetKeranjang(
        message: json["message"] == null ? null : json["message"],
        status: json["status"] == null ? null : json["status"],
        dataKeranjang: json["dataKeranjang"] == null
            ? null
            : List<DataKeranjang>.from(
                json["dataKeranjang"].map((x) => DataKeranjang.fromJson(x))),
      );

  Map<String, dynamic> toJson() => {
        "message": message == null ? null : message,
        "status": status == null ? null : status,
        "dataKeranjang": dataKeranjang == null
            ? null
            : List<dynamic>.from(dataKeranjang!.map((x) => x.toJson())),
      };
}

class DataKeranjang {
  DataKeranjang({
    this.detailId,
    this.detailOrder,
    this.detailProduk,
    this.detailQty,
    this.detailHarga,
    this.detailImg,
    this.detailUser,
    this.detailStatus,
    this.detailTotal,
    this.detailSize,
  });

  int? detailId;
  String? detailOrder;
  int? detailProduk;
  int? detailQty;
  int? detailHarga;
  String? detailImg;
  int? detailUser;
  int? detailStatus;
  int? detailTotal;
  int? detailSize;

  factory DataKeranjang.fromJson(Map<String, dynamic> json) => DataKeranjang(
        detailId: json["detail_id"] == null ? null : json["detail_id"],
        detailOrder: json["detail_order"] == null ? null : json["detail_order"],
        detailProduk:
            json["detail_produk"] == null ? null : json["detail_produk"],
        detailQty: json["detail_qty"] == null ? null : json["detail_qty"],
        detailHarga: json["detail_harga"] == null ? null : json["detail_harga"],
        detailImg: json["detail_img"] == null ? null : json["detail_img"],
        detailUser: json["detail_user"] == null ? null : json["detail_user"],
        detailStatus:
            json["detail_status"] == null ? null : json["detail_status"],
        detailTotal: json["detail_total"] == null ? null : json["detail_total"],
        detailSize: json["detail_size"] == null ? null : json["detail_size"],
      );

  Map<String, dynamic> toJson() => {
        "detail_id": detailId == null ? null : detailId,
        "detail_order": detailOrder == null ? null : detailOrder,
        "detail_produk": detailProduk == null ? null : detailProduk,
        "detail_qty": detailQty == null ? null : detailQty,
        "detail_harga": detailHarga == null ? null : detailHarga,
        "detail_img": detailImg == null ? null : detailImg,
        "detail_user": detailUser == null ? null : detailUser,
        "detail_status": detailStatus == null ? null : detailStatus,
        "detail_total": detailTotal == null ? null : detailTotal,
        "detail_size": detailSize == null ? null : detailSize,
      };
}
