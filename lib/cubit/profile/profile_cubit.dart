import 'package:bloc/bloc.dart';
import 'package:flutter/material.dart';
import 'package:meta/meta.dart';
import 'package:shoeapp/repo/repo_auth.dart';
import 'package:shoeapp/res/res_get_profile.dart';

part 'profile_state.dart';

class ProfileCubit extends Cubit<ProfileState> {
  ProfileCubit() : super(ProfileInitial());


  RepoAuth repo = RepoAuth();
  ResGesProfile? resGetProfile;

  Future<void> getProfile(
      BuildContext context,
      ) async {
    try {
      emit(ProfileLoading());
      ResGesProfile? res = await repo.getProfile();
      if (res != null) {
        resGetProfile = res;
        emit(ProfileSuccess(resGetProfile));
      } else {
        ScaffoldMessenger.of(context)
            .showSnackBar(SnackBar(content: Text('${res?.message}')));
        emit(ProfileError(res?.message));
      }
    } catch (e) {
      ScaffoldMessenger.of(context)
          .showSnackBar(SnackBar(content: Text('${e.toString()}')));
      emit(ProfileError(e.toString()));
    }
  }
}
