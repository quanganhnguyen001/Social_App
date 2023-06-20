import 'package:onstagram/features/domain/user/entities/user_entity.dart';
import 'package:onstagram/features/domain/user/repository/user_repository.dart';

class UpdateUserUseCase {
  final UserRepository userRepository;
  UpdateUserUseCase({
    required this.userRepository,
  });

  Future excute(UserEntity user) {
    return userRepository.updateUser(user);
  }
}
