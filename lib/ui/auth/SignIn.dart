import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:shoeapp/cubit/auth/login/login_cubit.dart';
import 'package:shoeapp/navbar/navbar.dart';
import 'package:shoeapp/ui/auth/SignUp.dart';

class SignIn extends StatefulWidget {
  const SignIn({Key? key}) : super(key: key);

  @override
  _SignInState createState() => _SignInState();
}

class _SignInState extends State<SignIn> {
  final _formKey = GlobalKey<FormState>();

  final TextEditingController email = new TextEditingController();
  final TextEditingController password = new TextEditingController();
  bool isHiddenPassword = true;
  @override
  Widget build(BuildContext context) {
    return Theme(
      data: ThemeData(fontFamily: "Poppins"),
      child: MultiBlocProvider(
        providers: [
          BlocProvider(create: (context) => LoginCubit()),
        ],
        //bloc provider itu  yang membungkus suatu widget kemudian akan dipanggil
        // suatu kelas and kelas itu disebut dengan cubit
        //
        child: Scaffold(
          backgroundColor: Color(0xffFDF0F3),
          body: Center(
            child: SingleChildScrollView(
              child: Padding(
                padding: const EdgeInsets.all(10.0),
                child: Form(
                  key: _formKey,
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      Image.asset('images/bg1.png'),
                      SizedBox(
                        height: 30,
                      ),
                      Center(
                        child: Container(
                          child: Text(
                            "Sign In",
                            style: TextStyle(
                              fontSize: 30,
                              color: Color(0xff000000),
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                        ),
                      ),
                      SizedBox(
                        height: 50,
                      ),
                      Container(
                        child: TextFormField(
                          autofocus: false,
                          controller: email,
                          keyboardType: TextInputType.emailAddress,
                          validator: (value) {
                            if (value!.isEmpty) {
                              return ("Please Enter Your Email");
                            }

                            //req expression for email  validation
                            if (!RegExp(
                                    "^[a-zA-Z0-9+_.-]+@[a-zA-Z0-9.-]+.[a-z]")
                                .hasMatch(value)) {
                              return ("Please Enter a valid email");
                            }
                            return null;
                          },
                          onSaved: (value) {
                            email.text = value!;
                          },
                          textInputAction: TextInputAction.next,
                          style: TextStyle(
                            fontSize: 16,
                          ),
                          decoration: InputDecoration(
                            border: OutlineInputBorder(
                              borderRadius:
                                  BorderRadius.all(Radius.circular(8.0)),
                            ),
                            labelText: "Email",
                            labelStyle: TextStyle(
                              fontWeight: FontWeight.bold,
                            ),
                            prefixIcon: Icon(Icons.email),
                          ),
                        ),
                      ),
                      SizedBox(
                        height: 20,
                      ),
                      Container(
                        child: TextFormField(
                          controller: password,
                          obscureText: isHiddenPassword,
                          keyboardType: TextInputType.number,
                          validator: (value) {
                            RegExp regex = new RegExp(r'^.{6,}$'); //b
                            if (value!.isEmpty) {
                              return ("Password is required for login");
                            }
                            if (!regex.hasMatch(value)) {
                              return ("Enter Valid Password (Min.6Character)");
                            }
                          },
                          onSaved: (value) {
                            password.text = value!;
                          },
                          style: TextStyle(
                            fontSize: 16,
                          ),
                          decoration: InputDecoration(
                            border: OutlineInputBorder(
                              borderRadius:
                                  BorderRadius.all(Radius.circular(8.0)),
                            ),
                            suffixIcon: InkWell(
                              onTap: _togglePasswordView,
                              child: Icon(Icons.visibility),
                            ),
                            hintText: " Password ",
                            hintStyle: TextStyle(
                              fontWeight: FontWeight.bold,
                            ),
                            prefixIcon: Icon(
                              Icons.lock,
                            ),
                          ),
                        ),
                      ),
                      SizedBox(
                        height: 60,
                      ),
                      Row(
                        children: [
                          Expanded(
                            child: Container(
                              margin: EdgeInsets.fromLTRB(10, 0, 10, 0),
                              child: ClipRRect(
                                borderRadius: BorderRadius.circular(15),
                                child: BlocBuilder<LoginCubit, LoginState>(
                                  builder: (context, state) {
                                    LoginCubit cubit =
                                        context.read<LoginCubit>();
                                    if (state is LoginLoading) {
                                      return Center(
                                        child: CircularProgressIndicator(),
                                      );
                                    }
                                    if (state is LoginError) {
                                      log('${state.message}');
                                    }
                                    return MaterialButton(
                                      onPressed: () async {
                                        if (_formKey.currentState!
                                            .validate()) {
                                          await cubit.loginAccount(
                                              context,
                                              email.text,
                                              password.text);
                                        }
                                      },
                                      padding:
                                          EdgeInsets.symmetric(vertical: 15),
                                      color: Color(0xffE96E6E),
                                      elevation: 0,
                                      child: Text(
                                        "Sign In",
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
                      SizedBox(
                        height: 100,
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: <Widget>[
                          Text("Don't have an account?"),
                          GestureDetector(
                            onTap: () {
                              Navigator.push(
                                  context,
                                  MaterialPageRoute(
                                      builder: (context) => SignUp()));
                            },
                            child: Text(
                              "SignUp",
                              style: TextStyle(
                                color: Color(0xff52B69A),
                                fontSize: 15,
                                fontWeight: FontWeight.bold,
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
          ),
        ),
      ),
    );
  }

  void _togglePasswordView() {
    setState(() {
      isHiddenPassword = !isHiddenPassword;
    });
  }
}
