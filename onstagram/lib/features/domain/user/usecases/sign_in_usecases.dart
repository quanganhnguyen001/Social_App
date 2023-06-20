import 'package:onstagram/features/domain/user/entities/user_entity.dart';
import 'package:onstagram/features/domain/user/repository/user_repository.dart';

class SignInUseCase {
  final UserRepository userRepository;
  SignInUseCase({
    required this.userRepository,
  });

  Future excute(UserEntity user) {
    return userRepository.signIn(user);
  }
}
