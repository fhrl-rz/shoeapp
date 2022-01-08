import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:shoeapp/cubit/nike/nike_cubit.dart';
import 'package:shoeapp/network/api.dart';
import 'package:shoeapp/res/res_get_nike.dart';

class NikePage extends StatefulWidget {
  const NikePage({Key? key}) : super(key: key);

  @override
  _NikePageState createState() => _NikePageState();
}

class _NikePageState extends State<NikePage> {
  NikeCubit? cubit;
  @override
  Widget build(BuildContext context) {
    return Theme(
      data: ThemeData(fontFamily: "Poppins"),
      child: MultiBlocProvider(
        providers: [
          BlocProvider(create: (context) => NikeCubit()),
        ],
        child: Scaffold(
          appBar: AppBar(
            backgroundColor: Colors.cyan,
            title: Text('Nike'),
          ),
          body: SingleChildScrollView(
            child: Column(
              children: [
                BlocBuilder<NikeCubit, NikeState>(
                    builder: (context, state) {
                      cubit = context.read<NikeCubit>();
                      if (state is NikeInitial) {
                        cubit?.getDataNike();
                      }
                      if (state is NikeLoading) {
                        return Center(
                          child: CircularProgressIndicator(
                            backgroundColor: Colors.cyanAccent,
                            valueColor:
                            new AlwaysStoppedAnimation<Color>(Colors.red),
                          ),
                        );
                      }
                      if (state is NikeSuccess) {
                        return GridView.builder(
                          scrollDirection: Axis.vertical,
                          shrinkWrap: true,
                          physics: NeverScrollableScrollPhysics(),
                          itemCount: cubit?.resGetNike?.dataProduct?.length,
                          gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                              childAspectRatio: 1 / 1.3, crossAxisCount: 2),
                          itemBuilder: (context, index) {
                            DataProduct? data =
                            cubit?.resGetNike?.dataProduct?[index];
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
                                                imageUrl + "${data?.nikeGambar}"),
                                            Text(
                                              '${data?.nikeNama}',
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
