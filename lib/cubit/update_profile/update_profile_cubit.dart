import 'package:bloc/bloc.dart';
import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import 'package:meta/meta.dart';
import 'package:shoeapp/repo/repo_auth.dart';
import 'package:shoeapp/res/res_update_profile.dart';

part 'update_profile_state.dart';

class UpdateProfileCubit extends Cubit<UpdateProfileState> {
  UpdateProfileCubit() : super(UpdateProfileInitial());

  RepoAuth repo = RepoAuth();
  ResUpdateProfile? resUpdateProfile;

  Future<void> updateProfileUser(
      BuildContext context,
      String? nama,
      XFile? image,
      ) async {
    try {
      emit(UpdateProfileLoading());
      ResUpdateProfile? res = await repo.updateProfile(nama, image);
      // ignore: unnecessary_null_comparison
      if (repo != null) {
        resUpdateProfile = res;
        emit(UpdateProfileSuccess(resUpdateProfile));
      } else {
        ScaffoldMessenger.of(context)
            .showSnackBar(SnackBar(content: Text('${res?.message}')));
      }
    } catch (e) {
      ScaffoldMessenger.of(context)
          .showSnackBar(SnackBar(content: Text('${e.toString()}')));
      emit(UpdateProfileError(e.toString()));
    }
  }
}
