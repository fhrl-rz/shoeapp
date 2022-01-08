// To parse this JSON data, do
//
//     final resGetNike = resGetNikeFromJson(jsonString);

import 'dart:convert';

ResGetNike resGetNikeFromJson(String str) => ResGetNike.fromJson(json.decode(str));

String resGetNikeToJson(ResGetNike data) => json.encode(data.toJson());

class ResGetNike {
  ResGetNike({
    this.message,
    this.status,
    this.dataProduct,
  });

  String? message;
  int? status;
  List<DataProduct>? dataProduct;

  factory ResGetNike.fromJson(Map<String, dynamic> json) => ResGetNike(
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
    this.nikeId,
    this.nikeNama,
    this.nikeStok,
    this.nikeHarga,
    this.nikeTanggal,
    this.deskripsiNilai,
    this.nikeGambar,
    this.nikeRating,
    this.isPromote,
  });

  int? nikeId;
  String? nikeNama;
  int? nikeStok;
  int? nikeHarga;
  DateTime? nikeTanggal;
  String? deskripsiNilai;
  String? nikeGambar;
  int? nikeRating;
  bool? isPromote;

  factory DataProduct.fromJson(Map<String, dynamic> json) => DataProduct(
    nikeId: json["nike_id"] == null ? null : json["nike_id"],
    nikeNama: json["nike_nama"] == null ? null : json["nike_nama"],
    nikeStok: json["nike_stok"] == null ? null : json["nike_stok"],
    nikeHarga: json["nike_harga"] == null ? null : json["nike_harga"],
    nikeTanggal: json["nike_tanggal"] == null ? null : DateTime.parse(json["nike_tanggal"]),
    deskripsiNilai: json["deskripsi_nilai"] == null ? null : json["deskripsi_nilai"],
    nikeGambar: json["nike_gambar"] == null ? null : json["nike_gambar"],
    nikeRating: json["nike_rating"] == null ? null : json["nike_rating"],
    isPromote: json["is_promote"] == null ? null : json["is_promote"],
  );

  Map<String, dynamic> toJson() => {
    "nike_id": nikeId == null ? null : nikeId,
    "nike_nama": nikeNama == null ? null : nikeNama,
    "nike_stok": nikeStok == null ? null : nikeStok,
    "nike_harga": nikeHarga == null ? null : nikeHarga,
    "nike_tanggal": nikeTanggal == null ? null : nikeTanggal!.toIso8601String(),
    "deskripsi_nilai": deskripsiNilai == null ? null : deskripsiNilai,
    "nike_gambar": nikeGambar == null ? null : nikeGambar,
    "nike_rating": nikeRating == null ? null : nikeRating,
    "is_promote": isPromote == null ? null : isPromote,
  };
}
