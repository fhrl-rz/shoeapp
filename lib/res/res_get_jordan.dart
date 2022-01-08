// To parse this JSON data, do
//
//     final resGetJordan = resGetJordanFromJson(jsonString);

import 'dart:convert';

ResGetJordan resGetJordanFromJson(String str) =>
    ResGetJordan.fromJson(json.decode(str));

String resGetJordanToJson(ResGetJordan data) => json.encode(data.toJson());

class ResGetJordan {
  ResGetJordan({
    this.message,
    this.status,
    this.dataProduct,
  });

  String? message;
  int? status;
  List<DataProduct>? dataProduct;

  factory ResGetJordan.fromJson(Map<String, dynamic> json) => ResGetJordan(
        message: json["message"] == null ? null : json["message"],
        status: json["status"] == null ? null : json["status"],
        dataProduct: json["dataProduct"] == null
            ? null
            : List<DataProduct>.from(
                json["dataProduct"].map((x) => DataProduct.fromJson(x))),
      );

  Map<String, dynamic> toJson() => {
        "message": message == null ? null : message,
        "status": status == null ? null : status,
        "dataProduct": dataProduct == null
            ? null
            : List<dynamic>.from(dataProduct!.map((x) => x.toJson())),
      };
}

class DataProduct {
  DataProduct({
    this.jordanId,
    this.jordanNama,
    this.jordanStok,
    this.jordanHarga,
    this.jordanTanggal,
    this.deskripsiJordan,
    this.jordanGambar,
    this.jordanRating,
    this.isPromote,
  });

  int? jordanId;
  String? jordanNama;
  int? jordanStok;
  int? jordanHarga;
  DateTime? jordanTanggal;
  String? deskripsiJordan;
  String? jordanGambar;
  int? jordanRating;
  bool? isPromote;

  factory DataProduct.fromJson(Map<String, dynamic> json) => DataProduct(
        jordanId: json["jordan_id"] == null ? null : json["jordan_id"],
        jordanNama: json["jordan_nama"] == null ? null : json["jordan_nama"],
        jordanStok: json["jordan_stok"] == null ? null : json["jordan_stok"],
        jordanHarga: json["jordan_harga"] == null ? null : json["jordan_harga"],
        jordanTanggal: json["jordan_tanggal"] == null
            ? null
            : DateTime.parse(json["jordan_tanggal"]),
        deskripsiJordan:
            json["deskripsi_jordan"] == null ? null : json["deskripsi_jordan"],
        jordanGambar:
            json["jordan_gambar"] == null ? null : json["jordan_gambar"],
        jordanRating:
            json["jordan_rating"] == null ? null : json["jordan_rating"],
        isPromote: json["is_promote"] == null ? null : json["is_promote"],
      );

  Map<String, dynamic> toJson() => {
        "jordan_id": jordanId == null ? null : jordanId,
        "jordan_nama": jordanNama == null ? null : jordanNama,
        "jordan_stok": jordanStok == null ? null : jordanStok,
        "jordan_harga": jordanHarga == null ? null : jordanHarga,
        "jordan_tanggal":
            jordanTanggal == null ? null : jordanTanggal?.toIso8601String(),
        "deskripsi_jordan": deskripsiJordan == null ? null : deskripsiJordan,
        "jordan_gambar": jordanGambar == null ? null : jordanGambar,
        "jordan_rating": jordanRating == null ? null : jordanRating,
        "is_promote": isPromote == null ? null : isPromote,
      };
}
