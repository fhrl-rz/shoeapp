import 'dart:developer';

import 'package:bloc/bloc.dart';
import 'package:flutter/material.dart';
import 'package:shoeapp/repo/repo_auth.dart';
import 'package:shoeapp/res/res_register.dart';
import 'package:shoeapp/ui/auth/SignIn.dart';


part 'register_state.dart';

class RegisterCubit extends Cubit<RegisterState> {
  RegisterCubit() : super(RegisterInitial());


  RepoAuth repo = RepoAuth();
  ResRegister? resRegister;

  Future<void> registerAccount(BuildContext context, String? nama,
      String? email, String? password) async {
    try {
      emit(RegisterLoading());
      ResRegister? res = await repo.registerAccount(nama, email, password);
      if (res != null) {
        resRegister = res;
        emit(RegisterSuccess(resRegister));
        if (res.status == 200) {
          Navigator.pushAndRemoveUntil(context,
              MaterialPageRoute(builder: (_) => SignIn()), (route) => false);
        } else if (res.status == 404) {
          emit(RegisterError(res.message));
          ScaffoldMessenger.of(context)
              .showSnackBar(SnackBar(content: Text('${res.message}')));
        } else {
          emit(RegisterError(res.message));
          ScaffoldMessenger.of(context)
              .showSnackBar(SnackBar(content: Text('${res.message}')));
        }
      }
    } catch (e) {
      log('${e.toString()}');
      emit(RegisterError(e.toString()));
    }
  }
}
