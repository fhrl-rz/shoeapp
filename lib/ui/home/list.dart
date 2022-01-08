import 'dart:math';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:intl/intl.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:shoeapp/cubit/cart/insert_cart_cubit.dart';
import 'package:shoeapp/network/api.dart';
import 'package:shoeapp/res/res_get_produk.dart';
import 'package:shoeapp/ui/home/homepage.dart';
import 'package:shoeapp/ui/trendingnow/trendingnow.dart';

const chart = "ABCDEFGHIJKLMNOPQRSTUVWXYZ";
String? randomString(int? strlen) {
  Random rnd = Random(DateTime.now().millisecondsSinceEpoch);
  String result = "";
  for (int i = 0; i < strlen!; i++) {
    result += chart[rnd.nextInt(chart.length)];
  }
  return result;
}

class ListPage extends StatefulWidget {
  final DataProduct? data;
  ListPage(this.data);

  @override
  _ListPageState createState() => _ListPageState();
}

class _ListPageState extends State<ListPage> {
  List freshList = [
    {
      "nomor": "39",
    },
    {
      "nomor": "40",
    },
    {
      "nomor": "41",
    },
    {
      "nomor": "42",
    },
    {
      "nomor": "43",
    },
  ];

  String? select;

  int counter = 1;
  void minusItem() {
    if (counter == 1) {
      setState(() {
        counter;
      });
    } else {
      setState(() {
        counter--;
      });
    }
  }

  void addItem() {
    setState(() {
      counter++;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Theme(
      data: ThemeData(fontFamily: "Poppins"),
      child: MultiBlocProvider(
        providers: [
          BlocProvider<InsertCartCubit>(create: (context) => InsertCartCubit()),
        ],
        child: Scaffold(
          appBar: AppBar(
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
                      MaterialPageRoute(builder: (context) => HomePage()));
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
          body: SingleChildScrollView(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Container(
                  width: MediaQuery.of(context).size.width,
                  height: 360,
                  decoration: BoxDecoration(color: Colors.transparent),
                  child: Image.network(
                    imageUrl + '${widget.data?.produkGambar}',
                  ),
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  children: [
                    Text(
                      '${widget.data?.produkNama}',
                      style: TextStyle(
                        fontSize: 20,
                      ),
                    ),
                    Text(
                      '${NumberFormat.currency(
                        locale: 'id',
                        decimalDigits: 0,
                      ).format(widget.data?.produkHarga)}',
                      style: TextStyle(
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ],
                ),
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.end,
                    crossAxisAlignment: CrossAxisAlignment.end,
                    children: [
                      GestureDetector(
                          onTap: () {
                            Navigator.push(
                                context,
                                MaterialPageRoute(
                                    builder: (context) => TrendingNowPage()));
                          },
                          child: Row(
                            children: [
                              Text(
                                'Lainnya',
                                style: TextStyle(
                                  fontWeight: FontWeight.bold,
                                ),
                              ),
                              Icon(Icons.arrow_forward),
                            ],
                          )),
                    ],
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Row(
                        children: [
                          IconButton(
                            onPressed: () {
                              minusItem();
                            },
                            icon: Icon(Icons.minimize),
                          ),
                          Text(
                            '$counter',
                            style: TextStyle(
                              fontSize: 16,
                            ),
                          ),
                          IconButton(
                            onPressed: () {
                              addItem();
                            },
                            icon: Icon(Icons.add),
                          ),
                        ],
                      ),
                      Text(
                        'Size',
                        style: TextStyle(
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      Container(
                        height: 50,
                        child: ListView.builder(
                          scrollDirection: Axis.horizontal,
                          shrinkWrap: true,
                          itemCount: freshList.length,
                          itemBuilder: (context, index) {
                            return GestureDetector(
                              onTap: () {
                                setState(() {
                                  select = freshList[index]['nomor'];
                                });
                              },
                              child: Container(
                                alignment: Alignment.center,
                                height: 50,
                                width: 50,
                                margin: EdgeInsets.only(
                                  right: 10,
                                ),
                                decoration: BoxDecoration(
                                  border:
                                      Border.all(width: 1, color: Colors.cyan),
                                  shape: BoxShape.circle,
                                  color: select == freshList[index]['nomor']
                                      ? Colors.cyan
                                      : Colors.grey,
                                ),
                                child: Text(
                                  freshList[index]["nomor"],
                                  style: TextStyle(
                                    fontSize: 11,
                                  ),
                                ),
                              ),
                            );
                          },
                        ),
                      ),
                      SizedBox(
                        height: 20,
                      ),
                      Text(
                        'Colors',
                        style: TextStyle(
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceAround,
                        children: [
                          ElevatedButton(
                            onPressed: () {},
                            style: ElevatedButton.styleFrom(
                              primary: Color(0xff91A1B0),
                              shape: CircleBorder(),
                              padding: EdgeInsets.all(20),
                            ),
                            child: null,
                          ),
                          ElevatedButton(
                            onPressed: () {},
                            style: ElevatedButton.styleFrom(
                              primary: Color(0xffB11D1D),
                              shape: CircleBorder(),
                              padding: EdgeInsets.all(15),
                            ),
                            child: null,
                          ),
                          ElevatedButton(
                            onPressed: () {},
                            style: ElevatedButton.styleFrom(
                              primary: Color(0xff1F44A3),
                              shape: CircleBorder(),
                              padding: EdgeInsets.all(15),
                            ),
                            child: null,
                          ),
                          ElevatedButton(
                            onPressed: () {},
                            style: ElevatedButton.styleFrom(
                              primary: Color(0xff9F632A),
                              shape: CircleBorder(),
                              padding: EdgeInsets.all(15),
                            ),
                            child: null,
                          ),
                          ElevatedButton(
                            onPressed: () {},
                            style: ElevatedButton.styleFrom(
                              primary: Color(0xff1D752B),
                              shape: CircleBorder(),
                              padding: EdgeInsets.all(15),
                            ),
                            child: null,
                          ),
                        ],
                      ),
                    ],
                  ),
                ),
                SizedBox(height: 19),
                Row(
                  children: [
                    Expanded(
                      child: Container(
                        margin: EdgeInsets.fromLTRB(10, 0, 10, 0),
                        child: ClipRRect(
                          borderRadius: BorderRadius.circular(15),
                          child: BlocBuilder<InsertCartCubit, InsertCartState>(
                            builder: (context, state) {
                              InsertCartCubit cubit =
                                  context.read<InsertCartCubit>();
                              if (state is InsertCartLoading) {
                                return Center(
                                  child: CircularProgressIndicator(),
                                );
                              }
                              if (state is InsertCartError) {
                                print('${state.message}');
                              }
                              return MaterialButton(
                                onPressed: () async {
                                  SharedPreferences prefs =
                                      await SharedPreferences.getInstance();
                                  var _orderid = prefs.getString('idorder');
                                  if (_orderid != null) {
                                    await cubit.addItemKeranjang(
                                        context,
                                        _orderid,
                                        widget.data?.produkId.toString(),
                                        counter,
                                        select,
                                        widget.data?.produkHarga);
                                  } else {
                                    String? idOrder = randomString(9);
                                    prefs.setString('idorder', idOrder!);
                                    await cubit.addItemKeranjang(
                                        context,
                                        idOrder,
                                        widget.data?.produkId.toString(),
                                        counter,
                                        select,
                                        widget.data?.produkHarga);
                                  }
                                },
                                padding: EdgeInsets.symmetric(vertical: 15),
                                color: Color(0xffE96E6E),
                                elevation: 0,
                                child: Text(
                                  "Add to Cart",
                                  textAlign: TextAlign.center,
                                  style: TextStyle(
                                    color: Color(0xffFFFFFF),
                                    fontSize: 16,
                                    fontWeight: FontWeight.bold,
                                  ),
                                ),
                              );
                            },
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
