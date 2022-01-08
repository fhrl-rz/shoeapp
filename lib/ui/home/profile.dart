import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:shoeapp/cubit/profile/profile_cubit.dart';
import 'package:shoeapp/data_global.dart';
import 'package:shoeapp/ui/auth/SignIn.dart';


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
          BlocProvider(create: (context) => ProfileCubit()),
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
          body: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              DrawerHeader(
                child: Row(
                  children: [
                    CircleAvatar(
                      radius: 40,
                      child: Icon(Icons.person),
                    ),
                    // Image.asset('images/fhrl.png', height: 80, width: 80),
                    SizedBox(
                      width: 20,
                    ),
                    Text(
                      '${dataGlobal.user?.userNama}',
                      style: TextStyle(
                        color: Color(0xffE55B5B),
                        fontSize: 18,
                      ),
                    ),
                    // SizedBox(
                    //   width: 40,
                    // ),
                    // Image.asset('images/edit.png'),
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
                      context, MaterialPageRoute(builder: (context) => SignIn()));
                },
              ),
              Divider(),
            ],
          ),
        ),
      ),
    );
  }
}
