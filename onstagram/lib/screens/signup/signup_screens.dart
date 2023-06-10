import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:onstagram/cubits/signup/signup_cubit.dart';
import 'package:onstagram/screens/home/home_screens.dart';

import 'package:onstagram/screens/login/login_screens.dart';

import '../../common/button_components.dart';
import '../../common/formfield_components.dart';
import '../../cubits/signup/signup_cubit_state.dart';
import '../../repositories/auth_repository.dart';

class SignUpScreens extends StatefulWidget {
  const SignUpScreens({super.key});

  @override
  State<SignUpScreens> createState() => _SignUpScreensState();
}

class _SignUpScreensState extends State<SignUpScreens> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: Container(
            decoration: const BoxDecoration(
              image: DecorationImage(
                  image:
                      AssetImage('assets/images/signup_background_image .png'),
                  fit: BoxFit.cover),
            ),
            child: ListView(
              children: [
                Column(
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
                    const SizedBox(
                      height: 47,
                    ),
                    const Text(
                      'Create an account',
                      style: TextStyle(fontSize: 34, color: Colors.white),
                    ),
                    const SizedBox(
                      height: 70,
                    ),
                    BlocProvider(
                      create: (context) =>
                          SignupCubit(context.read<AuthRepository>()),
                      child: Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 30),
                        child: BlocListener<SignupCubit, SignUpState>(
                          listener: (context, state) {
                            if (state.status == SignupStatus.error) {}
                            // TODO: implement listener
                          },
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.stretch,
                            children: [
                              BlocBuilder<SignupCubit, SignUpState>(
                                buildWhen: ((previous, current) =>
                                    previous.email != current.email),
                                builder: (context, state) {
                                  return FormFieldComponent(
                                    title: 'Email',
                                    hide: false,
                                    onChanged: (email) {
                                      context
                                          .read<SignupCubit>()
                                          .emailChanged(email);
                                    },
                                  );
                                },
                              ),
                              const SizedBox(
                                height: 10,
                              ),
                              BlocBuilder<SignupCubit, SignUpState>(
                                buildWhen: ((previous, current) =>
                                    previous.password != current.password),
                                builder: (context, state) {
                                  return FormFieldComponent(
                                    title: 'Password',
                                    hide: true,
                                    onChanged: (password) {
                                      context
                                          .read<SignupCubit>()
                                          .passwordChanged(password);
                                    },
                                  );
                                },
                              ),
                              const SizedBox(
                                height: 40,
                              ),
                              BlocBuilder<SignupCubit, SignUpState>(
                                buildWhen: (previous, current) =>
                                    previous.status != current.status,
                                builder: (context, state) {
                                  return state.status == SignupStatus.submitting
                                      ? Container(
                                          child: CircularProgressIndicator())
                                      : ButtonComponent(
                                          gradient:
                                              const LinearGradient(colors: [
                                            Color.fromRGBO(247, 131, 97, 1),
                                            Color.fromRGBO(245, 75, 100, 1),
                                          ]),
                                          title: 'SIGNUP',
                                          color: Colors.white,
                                          backgrounColor: Colors.white,
                                          press: () async {
                                            await context
                                                .read<SignupCubit>()
                                                .signUpWithCredential();
                                            Navigator.push(
                                                context,
                                                MaterialPageRoute(
                                                    builder: ((context) =>
                                                        HomeScreens())));
                                          },
                                        );
                                },
                              ),
                            ],
                          ),
                        ),
                      ),
                    ),
                    const SizedBox(
                      height: 144,
                    ),
                    const Text(
                      'By clicking Sign up you agree to the following',
                      style: TextStyle(
                          color: Color.fromRGBO(78, 88, 110, 1), fontSize: 13),
                    ),
                    const Text(
                      'Terms and Conditions without reservation',
                      style: TextStyle(
                          color: Color.fromRGBO(78, 88, 110, 1), fontSize: 13),
                    )
                  ],
                ),
              ],
            )));
  }
}
