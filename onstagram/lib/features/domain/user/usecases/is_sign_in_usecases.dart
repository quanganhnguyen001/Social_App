import 'package:onstagram/features/domain/user/repository/user_repository.dart';

class IsSignInUseCase {
  final UserRepository userRepository;
  IsSignInUseCase({
    required this.userRepository,
  });

  Future excute() {
    return userRepository.isSignIn();
  }
}
