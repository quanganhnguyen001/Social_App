part of 'app_bloc_bloc.dart';

abstract class AppBlocEvent extends Equatable {
  const AppBlocEvent();

  @override
  List<Object> get props => [];
}

class AppLogoutRequest extends AppBlocEvent {}

class AppUserChanged extends AppBlocEvent {
  final UserModel user;

  const AppUserChanged(this.user);

  @override
  List<Object> get props => [user];
}
