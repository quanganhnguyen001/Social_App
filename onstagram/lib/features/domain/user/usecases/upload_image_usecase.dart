import 'dart:io';

import 'package:onstagram/features/domain/user/entities/user_entity.dart';
import 'package:onstagram/features/domain/user/repository/user_repository.dart';

class UploadImageUseCase {
  final UserRepository userRepository;
  UploadImageUseCase({
    required this.userRepository,
  });

  Future excute(File file, bool isPost, String childName) {
    return userRepository.uploadImage(file, isPost, childName);
  }
}
