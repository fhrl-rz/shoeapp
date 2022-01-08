// To parse this JSON data, do
//
//     final resGesProduk = resGesProdukFromJson(jsonString);

import 'dart:convert';

ResGesProduk resGesProdukFromJson(String str) => ResGesProduk.fromJson(json.decode(str));

String resGesProdukToJson(ResGesProduk data) => json.encode(data.toJson());

class ResGesProduk {
  ResGesProduk({
    this.message,
    this.status,
    this.dataProduct,
  });

  String? message;
  int? status;
  List<DataProduct>? dataProduct;

  factory ResGesProduk.fromJson(Map<String, dynamic> json) => ResGesProduk(
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
    this.produkId,
    this.produkNama,
    this.produkStok,
    this.produkHarga,
    this.produkTanggal,
    this.deskripsiProduk,
    this.produkGambar,
    this.produkRating,
    this.isPromote,
  });

  int? produkId;
  String? produkNama;
  int? produkStok;
  int? produkHarga;
  DateTime? produkTanggal;
  String? deskripsiProduk;
  String? produkGambar;
  int? produkRating;
  bool? isPromote;

  factory DataProduct.fromJson(Map<String, dynamic> json) => DataProduct(
    produkId: json["produk_id"] == null ? null : json["produk_id"],
    produkNama: json["produk_nama"] == null ? null : json["produk_nama"],
    produkStok: json["produk_stok"] == null ? null : json["produk_stok"],
    produkHarga: json["produk_harga"] == null ? null : json["produk_harga"],
    produkTanggal: json["produk_tanggal"] == null ? null : DateTime.parse(json["produk_tanggal"]),
    deskripsiProduk: json["deskripsi_produk"] == null ? null : json["deskripsi_produk"],
    produkGambar: json["produk_gambar"] == null ? null : json["produk_gambar"],
    produkRating: json["produk_rating"] == null ? null : json["produk_rating"],
    isPromote: json["is_promote"] == null ? null : json["is_promote"],
  );

  Map<String, dynamic> toJson() => {
    "produk_id": produkId == null ? null : produkId,
    "produk_nama": produkNama == null ? null : produkNama,
    "produk_stok": produkStok == null ? null : produkStok,
    "produk_harga": produkHarga == null ? null : produkHarga,
    "produk_tanggal": produkTanggal == null ? null : produkTanggal!.toIso8601String(),
    "deskripsi_produk": deskripsiProduk == null ? null : deskripsiProduk,
    "produk_gambar": produkGambar == null ? null : produkGambar,
    "produk_rating": produkRating == null ? null : produkRating,
    "is_promote": isPromote == null ? null : isPromote,
  };
}
