import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:shoeapp/cubit/produk/produk_cubit.dart';
import 'package:shoeapp/network/api.dart';
import 'package:shoeapp/res/res_get_produk.dart';
import 'package:shoeapp/ui/home/drawer.dart';
import 'package:shoeapp/ui/home/list.dart';
import 'package:shoeapp/ui/home/profile/profile.dart';
import 'package:shoeapp/ui/trendingnow/trendingnow.dart';

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  ProdukCubit? cubit;

  @override
  Widget build(BuildContext context) {
    return Theme(
      data: ThemeData(fontFamily: "Poppins"),
      child: MultiBlocProvider(
        providers: [
          BlocProvider(create: (context) => ProdukCubit()),
        ],
        child: Scaffold(
          backgroundColor: Color(0xffFDF0F3),
          appBar: AppBar(
            backgroundColor: Colors.transparent,
            elevation: 0,
            leading: Builder(builder: (context) {
              return IconButton(
                onPressed: () => Scaffold.of(context).openDrawer(),
                icon: Image.asset("images/drawer.png"),
              );
            }),
            actions: <Widget>[
              IconButton(
                onPressed: () {
                  Navigator.push(context,
                      MaterialPageRoute(builder: (context) => ProfilePage()));
                },
                icon: Container(
                  child: CircleAvatar(
                    radius: 20,
                    child: Image.asset("images/fhrl.png"),
                  ),
                ),
              ),
            ],
          ),
          drawer: DrawerPage(),
          body: SafeArea(
            child: SingleChildScrollView(
              child: Padding(
                padding: const EdgeInsets.all(8.0),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.start,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      'Match Yout Style',
                      style: TextStyle(fontSize: 24),
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceAround,
                      children: [
                        ElevatedButton(
                          onPressed: () {},
                          child: Text('Trending Now'),
                          style: ElevatedButton.styleFrom(
                              primary: Colors.red,
                              onPrimary: Colors.white,
                              shape: StadiumBorder()),
                        ),
                        ElevatedButton(
                          onPressed: () {},
                          child: Text(' All'),
                          style: ElevatedButton.styleFrom(
                              primary: Colors.grey,
                              onPrimary: Colors.white,
                              shape: StadiumBorder()),
                        ),
                        ElevatedButton(
                          onPressed: () {},
                          child: Text('New'),
                          style: ElevatedButton.styleFrom(
                              primary: Colors.grey,
                              onPrimary: Colors.white,
                              shape: StadiumBorder()),
                        ),
                      ],
                    ),
                    SizedBox(
                      height: 30,
                    ),
                    BlocBuilder<ProdukCubit, ProdukState>(
                        builder: (context, state) {
                      cubit = context.read<ProdukCubit>();
                      if (state is ProdukInitial) {
                        cubit?.getDataProduk();
                      }
                      if (state is ProdukLoading) {
                        return Center(
                          child: CircularProgressIndicator(
                            backgroundColor: Colors.cyanAccent,
                            valueColor:
                                new AlwaysStoppedAnimation<Color>(Colors.red),
                          ),
                        );
                      }
                      if (state is ProdukSuccess) {
                        return GridView.builder(
                          scrollDirection: Axis.vertical,
                          shrinkWrap: true,
                          physics: NeverScrollableScrollPhysics(),
                          itemCount: cubit?.resGetProduk?.dataProduct?.length,
                          gridDelegate:
                              SliverGridDelegateWithFixedCrossAxisCount(
                                  childAspectRatio: 1 / 1.2, crossAxisCount: 2),
                          itemBuilder: (context, index) {
                            DataProduct? data =
                                cubit?.resGetProduk?.dataProduct?[index];
                            return Container(
                              child: Column(
                                children: [
                                  Padding(
                                    padding: const EdgeInsets.all(8.0),
                                    child: Card(
                                      // borderOnForeground: true,
                                      elevation: 0,
                                      child: InkWell(
                                        onTap: () {
                                          Navigator.push(
                                              context,
                                              MaterialPageRoute(
                                                  builder: (context) =>
                                                      ListPage(data)));
                                        },
                                        child: Column(
                                          children: [
                                            CachedNetworkImage(
                                              imageUrl: imageUrl +
                                                  "${data?.produkGambar}",
                                              placeholder: (context, url) =>
                                                  new CircularProgressIndicator(),
                                              errorWidget:
                                                  (context, url, error) =>
                                                      new Icon(Icons.error),
                                            ),
                                            Text('${data?.produkNama}'),
                                          ],
                                        ),
                                      ),
                                      shape: RoundedRectangleBorder(
                                        borderRadius: BorderRadius.circular(20),
                                      ),
                                    ),
                                  ),
                                ],
                              ),
                            );
                          },
                        );
                      }
                      return Container();
                    }),
                  ],
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }
}
