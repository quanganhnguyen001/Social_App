import 'package:onstagram/features/domain/user/repository/user_repository.dart';

import '../entities/user_entity.dart';

class GetSingleUserUseCase {
  final UserRepository userRepository;
  GetSingleUserUseCase({
    required this.userRepository,
  });

  Stream<List<UserEntity>> excute(String uid) {
    return userRepository.getSingleUser(uid);
  }
}
