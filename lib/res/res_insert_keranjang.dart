// To parse this JSON data, do
//
//     final resInsertKeranjang = resInsertKeranjangFromJson(jsonString);

import 'dart:convert';

ResInsertKeranjang resInsertKeranjangFromJson(String str) =>
    ResInsertKeranjang.fromJson(json.decode(str));

String resInsertKeranjangToJson(ResInsertKeranjang data) =>
    json.encode(data.toJson());

class ResInsertKeranjang {
  ResInsertKeranjang({
    this.status,
    this.message,
    this.data,
    this.qty,
    this.size,
    this.price,
  });

  int? status;
  String? message;
  Data? data;
  int? qty;
  String? size;
  int? price;

  factory ResInsertKeranjang.fromJson(Map<String, dynamic> json) =>
      ResInsertKeranjang(
        status: json["status"] == null ? null : json["status"],
        message: json["message"] == null ? null : json["message"],
        data: json["data"] == null ? null : Data.fromJson(json["data"]),
        qty: json["qty"] == null ? null : json["qty"],
        size: json["size"] == null ? null : json["size"],
        price: json["price"] == null ? null : json["price"],
      );

  Map<String, dynamic> toJson() => {
        "status": status == null ? null : status,
        "message": message == null ? null : message,
        "data": data == null ? null : data!.toJson(),
        "qty": qty == null ? null : qty,
        "size": size == null ? null : size,
        "price": price == null ? null : price,
      };
}

class Data {
  Data({
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
  dynamic detailImg;
  int? detailUser;
  int? detailStatus;
  int? detailTotal;
  int? detailSize;

  factory Data.fromJson(Map<String, dynamic> json) => Data(
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
