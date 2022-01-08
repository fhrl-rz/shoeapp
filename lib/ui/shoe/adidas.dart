import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:shoeapp/cubit/adidas/adidas_cubit.dart';
import 'package:shoeapp/network/api.dart';
import 'package:shoeapp/res/res_get_adidas.dart';

class AdidasPage extends StatefulWidget {
  const AdidasPage({Key? key}) : super(key: key);

  @override
  _AdidasPageState createState() => _AdidasPageState();
}

class _AdidasPageState extends State<AdidasPage> {
  AdidasCubit? cubit;
  @override
  Widget build(BuildContext context) {
    return Theme(
      data: ThemeData( fontFamily:  "Poppins"),

      child: MultiBlocProvider(
        providers: [
          BlocProvider(create: (context) => AdidasCubit()),
        ],
        child: Scaffold(
          appBar: AppBar(
            backgroundColor: Colors.cyan,
            title: Text('Adidas'),
          ),
          body: SingleChildScrollView(
            child: Column(
              children: [
                BlocBuilder<AdidasCubit, AdidasState>(
                    builder: (context, state) {
                      cubit = context.read<AdidasCubit>();
                      if (state is AdidasInitial) {
                        cubit?.getDataAdidas();
                      }
                      if (state is AdidasLoading) {
                        return Center(
                          child: CircularProgressIndicator(
                            backgroundColor: Colors.cyanAccent,
                            valueColor:
                            new AlwaysStoppedAnimation<Color>(Colors.red),
                          ),
                        );
                      }
                      if (state is AdidasSucces) {
                        return GridView.builder(
                          scrollDirection: Axis.vertical,
                          shrinkWrap: true,
                          physics: NeverScrollableScrollPhysics(),
                          itemCount: cubit?.resGetAdidas?.dataProduct?.length,
                          gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                              childAspectRatio: 1 / 1.3, crossAxisCount: 2),
                          itemBuilder: (context, index) {
                            DataProduct? data =
                            cubit?.resGetAdidas?.dataProduct?[index];
                            return Container(
                              child: Column(
                                children: [
                                  Padding(
                                    padding: const EdgeInsets.all(8.0),
                                    child: Card(
                                      // borderOnForeground: true,
                                      elevation: 0,
                                      child: InkWell(
                                        onTap: () {},
                                        child: Column(
                                          children: [
                                            Image.network(
                                                imageUrl + "${data?.adidasGambar}"),
                                            Text(
                                              '${data?.adidasNama}',
                                              style: TextStyle(
                                                fontWeight: FontWeight.bold,
                                              ),
                                            ),
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
    );
  }
}
