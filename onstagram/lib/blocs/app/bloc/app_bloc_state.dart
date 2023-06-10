import 'package:equatable/equatable.dart';

import 'package:onstagram/models/user.dart';

enum AppStatus {
  authenticated,
  unauthenticated,
}

class AppBlocState extends Equatable {
  const AppBlocState._({
    required this.status,
    this.user = UserModel.empty,
  });

  const AppBlocState.authenticated(UserModel user)
      : this._(status: AppStatus.authenticated, user: user);

  const AppBlocState.unauthenticated()
      : this._(status: AppStatus.unauthenticated);

  final AppStatus status;
  final UserModel user;

  @override
  List<Object> get props => [status, user];
}
