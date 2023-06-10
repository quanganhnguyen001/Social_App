import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';

import 'package:onstagram/models/user.dart';
import 'package:onstagram/repositories/auth_repository.dart';

import 'app_bloc_state.dart';

part 'app_bloc_event.dart';

class AppBloc extends Bloc<AppBlocEvent, AppBlocState> {
  AppBloc({required AuthRepository authenticationRepository})
      : _authenticationRepository = authenticationRepository,
        super(
          authenticationRepository.currentUser.isNotEmpty
              ? AppBlocState.authenticated(authenticationRepository.currentUser)
              : const AppBlocState.unauthenticated(),
        ) {
    on<AppUserChanged>(_onUserChanged);
    on<AppLogoutRequest>(_onLogoutRequested);
    _userSubscription = _authenticationRepository.user.listen(
      (user) => add(AppUserChanged(user)),
    );
  }

  final AuthRepository _authenticationRepository;
  late final StreamSubscription<UserModel> _userSubscription;

  void _onUserChanged(AppUserChanged event, Emitter<AppBlocState> emit) {
    emit(
      event.user.isNotEmpty
          ? AppBlocState.authenticated(event.user)
          : const AppBlocState.unauthenticated(),
    );
  }

  void _onLogoutRequested(AppLogoutRequest event, Emitter<AppBlocState> emit) {
    unawaited(_authenticationRepository.logOut());
  }

  @override
  Future<void> close() {
    _userSubscription.cancel();
    return super.close();
  }
}
