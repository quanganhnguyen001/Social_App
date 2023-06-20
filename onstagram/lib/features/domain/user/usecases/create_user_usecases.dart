import 'package:onstagram/features/domain/user/entities/user_entity.dart';
import 'package:onstagram/features/domain/user/repository/user_repository.dart';

class CreateUserUseCase {
  final UserRepository userRepository;
  CreateUserUseCase({
    required this.userRepository,
  });

  Future excute(UserEntity user) {
    return userRepository.createUser(user);
  }
}
