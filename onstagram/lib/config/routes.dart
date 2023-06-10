import 'package:flutter/material.dart';
import 'package:onstagram/screens/home/home_screens.dart';
import 'package:onstagram/screens/welcome/welcome_screens.dart';

import '../blocs/app/bloc/app_bloc_state.dart';

List<Page> onGenerateAppViewPages(AppStatus status, List<Page<dynamic>> pages) {
  switch (status) {
    case AppStatus.authenticated:
      return [HomeScreens.page()];
    case AppStatus.unauthenticated:
      return [WelcomeScreens.page()];
  }
}
