import 'package:onstagram/features/domain/user/repository/user_repository.dart';

class GetCurrentUidUseCase {
  final UserRepository userRepository;
  GetCurrentUidUseCase({
    required this.userRepository,
  });

  Future excute() {
    return userRepository.getCurrentUid();
  }
}
