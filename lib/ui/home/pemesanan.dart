import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:intl/intl.dart';
import 'package:shoeapp/cubit/getkeranjang/getkeranjang_cubit.dart';
import 'package:shoeapp/cubit/getkeranjang/getkeranjang_state.dart';
import 'package:shoeapp/network/api.dart';
import 'package:shoeapp/res/res_get_keranjang.dart';
import 'package:shoeapp/ui/Paymet/pembayaran.dart';
import 'package:shoeapp/ui/home/profile/profile.dart';

class PemesananPage extends StatefulWidget {
  const PemesananPage({Key? key}) : super(key: key);

  @override
  _PemesananPageState createState() => _PemesananPageState();
}

class _PemesananPageState extends State<PemesananPage> {
  GetKeranjangCubit? cubit;
  @override
  Widget build(BuildContext context) {
    return Theme(
        data: ThemeData(fontFamily: "Poppins"),
        child: MultiBlocProvider(
          providers: [
            BlocProvider(create: (context) => GetKeranjangCubit()),
          ],
          child: Scaffold(
            appBar: AppBar(
              centerTitle: true,
              title: Text(
                "CheckOut",
                style: TextStyle(
                  fontWeight: FontWeight.bold,
                  color: Colors.black,
                ),
              ),
              backgroundColor: Colors.transparent,
              elevation: 0,
              leading: IconButton(
                  onPressed: () {
                    Navigator.pop(context);
                  },
                  icon: Image.asset("images/arrow_back.png")),
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
            body: Column(
              children: [
                BlocBuilder<GetKeranjangCubit, GetkeranjangState>(
                    builder: (context, state) {
                  cubit = context.read<GetKeranjangCubit>();
                  if (state is GetkeranjangInitial) {
                    cubit?.getDataKeranjang();
                  }
                  if (state is GetkeranjangLoading) {
                    return Center(
                      child: CircularProgressIndicator(
                        backgroundColor: Colors.cyanAccent,
                        valueColor:
                            new AlwaysStoppedAnimation<Color>(Colors.red),
                      ),
                    );
                  }
                  if (state is GetkeranjangSuccess) {
                    return ListView.builder(
                      scrollDirection: Axis.vertical,
                      shrinkWrap: true,
                      itemCount: cubit?.resGetKeranjang?.dataKeranjang?.length,
                      itemBuilder: (context, index) {
                        DataKeranjang? data =
                            cubit?.resGetKeranjang?.dataKeranjang?[index];
                        return Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: Container(
                            child: Column(
                              children: [
                                Row(
                                  children: [
                                    Container(
                                      height: 130,
                                      width: 120,
                                      decoration: BoxDecoration(
                                        borderRadius: BorderRadius.circular(20),
                                      ),
                                      child: CachedNetworkImage(
                                        imageUrl: imageUrl +
                                            "${data?.detailImg}",
                                        placeholder: (context, url) =>
                                        new CircularProgressIndicator(),
                                        errorWidget:
                                            (context, url, error) =>
                                        new Icon(Icons.error),
                                      ),
                                    ),
                                    Padding(
                                      padding: const EdgeInsets.all(8.0),
                                      child: Column(
                                        crossAxisAlignment:
                                            CrossAxisAlignment.start,
                                        children: [
                                          Text("${data?.detailOrder}"),
                                          Text("${data?.detailHarga}"),
                                          Row(
                                            children: [
                                              OutlinedButton(
                                                onPressed: () {},
                                                child:
                                                    Text('${data?.detailSize}'),
                                                style: OutlinedButton.styleFrom(
                                                  primary: Colors.black,
                                                  shape: CircleBorder(),
                                                  padding: EdgeInsets.all(10),
                                                ),
                                              ),
                                              SizedBox(
                                                width: 100,
                                              ),
                                              Image.asset(
                                                  "images/delete_outline.png"),
                                            ],
                                          ),
                                        ],
                                      ),
                                    ),
                                  ],
                                ),
                              ],
                            ),
                          ),
                        );
                      },
                    );
                  }
                  return Container();
                }),
                SizedBox(
                  height: 70,
                ),
                BlocBuilder<GetKeranjangCubit, GetkeranjangState>(
                    builder: (context, state) {
                  cubit = context.read<GetKeranjangCubit>();
                  if (state is GetkeranjangInitial) {
                    cubit?.getDataKeranjang();
                  }
                  if (state is GetkeranjangLoading) {
                    return Center(
                      child: CircularProgressIndicator(
                        backgroundColor: Colors.cyanAccent,
                        valueColor:
                            new AlwaysStoppedAnimation<Color>(Colors.red),
                      ),
                    );
                  }
                  if (state is GetkeranjangSuccess) {
                    return ListView.builder(
                      scrollDirection: Axis.vertical,
                      shrinkWrap: true,
                      itemCount: cubit?.resGetKeranjang?.dataKeranjang?.length,
                      itemBuilder: (context, index) {
                        DataKeranjang? data =
                            cubit?.resGetKeranjang?.dataKeranjang?[index];
                        return Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: Container(
                            child: Column(
                              children: [
                                Row(
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceAround,
                                  children: [
                                    Text(
                                      'Total :',
                                      style: TextStyle(
                                        fontSize: 16,
                                        fontWeight: FontWeight.bold,
                                      ),
                                    ),
                                    Text(
                                      '${NumberFormat.currency(
                                        locale: 'id',
                                        decimalDigits: 0,
                                      ).format(data?.detailTotal)}',
                                      style: TextStyle(
                                        fontSize: 16,
                                        fontWeight: FontWeight.bold,
                                      ),
                                    ),
                                  ],
                                ),
                                Row(
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceAround,
                                  children: [
                                    Text(
                                      'Shipping :       ',
                                      style: TextStyle(
                                        fontSize: 16,
                                        fontWeight: FontWeight.bold,
                                      ),
                                    ),
                                    Text(
                                      'Rp.0',
                                      style: TextStyle(
                                        fontSize: 16,
                                        fontWeight: FontWeight.bold,
                                      ),
                                    ),
                                  ],
                                ),
                                SizedBox(
                                  height: 5,
                                ),
                                Divider(
                                  color: Colors.black,
                                ),
                                Row(
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceAround,
                                  children: [
                                    Text(
                                      'Grand Total :',
                                      style: TextStyle(
                                        fontSize: 16,
                                        fontWeight: FontWeight.bold,
                                      ),
                                    ),
                                    Text(
                                      '${NumberFormat.currency(
                                        locale: 'id',
                                        decimalDigits: 0,
                                      ).format(data?.detailTotal)}',
                                      style: TextStyle(
                                        fontSize: 16,
                                        fontWeight: FontWeight.bold,
                                      ),
                                    ),
                                  ],
                                ),
                                SizedBox(height:260,),
                                Row(
                                  children: [
                                    Expanded(
                                      child: Container(
                                        margin:
                                            EdgeInsets.fromLTRB(10, 0, 10, 0),
                                        child: ClipRRect(
                                          borderRadius:
                                              BorderRadius.circular(15),
                                          child: MaterialButton(
                                            onPressed: () {
                                              Navigator.push(context, MaterialPageRoute(builder: (context) => PaymnetPage()));
                                            },
                                            padding: EdgeInsets.symmetric(
                                                vertical: 15),
                                            color: Color(0xffE96E6E),
                                            elevation: 0,
                                            child: Text(
                                              "Checkout",
                                              textAlign: TextAlign.center,
                                              style: TextStyle(
                                                color: Color(0xffFFFFFF),
                                                fontSize: 16,
                                                fontWeight: FontWeight.bold,
                                              ),
                                            ),
                                          ),
                                        ),
                                      ),
                                    ),
                                  ],
                                ),
                              ],
                            ),
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
        ));
  }
}
