import 'dart:io';

import 'package:equatable/equatable.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'package:onstagram/features/domain/user/usecases/get_single_user_usecases.dart';

import '../../../domain/user/entities/user_entity.dart';

part 'get_single_user_state.dart';

class GetSingleUserCubit extends Cubit<GetSingleUserState> {
  final GetSingleUserUseCase getSingleUserUseCase;
  GetSingleUserCubit({
    required this.getSingleUserUseCase,
  }) : super(GetSingleUserInitial());

  Future getSingleUser(String uid) async {
    emit(GetSingleUserLoading());
    try {
      final streamResponse = getSingleUserUseCase.excute(uid);
      streamResponse.listen((event) {
        emit(GetSingleUserSuccess(user: event.first));
      });
    } on SocketException {
      emit(GetSingleUserFailed());
    } catch (e) {
      emit(GetSingleUserFailed());
    }
  }
}
