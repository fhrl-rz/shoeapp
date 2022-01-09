// To parse this JSON data, do
//
//     final resUpdateProfile = resUpdateProfileFromJson(jsonString);

import 'dart:convert';

ResUpdateProfile resUpdateProfileFromJson(String str) => ResUpdateProfile.fromJson(json.decode(str));

String resUpdateProfileToJson(ResUpdateProfile data) => json.encode(data.toJson());

class ResUpdateProfile {
  ResUpdateProfile({
    this.message,
    this.status,
  });

  String? message;
  int? status;

  factory ResUpdateProfile.fromJson(Map<String, dynamic> json) => ResUpdateProfile(
    message: json["message"] == null ? null : json["message"],
    status: json["status"] == null ? null : json["status"],
  );

  Map<String, dynamic> toJson() => {
    "message": message == null ? null : message,
    "status": status == null ? null : status,
  };
}
