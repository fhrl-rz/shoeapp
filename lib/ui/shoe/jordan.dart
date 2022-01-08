import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:shoeapp/cubit/jordan/jordan_cubit.dart';
import 'package:shoeapp/network/api.dart';
import 'package:shoeapp/res/res_get_jordan.dart';

class JordanPage extends StatefulWidget {
  const JordanPage({Key? key}) : super(key: key);

  @override
  _JordanPageState createState() => _JordanPageState();
}

class _JordanPageState extends State<JordanPage> {
  JordanCubit? cubit;
  @override
  Widget build(BuildContext context) {
    return Theme(
      data: ThemeData(fontFamily: "Poppins"),
      child: MultiBlocProvider(
        providers: [
          BlocProvider(create: (context) => JordanCubit()),
        ],
        child: Scaffold(
          appBar: AppBar(
            backgroundColor: Colors.cyan,
            title: Text('Jordan'),
          ),
          body: SingleChildScrollView(
            child: Column(
              children: [
                BlocBuilder<JordanCubit, JordanState>(
                    builder: (context, state) {
                  cubit = context.read<JordanCubit>();
                  if (state is JordanInitial) {
                    cubit?.getDataJordan();
                  }
                  if (state is JordanLoading) {
                    return Center(
                      child: CircularProgressIndicator(
                        backgroundColor: Colors.cyanAccent,
                        valueColor:
                            new AlwaysStoppedAnimation<Color>(Colors.red),
                      ),
                    );
                  }
                  if (state is JordanSuccess) {
                    return GridView.builder(
                      scrollDirection: Axis.vertical,
                      shrinkWrap: true,
                      physics: NeverScrollableScrollPhysics(),
                      itemCount: cubit?.resGetJordan?.dataProduct?.length,
                      gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                          childAspectRatio: 1 / 1.3, crossAxisCount: 2),
                      itemBuilder: (context, index) {
                        DataProduct? data =
                            cubit?.resGetJordan?.dataProduct?[index];
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
                                            imageUrl + "${data?.jordanGambar}"),
                                        Text(
                                          '${data?.jordanNama}',
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
