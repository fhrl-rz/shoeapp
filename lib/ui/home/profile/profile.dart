import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:image_picker/image_picker.dart';
import 'package:shoeapp/cubit/profile/profile_cubit.dart';
import 'package:shoeapp/cubit/update_profile/update_profile_cubit.dart';
import 'package:shoeapp/data_global.dart';
import 'package:shoeapp/network/api.dart';
import 'package:shoeapp/res/res_get_profile.dart';
import 'package:shoeapp/ui/auth/SignIn.dart';
import 'package:shoeapp/ui/home/profile/update_profile.dart';

class ProfilePage extends StatefulWidget {
  const ProfilePage({Key? key}) : super(key: key);

  @override
  _ProfilePageState createState() => _ProfilePageState();
}

class _ProfilePageState extends State<ProfilePage> {
  @override
  Widget build(BuildContext context) {
    return Theme(
      data: ThemeData(fontFamily: "Poppins"),
      child: MultiBlocProvider(
        providers: [
          BlocProvider<ProfileCubit>(create: (context) => ProfileCubit()),
          BlocProvider<UpdateProfileCubit>(create: (context) => UpdateProfileCubit()),
        ],
        child: Scaffold(
          backgroundColor: Color(0xffFDF0F3),
          appBar: AppBar(
            automaticallyImplyLeading: false,
            leading: IconButton(
                onPressed: () {
                  Navigator.pop(context);
                },
                icon: Image.asset("images/arrow_back.png")),
            backgroundColor: Colors.transparent,
            elevation: 0,
            title: Text('My Profile',
                style: TextStyle(
                  fontWeight: FontWeight.bold,
                  color: Colors.black,
                )),
            centerTitle: true,
          ),
          body: BlocBuilder<ProfileCubit, ProfileState>(builder: (context, state) {
            ProfileCubit cubitProfile = context.read<ProfileCubit>();
            if (state is ProfileInitial) {
              cubitProfile.getProfile(context);
            }
            if (state is ProfileLoading) {
              return Center(
                child: CircularProgressIndicator(),
              );
            }
            if (state is ProfileSuccess) {
              return ListView.builder(
                  itemCount: cubitProfile.resGetProfile?.profile?.length,
                  itemBuilder: (context, index) {
                    Profile? dataProfile =
                        cubitProfile.resGetProfile?.profile?[index];
                    log('${dataProfile?.toJson()}');
                    return Container(
                      child: Column(
                        children: [
                          DrawerHeader(
                            child: Row(
                              children: [
                                dataProfile?.userImage != ""
                                    ? Image.network(
                                        imageUrl +
                                            '${dataProfile!.userImage ?? ""}',
                                        width: 60,
                                        height: 60,
                                      )
                                    : CircleAvatar(
                                        radius: 30,
                                        child: Icon(
                                          Icons.person,
                                          size: 30,
                                        ),
                                      ),
                                SizedBox(
                                  width: 30,
                                ),
                                Text(
                                  '${dataProfile?.userNama}',
                                  style: TextStyle(
                                    color: Color(0xffE55B5B),
                                    fontSize: 16,
                                  ),
                                ),
                                SizedBox(
                                  width: 40,
                                ),
                                BlocBuilder<UpdateProfileCubit,
                                    UpdateProfileState>(
                                  builder: (context, state) {
                                    UpdateProfileCubit cubit =
                                        context.read<UpdateProfileCubit>();
                                    if (state is UpdateProfileLoading) {
                                      return Center(
                                        child: CircularProgressIndicator(),
                                      );
                                    }
                                    if (state is UpdateProfileError) {
                                      log('${state.message}');
                                    }
                                    return IconButton(
                                        onPressed: () {
                                          showDialog(
                                              context: context,
                                              builder: (context) {
                                                return UpdateProfile(
                                                    nama: cubitProfile
                                                        .resGetProfile
                                                        ?.profile?[0]
                                                        .userNama,
                                                    image: XFile(
                                                      cubitProfile
                                                              .resGetProfile
                                                              ?.profile?[0]
                                                              .userImage ??
                                                          "",
                                                    ),
                                                    onUpdate: (String? nama,
                                                        XFile?
                                                            image) async {
                                                      await cubit
                                                          .updateProfileUser(
                                                              context,
                                                              nama,
                                                              image)
                                                          .then((value) => {
                                                                {
                                                                  cubitProfile
                                                                      .getProfile(
                                                                          context)
                                                                }
                                                              });
                                                    });
                                              });
                                        },
                                        icon:
                                            Image.asset('images/edit.png'));
                                  },
                                ),
                              ],
                            ),
                          ),
                          ListTile(
                            trailing: Image.asset('images/Vector (9).png'),
                            title: const Text(
                              'Poin',
                            ),
                            onTap: () {
                              // Navigator.pop(context);
                            },
                          ),
                          Divider(),
                          ListTile(
                            trailing: Image.asset('images/Vector (9).png'),
                            title: const Text(
                              'Kartu',
                            ),
                            onTap: () {
                              // Navigator.pop(context);
                            },
                          ),
                          Divider(),
                          ListTile(
                            trailing: Image.asset('images/Vector (9).png'),
                            title: const Text(
                              'Pemesanan saya',
                            ),
                            onTap: () {
                              // Navigator.pop(context);
                            },
                          ),
                          Divider(),
                          ListTile(
                            trailing: Image.asset('images/Vector (9).png'),
                            title: const Text(
                              'Daftar Pembelian',
                            ),
                            onTap: () {
                              // Navigator.pop(context);
                            },
                          ),
                          Divider(),
                          ListTile(
                            title: const Text('Logout',
                                style: TextStyle(color: Color(0xffE55B5B))),
                            onTap: () {
                              Navigator.push(
                                  context,
                                  MaterialPageRoute(
                                      builder: (context) => SignIn()));
                            },
                          ),
                          Divider(),
                        ],
                      ),
                    );
                  });
            }
            return Container();
          }),
        ),
      ),
    );
  }
}
