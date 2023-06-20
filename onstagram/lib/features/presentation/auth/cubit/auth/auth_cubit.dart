import 'package:equatable/equatable.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'package:onstagram/features/domain/user/usecases/get_current_uid_usecases.dart';
import 'package:onstagram/features/domain/user/usecases/is_sign_in_usecases.dart';
import 'package:onstagram/features/domain/user/usecases/sign_out_usecase.dart';

part 'auth_state.dart';

class AuthCubit extends Cubit<AuthState> {
  final SignOutUseCase signOutUseCase;
  final IsSignInUseCase isSignInUseCase;
  final GetCurrentUidUseCase getCurrentUidUseCase;

  AuthCubit(
      {required this.signOutUseCase,
      required this.isSignInUseCase,
      required this.getCurrentUidUseCase})
      : super(AuthInitial());

  Future appStarted() async {
    try {
      bool isSignIn = await isSignInUseCase.excute();
      if (isSignIn == true) {
        final uid = await getCurrentUidUseCase.excute();
        emit(Authenticated(uid: uid));
      } else {
        emit(UnAuthenticated());
      }
    } catch (e) {
      emit(UnAuthenticated());
    }
  }

  Future loggedIn() async {
    try {
      final uid = await getCurrentUidUseCase.excute();
      emit(Authenticated(uid: uid));
    } catch (e) {
      emit(UnAuthenticated());
    }
  }

  Future loggedOut() async {
    try {
      await signOutUseCase.excute();
      emit(UnAuthenticated());
    } catch (e) {
      emit(UnAuthenticated());
    }
  }
}
