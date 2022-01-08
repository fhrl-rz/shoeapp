import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:shoeapp/cubit/profile/profile_cubit.dart';
import 'package:shoeapp/data_global.dart';
import 'package:shoeapp/ui/Paymet/history.dart';
import 'package:shoeapp/ui/home/listorder.dart';
import 'package:shoeapp/ui/home/pemesanan.dart';
import 'package:shoeapp/ui/home/profile.dart';

class DrawerPage extends StatelessWidget {
  const DrawerPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Theme(
      data: ThemeData(fontFamily: "Poppins"),
      child: MultiBlocProvider(
        providers: [
          BlocProvider(create: (context) => ProfileCubit()),
        ],
        child: Drawer(
          child: ListView(
            padding: EdgeInsets.zero,
            children: [
              DrawerHeader(
                decoration: BoxDecoration(
                  color: Color(0xffE96E6E),
                ),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    CircleAvatar(
                      radius: 40,
                      child: Icon(Icons.person),
                    ),
                    Text(
                      '${dataGlobal.user?.userNama}',
                      style: TextStyle(
                        color: Colors.white,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ],
                ),
              ),
              ListTile(
                trailing: Image.asset('images/Vector (9).png'),
                title: const Text(
                  'Home',
                  style: TextStyle(
                    fontWeight: FontWeight.bold,
                  ),
                ),
                onTap: () {
                  Navigator.pop(context);
                },
              ),
              Divider(),
              ListTile(
                trailing: Image.asset('images/Vector (9).png'),
                title: const Text(
                  'List',
                  style: TextStyle(
                    fontWeight: FontWeight.bold,
                  ),
                ),
                onTap: () {
                  Navigator.push(context,
                      MaterialPageRoute(builder: (context) => ListOrderPage()));
                },
              ),
              Divider(),
              ListTile(
                trailing: Image.asset('images/Vector (9).png'),
                title: const Text(
                  'Pemesanan saya',
                  style: TextStyle(
                    fontWeight: FontWeight.bold,
                  ),
                ),
                onTap: () {
                  Navigator.push(context,
                      MaterialPageRoute(builder: (context) => PemesananPage()));
                },
              ),
              Divider(),
              ListTile(
                trailing: Image.asset('images/Vector (9).png'),
                title: const Text(
                  'Profile',
                  style: TextStyle(
                    fontWeight: FontWeight.bold,
                  ),
                ),
                onTap: () {
                  Navigator.push(context,
                      MaterialPageRoute(builder: (context) => ProfilePage()));
                },
              ),
              Divider(),
              ListTile(
                trailing: Image.asset('images/Vector (9).png'),
                title: const Text(
                  'History',
                  style: TextStyle(
                    fontWeight: FontWeight.bold,
                  ),
                ),
                onTap: () {
                  Navigator.push(context,
                      MaterialPageRoute(builder: (context) => HistoryPage()));
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
