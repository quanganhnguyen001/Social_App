import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'package:onstagram/common/button_components.dart';
import 'package:onstagram/cubits/login/login_cubit.dart';
import 'package:onstagram/screens/login/widget/forgot_password.dart';

import '../../common/formfield_components.dart';
import '../../cubits/login/login_cubit_state.dart';
import '../../cubits/signup/signup_cubit.dart';
import '../../repositories/auth_repository.dart';
import '../home/home_screens.dart';

class LoginScreens extends StatefulWidget {
  const LoginScreens({super.key});

  @override
  State<LoginScreens> createState() => _LoginScreensState();
}

class _LoginScreensState extends State<LoginScreens> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
          decoration: const BoxDecoration(
            image: DecorationImage(
                image: AssetImage('assets/images/login_background.png'),
                fit: BoxFit.cover),
          ),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              AppBar(
                backgroundColor: Colors.transparent,
                elevation: 0,
                leading: IconButton(
                  icon: const Icon(Icons.arrow_back_rounded),
                  onPressed: () {
                    Navigator.pop(context);
                  },
                ),
              ),
              BlocProvider(
                create: (context) => LoginCubit(context.read<AuthRepository>()),
                child: Padding(
                  padding: const EdgeInsets.only(left: 30, right: 30),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      const Text(
                        'Welcome back',
                        style: TextStyle(fontSize: 34, color: Colors.white),
                      ),
                      const SizedBox(
                        height: 12,
                      ),
                      const Text('Login to your account',
                          style: TextStyle(fontSize: 17, color: Colors.white)),
                      const SizedBox(
                        height: 58,
                      ),
                      BlocListener<LoginCubit, LoginState>(
                        listener: (context, state) {
                          if (state.status == LoginStatus.error) {}
                          // TODO: implement listener
                        },
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.stretch,
                          children: [
                            BlocBuilder<LoginCubit, LoginState>(
                              buildWhen: ((previous, current) =>
                                  previous.email != current.email),
                              builder: (context, state) {
                                return FormFieldComponent(
                                  title: 'Email',
                                  hide: false,
                                  onChanged: (email) {
                                    context
                                        .read<LoginCubit>()
                                        .emailChanged(email);
                                  },
                                );
                              },
                            ),
                            const SizedBox(
                              height: 10,
                            ),
                            BlocBuilder<LoginCubit, LoginState>(
                              buildWhen: ((previous, current) =>
                                  previous.password != current.password),
                              builder: (context, state) {
                                return FormFieldComponent(
                                  title: 'Password',
                                  hide: true,
                                  onChanged: (password) {
                                    context
                                        .read<LoginCubit>()
                                        .passwordChanged(password);
                                  },
                                );
                              },
                            ),
                            const SizedBox(
                              height: 40,
                            ),
                            BlocBuilder<LoginCubit, LoginState>(
                              buildWhen: (previous, current) =>
                                  previous.status != current.status,
                              builder: (context, state) {
                                return state.status == LoginStatus.submitting
                                    ? CircularProgressIndicator()
                                    : ButtonComponent(
                                        gradient: const LinearGradient(colors: [
                                          Color.fromRGBO(247, 131, 97, 1),
                                          Color.fromRGBO(245, 75, 100, 1),
                                        ]),
                                        title: 'LOGIN',
                                        color: Colors.white,
                                        backgrounColor: Colors.white,
                                        press: () async {
                                          await context
                                              .read<LoginCubit>()
                                              .loginWithCredential();
                                          Navigator.push(
                                              context,
                                              MaterialPageRoute(
                                                  builder: ((context) =>
                                                      HomeScreens())));
                                        },
                                      );
                              },
                            ),
                            const SizedBox(
                              height: 53,
                            ),
                            Center(
                              child: GestureDetector(
                                onTap: () {
                                  Navigator.push(
                                      context,
                                      MaterialPageRoute(
                                          builder: (context) =>
                                              const ForgotPassWord()));
                                },
                                child: const Text(
                                  'Forgot your password?',
                                  style: TextStyle(
                                      color: Colors.white, fontSize: 17),
                                ),
                              ),
                            )
                          ],
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ],
          )),
    );
  }
}
