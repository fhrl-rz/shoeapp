// To parse this JSON data, do
//
//     final resGesProfile = resGesProfileFromJson(jsonString);

import 'dart:convert';

ResGesProfile resGesProfileFromJson(String str) => ResGesProfile.fromJson(json.decode(str));

String resGesProfileToJson(ResGesProfile data) => json.encode(data.toJson());

class ResGesProfile {
  ResGesProfile({
    this.message,
    this.status,
    this.profile,
  });

  String? message;
  int? status;
  List<Profile>? profile;

  factory ResGesProfile.fromJson(Map<String, dynamic> json) => ResGesProfile(
    message: json["message"] == null ? null : json["message"],
    status: json["status"] == null ? null : json["status"],
    profile: json["profile"] == null ? null : List<Profile>.from(json["profile"].map((x) => Profile.fromJson(x))),
  );

  Map<String, dynamic> toJson() => {
    "message": message == null ? null : message,
    "status": status == null ? null : status,
    "profile": profile == null ? null : List<dynamic>.from(profile!.map((x) => x.toJson())),
  };
}

class Profile {
  Profile({
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

  factory Profile.fromJson(Map<String, dynamic> json) => Profile(
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
    "user_tanggal": userTanggal == null ? null : userTanggal!.toIso8601String(),
    "user_image": userImage == null ? null : userImage,
    "user_saldo": userSaldo == null ? null : userSaldo,
  };
}
