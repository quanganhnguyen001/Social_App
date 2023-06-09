part of 'get_single_user_cubit.dart';

abstract class GetSingleUserState extends Equatable {
  const GetSingleUserState();

  @override
  List<Object> get props => [];
}

class GetSingleUserInitial extends GetSingleUserState {
  @override
  List<Object> get props => [];
}

class GetSingleUserLoading extends GetSingleUserState {
  @override
  List<Object> get props => [];
}

class GetSingleUserSuccess extends GetSingleUserState {
  final UserEntity user;
  const GetSingleUserSuccess({
    required this.user,
  });
  @override
  List<Object> get props => [user];
}

class GetSingleUserFailed extends GetSingleUserState {
  @override
  List<Object> get props => [];
}
