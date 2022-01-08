import 'dart:developer';

import 'package:bloc/bloc.dart';
import 'package:flutter/material.dart';
import 'package:meta/meta.dart';
import 'package:shoeapp/data_global.dart';
import 'package:shoeapp/data_lokal/preference_data.dart';
import 'package:shoeapp/navbar/navbar.dart';
import 'package:shoeapp/repo/repo_auth.dart';
import 'package:shoeapp/res/res_login.dart';

part 'login_state.dart';

class LoginCubit extends Cubit<LoginState> {
  LoginCubit() : super(LoginInitial());
  RepoAuth repo = RepoAuth();
  ResLogin? resLogin;

  Future<void> loginAccount(
      BuildContext context, String? email, String? password) async {
    try {
      emit(LoginLoading());
      ResLogin? res = await repo.loginAccount(email, password);
      if (res != null) {
        resLogin = res;
        dataGlobal.user = resLogin?.user;
        await SavePreference().saveUser();
        emit(LoginSuccess(resLogin));
        if (res.status == 200) {
          Navigator.pushAndRemoveUntil(
              context,
              MaterialPageRoute(builder: (_) => NavbarPage()),
                  (route) => false);
        } else if (res.status == 404) {
          emit(LoginError(res.message));
          ScaffoldMessenger.of(context)
              .showSnackBar(SnackBar(content: Text('${res.message}')));
        } else {
          emit(LoginError(res.message));
          ScaffoldMessenger.of(context)
              .showSnackBar(SnackBar(content: Text('${res.message}')));
        }
      }
    } catch (e) {
      log('${e.toString()}');
      emit(LoginError(e.toString()));
    }
  }
}
