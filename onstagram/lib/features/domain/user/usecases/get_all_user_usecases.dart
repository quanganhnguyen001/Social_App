import 'package:onstagram/features/domain/user/entities/user_entity.dart';
import 'package:onstagram/features/domain/user/repository/user_repository.dart';

class GetAllUserUseCase {
  final UserRepository userRepository;
  GetAllUserUseCase({
    required this.userRepository,
  });

  Stream excute(UserEntity user) {
    return userRepository.getAllUser(user);
  }
}
