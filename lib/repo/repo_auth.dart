import 'dart:convert';
import 'dart:developer';
import 'package:path/path.dart';
import 'package:dio/dio.dart';
import 'package:image_picker/image_picker.dart';
import 'package:shoeapp/data_global.dart';
import 'package:shoeapp/network/api.dart';
import 'package:shoeapp/res/res_get_profile.dart';
import 'package:shoeapp/res/res_login.dart';
import 'package:shoeapp/res/res_register.dart';
import 'package:shoeapp/res/res_update_profile.dart';

class RepoAuth{
  Future<ResRegister?> registerAccount(
      String? nama, String? email, String? password) async {
    Response res = await dio.post(apiRegister,
        data: FormData.fromMap(
            {'nama': '$nama', 'email': '$email', 'password': '$password'}));
    return ResRegister.fromJson(jsonDecode(res.data));
  }

  Future<ResLogin?> loginAccount(String? email, String? password) async {
    Response res = await dio.post(apiLogin,
        data: FormData.fromMap({'email': '$email', 'password': '$password'}));
    return ResLogin.fromJson(jsonDecode(res.data));
  }
  Future<ResGesProfile?> getProfile() async {
    try {
      Response res = await dio.post(apiProfile,
          data: FormData.fromMap({'iduser': '${dataGlobal.user?.userId}'}));
      return ResGesProfile.fromJson(jsonDecode(res.data));
    } catch (e) {}
  }

  Future<ResUpdateProfile?> updateProfile(
      String? nama,
      XFile? image,
      ) async {
    try {
      Response res = await dio.post(apiUpdateProfile,
          data: FormData.fromMap({
            'idUser': '${dataGlobal.user?.userId}',
            'userNama': '$nama',
            'image': await MultipartFile.fromFile(image!.path,
                filename: basename(image.path))
          }));
      return ResUpdateProfile.fromJson(jsonDecode(res.data));
    } catch (e) {
      log('${e.toString()}');
    }
  }
}