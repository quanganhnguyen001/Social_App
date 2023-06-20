import 'dart:io';

import 'package:equatable/equatable.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'package:onstagram/features/domain/user/usecases/get_all_user_usecases.dart';
import 'package:onstagram/features/domain/user/usecases/update_user_usecases.dart';

import '../../domain/user/entities/user_entity.dart';

part 'user_state.dart';

class UserCubit extends Cubit<UserState> {
  final UpdateUserUseCase updateUserUseCase;
  final GetAllUserUseCase getAllUserUseCase;

  UserCubit({
    required this.updateUserUseCase,
    required this.getAllUserUseCase,
  }) : super(UserInitial());

  Future getAllUser(UserEntity user) async {
    emit(UserLoading());
    try {
      final streamResponse = getAllUserUseCase.excute(user);
      streamResponse.listen((event) {
        emit(UserLoaded(users: event));
      });
    } on SocketException {
      emit(UserFailed());
    } catch (e) {
      emit(UserFailed());
    }
  }

  Future updateUser(UserEntity user) async {
    emit(UserLoading());
    try {
      await updateUserUseCase.excute(user);
    } on SocketException catch (_) {
      // avoid crash app
      emit(UserFailed());
    } catch (e) {
      emit(UserFailed());
    }
  }
}
