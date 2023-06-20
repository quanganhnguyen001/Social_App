import 'package:onstagram/features/domain/user/entities/user_entity.dart';
import 'package:onstagram/features/domain/user/repository/user_repository.dart';

class SignUpUseCase {
  final UserRepository userRepository;
  SignUpUseCase({
    required this.userRepository,
  });

  Future excute(UserEntity user) {
    return userRepository.signUp(user);
  }
}
