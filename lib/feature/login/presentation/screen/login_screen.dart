import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:todo_task/feature/home/presentation/screen/home_screen.dart';
import 'package:todo_task/feature/login/presentation/cubit/cubit.dart';
import 'package:todo_task/feature/login/presentation/cubit/states.dart';
import 'package:todo_task/feature/login/presentation/widget/show_loader_dialog.dart';

class LoginScreen extends StatelessWidget {
  static const String routeName = 'loginScreen';
  var userName = TextEditingController();
  var password = TextEditingController();
  var formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    var size = MediaQuery.of(context).size;
    return BlocProvider(
        create: (context) => LoginCubit(),
        child: BlocConsumer<LoginCubit, LoginStates>(
          listener: (context, state) {
            if (state is SuccessfulLoginState) {
              Navigator.of(context).pushReplacementNamed(HomeScreen.routeName);
            }
          },
          builder: (context, state) {
            return Scaffold(
              body: Column(
                children: [
                  const Spacer(flex: 1),
                  Image.asset(
                    'assets/images/Logo.png',
                    width: size.width * .295,
                    height: size.height * .190,
                  ),
                  const Spacer(flex: 1),
                  Container(
                    margin: const EdgeInsets.symmetric(horizontal: 35),
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(20),
                      border: Border.all(color: Colors.grey),
                    ),
                    child: Form(
                      key: formKey,
                      child: Column(
                        children: [
                          TextFormField(
                            validator: (value) {
                              if (value!.isEmpty) {
                                return 'Please entre user name';
                              }
                              return null;
                            },
                            controller: userName,
                            keyboardType: TextInputType.text,
                            decoration: const InputDecoration(
                              prefixIcon: Icon(Icons.person),
                              hintText: 'Username',
                              border: InputBorder.none,
                            ),
                          ),
                          const Divider(
                              thickness: 1,
                              height: 20,
                              endIndent: 10,
                              indent: 10),
                          TextFormField(
                            validator: (value) {
                              if (value!.isEmpty) {
                                return 'Please entre password';
                              }
                              return null;
                            },
                            controller: password,
                            keyboardType: TextInputType.text,
                            obscureText: true,
                            decoration: const InputDecoration(
                              prefixIcon: Icon(Icons.lock),
                              hintText: 'Password',
                              border: InputBorder.none,
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                  const SizedBox(
                    height: 20,
                  ),
                  ElevatedButton(
                    onPressed: () {
                      if (formKey.currentState!.validate()) {
                        ShowLoaderDialog.loadDialog(context);
                        LoginCubit.get(context)
                            .login(userName.text, password.text);
                      }
                    },
                    style: ElevatedButton.styleFrom(
                      backgroundColor: const Color(0xff6035D0),
                      padding: const EdgeInsets.symmetric(horizontal: 95),
                    ),
                    child: const Padding(
                      padding:
                          EdgeInsets.symmetric(horizontal: 30, vertical: 15),
                      child: Text(
                        'LOGIN',
                        style: TextStyle(
                          fontSize: 22,
                          fontWeight: FontWeight.w400,
                        ),
                      ),
                    ),
                  ),
                  const Spacer(flex: 1),
                  Row(
                    children: const [
                      Expanded(
                        child: Divider(
                          thickness: 1,
                          height: 20,
                          indent: 40,
                        ),
                      ),
                      Padding(
                        padding: EdgeInsets.all(8.0),
                        child: Text(
                          'OR',
                          style: TextStyle(
                              fontSize: 20, fontWeight: FontWeight.w100),
                        ),
                      ),
                      Expanded(
                        child: Divider(
                          thickness: 1,
                          height: 20,
                          endIndent: 40,
                        ),
                      ),
                    ],
                  ),
                  const Text(
                    'login using social media',
                    style: TextStyle(
                      color: Colors.grey,
                      fontWeight: FontWeight.w300,
                      fontSize: 18,
                    ),
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: [
                      Image.asset(
                        'assets/images/facebook.png',
                        width: size.width * .144,
                        height: size.height * .144,
                      ),
                      Image.asset(
                        'assets/images/twitter.png',
                        width: size.width * .144,
                        height: size.height * .144,
                      ),
                      Image.asset(
                        'assets/images/google.png',
                        width: size.width * .144,
                        height: size.height * .144,
                      ),
                    ],
                  ),
                  const Spacer(flex: 1),
                ],
              ),
            );
          },
        ));
  }
}
