import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';

import 'package:onstagram/repositories/auth_repository.dart';

import 'login_cubit_state.dart';

class LoginCubit extends Cubit<LoginState> {
  final AuthRepository _authRepository;
  LoginCubit(
    this._authRepository,
  ) : super(LoginState.initial());

  emailChanged(String value) {
    emit(state.copyWith(email: value, status: LoginStatus.initial));
  }

  passwordChanged(String value) {
    emit(state.copyWith(password: value, status: LoginStatus.initial));
  }

  Future loginWithCredential() async {
    if (state.status == LoginStatus.submitting) {
      return;
    }
    emit(state.copyWith(status: LoginStatus.submitting));
    try {
      await _authRepository.login(email: state.email, password: state.password);
      emit(state.copyWith(status: LoginStatus.success));
    } catch (e) {
      throw e.toString();
    }
  }
}
