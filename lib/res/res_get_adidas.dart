// To parse this JSON data, do
//
//     final resGetAdidas = resGetAdidasFromJson(jsonString);

import 'dart:convert';

ResGetAdidas resGetAdidasFromJson(String str) => ResGetAdidas.fromJson(json.decode(str));

String resGetAdidasToJson(ResGetAdidas data) => json.encode(data.toJson());

class ResGetAdidas {
  ResGetAdidas({
    this.message,
    this.status,
    this.dataProduct,
  });

  String? message;
  int? status;
  List<DataProduct>? dataProduct;

  factory ResGetAdidas.fromJson(Map<String, dynamic> json) => ResGetAdidas(
    message: json["message"] == null ? null : json["message"],
    status: json["status"] == null ? null : json["status"],
    dataProduct: json["dataProduct"] == null ? null : List<DataProduct>.from(json["dataProduct"].map((x) => DataProduct.fromJson(x))),
  );

  Map<String, dynamic> toJson() => {
    "message": message == null ? null : message,
    "status": status == null ? null : status,
    "dataProduct": dataProduct == null ? null : List<dynamic>.from(dataProduct!.map((x) => x.toJson())),
  };
}

class DataProduct {
  DataProduct({
    this.adidasId,
    this.adidasNama,
    this.adidasStok,
    this.adidasHarga,
    this.adidasTanggal,
    this.deskripsiAdidas,
    this.adidasGambar,
    this.adidasRating,
    this.isPromote,
  });

  int? adidasId;
  String? adidasNama;
  int? adidasStok;
  int? adidasHarga;
  DateTime? adidasTanggal;
  String? deskripsiAdidas;
  String? adidasGambar;
  int? adidasRating;
  bool? isPromote;

  factory DataProduct.fromJson(Map<String, dynamic> json) => DataProduct(
    adidasId: json["adidas_id"] == null ? null : json["adidas_id"],
    adidasNama: json["adidas_nama"] == null ? null : json["adidas_nama"],
    adidasStok: json["adidas_stok"] == null ? null : json["adidas_stok"],
    adidasHarga: json["adidas_harga"] == null ? null : json["adidas_harga"],
    adidasTanggal: json["adidas_tanggal"] == null ? null : DateTime.parse(json["adidas_tanggal"]),
    deskripsiAdidas: json["deskripsi_adidas"] == null ? null : json["deskripsi_adidas"],
    adidasGambar: json["adidas_gambar"] == null ? null : json["adidas_gambar"],
    adidasRating: json["adidas_rating"] == null ? null : json["adidas_rating"],
    isPromote: json["is_promote"] == null ? null : json["is_promote"],
  );

  Map<String, dynamic> toJson() => {
    "adidas_id": adidasId == null ? null : adidasId,
    "adidas_nama": adidasNama == null ? null : adidasNama,
    "adidas_stok": adidasStok == null ? null : adidasStok,
    "adidas_harga": adidasHarga == null ? null : adidasHarga,
    "adidas_tanggal": adidasTanggal == null ? null : adidasTanggal!.toIso8601String(),
    "deskripsi_adidas": deskripsiAdidas == null ? null : deskripsiAdidas,
    "adidas_gambar": adidasGambar == null ? null : adidasGambar,
    "adidas_rating": adidasRating == null ? null : adidasRating,
    "is_promote": isPromote == null ? null : isPromote,
  };
}
