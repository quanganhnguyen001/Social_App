import 'package:onstagram/features/domain/user/repository/user_repository.dart';

class GetSingleUserUseCase {
  final UserRepository userRepository;
  GetSingleUserUseCase({
    required this.userRepository,
  });

  Stream excute(String uid) {
    return userRepository.getSingleUser(uid);
  }
}
