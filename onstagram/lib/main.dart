import 'package:firebase_core/firebase_core.dart';
import 'package:flow_builder/flow_builder.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:onstagram/blocs/app/bloc/app_bloc_bloc.dart';
import 'package:onstagram/config/routes.dart';
import 'package:onstagram/repositories/auth_repository.dart';

import 'bloc_observer.dart';
import 'screens/welcome/welcome_screens.dart';

Future main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  Bloc.observer = AppObersever();
  final authRepository = AuthRepository();
  runApp(MyApp(
    authRepository: authRepository,
  ));
}

class MyApp extends StatelessWidget {
  final AuthRepository _authRepository;
  const MyApp({super.key, required AuthRepository authRepository})
      : _authRepository = authRepository;

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return RepositoryProvider.value(
      value: _authRepository,
      child: BlocProvider(
        create: (_) => AppBloc(authenticationRepository: _authRepository),
        child: AppView(),
      ),
    );
  }
}

class AppView extends StatelessWidget {
  const AppView({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: FlowBuilder(
        onGeneratePages: onGenerateAppViewPages,
        state: context.select((AppBloc bloc) => bloc.state.status),
      ),
    );
  }
}
