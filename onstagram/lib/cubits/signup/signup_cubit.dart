import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';

import 'package:onstagram/repositories/auth_repository.dart';

import 'signup_cubit_state.dart';

class SignupCubit extends Cubit<SignUpState> {
  final AuthRepository _authRepository;
  SignupCubit(
    this._authRepository,
  ) : super(SignUpState.initial());

  emailChanged(String value) {
    emit(state.copyWith(email: value, status: SignupStatus.initial));
  }

  passwordChanged(String value) {
    emit(state.copyWith(password: value, status: SignupStatus.initial));
  }

  Future signUpWithCredential() async {
    if (state.status == SignupStatus.submitting) {
      return;
    }
    emit(state.copyWith(status: SignupStatus.submitting));
    try {
      await _authRepository.signup(
          email: state.email, password: state.password);
      emit(state.copyWith(status: SignupStatus.success));
    } catch (e) {
      throw e.toString();
    }
  }
}
