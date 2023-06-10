import 'package:equatable/equatable.dart';

enum SignupStatus { initial, submitting, success, error }

class SignUpState extends Equatable {
  final String email;
  final String password;
  final SignupStatus status;
  SignUpState({
    required this.email,
    required this.password,
    required this.status,
  });

  factory SignUpState.initial() {
    return SignUpState(email: '', password: '', status: SignupStatus.initial);
  }

  @override
  List<Object> get props => [email, password, status];

  SignUpState copyWith({
    String? email,
    String? password,
    SignupStatus? status,
  }) {
    return SignUpState(
      email: email ?? this.email,
      password: password ?? this.password,
      status: status ?? this.status,
    );
  }
}
