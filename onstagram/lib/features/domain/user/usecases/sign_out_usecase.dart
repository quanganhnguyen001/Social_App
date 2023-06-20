import 'package:onstagram/features/domain/user/repository/user_repository.dart';

class SignOutUseCase {
  final UserRepository userRepository;
  SignOutUseCase({
    required this.userRepository,
  });

  Future excute() {
    return userRepository.signOut();
  }
}
