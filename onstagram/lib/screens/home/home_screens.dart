import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:onstagram/blocs/app/bloc/app_bloc_bloc.dart';
import 'package:onstagram/repositories/auth_repository.dart';

class HomeScreens extends StatefulWidget {
  const HomeScreens({super.key});

  static Page page() => const MaterialPage<void>(child: HomeScreens());
  @override
  State<HomeScreens> createState() => _HomeScreensState();
}

class _HomeScreensState extends State<HomeScreens> {
  @override
  Widget build(BuildContext context) {
    final user = context.select((AppBloc bloc) => bloc.state.user);
    return Scaffold(
      appBar: AppBar(
        actions: [
          IconButton(
              onPressed: () {
                context.read<AppBloc>().add(AppLogoutRequest());
              },
              icon: Icon(Icons.logout))
        ],
      ),
    );
  }
}
