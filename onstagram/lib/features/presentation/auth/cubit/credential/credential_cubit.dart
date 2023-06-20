import 'dart:io';

import 'package:equatable/equatable.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:onstagram/features/domain/user/entities/user_entity.dart';

import 'package:onstagram/features/domain/user/usecases/sign_in_usecases.dart';
import 'package:onstagram/features/domain/user/usecases/sign_up_usecases.dart';

part 'credential_state.dart';

class CredentialCubit extends Cubit<CredentialState> {
  final SignInUseCase signInUseCase;
  final SignUpUseCase signUpUseCase;
  CredentialCubit({required this.signInUseCase, required this.signUpUseCase})
      : super(CredentialInitial());

  Future signIn({required String email, required String password}) async {
    emit(CredentialLoading());
    try {
      await signInUseCase.excute(UserEntity(email: email, password: password));
      emit(CredentialSuccess());
    } on SocketException {
      emit(CredentialFailure());
    } catch (e) {
      emit(CredentialFailure());
    }
  }

  Future signUp(UserEntity user) async {
    emit(CredentialLoading());
    try {
      await signUpUseCase.excute(user);
      emit(CredentialSuccess());
    } on SocketException {
      // avoid crash app
      emit(CredentialFailure());
    } catch (e) {
      emit(CredentialFailure());
    }
  }
}
