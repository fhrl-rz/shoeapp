// To parse this JSON data, do
//
//     final resLogin = resLoginFromJson(jsonString);

import 'dart:convert';

ResLogin resLoginFromJson(String str) => ResLogin.fromJson(json.decode(str));

String resLoginToJson(ResLogin data) => json.encode(data.toJson());

class ResLogin {
  ResLogin({
    this.message,
    this.status,
    this.user,
  });

  String? message;
  int? status;
  User? user;

  factory ResLogin.fromJson(Map<String, dynamic> json) => ResLogin(
    message: json["message"] == null ? null : json["message"],
    status: json["status"] == null ? null : json["status"],
    user: json["user"] == null ? null : User.fromJson(json["user"]),
  );

  Map<String, dynamic> toJson() => {
    "message": message == null ? null : message,
    "status": status == null ? null : status,
    "user": user == null ? null : user!.toJson(),
  };
}

class User {
  User({
    this.userId,
    this.userNama,
    this.userEmail,
    this.userPassword,
    this.userTanggal,
    this.userImage,
    this.userSaldo,
  });

  int? userId;
  String? userNama;
  String? userEmail;
  String? userPassword;
  DateTime? userTanggal;
  String? userImage;
  String? userSaldo;

  factory User.fromJson(Map<String, dynamic> json) => User(
    userId: json["user_id"] == null ? null : json["user_id"],
    userNama: json["user_nama"] == null ? null : json["user_nama"],
    userEmail: json["user_email"] == null ? null : json["user_email"],
    userPassword: json["user_password"] == null ? null : json["user_password"],
    userTanggal: json["user_tanggal"] == null ? null : DateTime.parse(json["user_tanggal"]),
    userImage: json["user_image"] == null ? null : json["user_image"],
    userSaldo: json["user_saldo"] == null ? null : json["user_saldo"],
  );

  Map<String, dynamic> toJson() => {
    "user_id": userId == null ? null : userId,
    "user_nama": userNama == null ? null : userNama,
    "user_email": userEmail == null ? null : userEmail,
    "user_password": userPassword == null ? null : userPassword,
    "user_tanggal": userTanggal == null ? null : userTanggal?.toIso8601String(),
    "user_image": userImage == null ? null : userImage,
    "user_saldo": userSaldo == null ? null : userSaldo,
  };
}
