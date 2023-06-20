import 'package:firebase_core/firebase_core.dart';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:onstagram/config/route.dart';
import 'package:onstagram/features/presentation/auth/cubit/auth/auth_cubit.dart';
import 'package:onstagram/features/presentation/auth/cubit/credential/credential_cubit.dart';

import 'package:onstagram/features/presentation/auth/page/sign_in.dart';

import 'package:onstagram/features/presentation/main_screens.dart';
import 'features/presentation/user/get_single_user/get_single_user_cubit.dart';
import 'features/presentation/user/user_cubit.dart';
import 'injection_container.dart' as di;

Future main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  await di.init();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider(
            create: ((context) => di.getIt<AuthCubit>()..appStarted())),
        BlocProvider(create: ((context) => di.getIt<CredentialCubit>())),
        BlocProvider(create: ((context) => di.getIt<UserCubit>())),
        BlocProvider(create: ((context) => di.getIt<GetSingleUserCubit>())),
      ],
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        darkTheme: ThemeData.dark(),
        onGenerateRoute: OnGenerateRoute.route,
        initialRoute: '/',
        routes: {
          '/': ((context) => BlocBuilder<AuthCubit, AuthState>(
                builder: (context, authState) {
                  if (authState is Authenticated) {
                    return MainScreens(
                      uid: authState.uid,
                    );
                  } else {
                    return const SignInPage();
                  }
                },
              ))
        },
      ),
    );
  }
}
