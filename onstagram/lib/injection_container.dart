import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:get_it/get_it.dart';
import 'package:onstagram/features/data/user/datasource/user_remote_datasource.dart';
import 'package:onstagram/features/data/user/datasource/user_remote_datasource_impl.dart';
import 'package:onstagram/features/data/user/repository/user_repository_impl.dart';
import 'package:onstagram/features/domain/user/repository/user_repository.dart';
import 'package:onstagram/features/domain/user/usecases/create_user_usecases.dart';
import 'package:onstagram/features/domain/user/usecases/get_all_user_usecases.dart';
import 'package:onstagram/features/domain/user/usecases/get_current_uid_usecases.dart';
import 'package:onstagram/features/domain/user/usecases/get_single_user_usecases.dart';
import 'package:onstagram/features/domain/user/usecases/is_sign_in_usecases.dart';
import 'package:onstagram/features/domain/user/usecases/sign_in_usecases.dart';
import 'package:onstagram/features/domain/user/usecases/sign_out_usecase.dart';
import 'package:onstagram/features/domain/user/usecases/sign_up_usecases.dart';
import 'package:onstagram/features/domain/user/usecases/update_user_usecases.dart';
import 'package:onstagram/features/presentation/auth/cubit/auth/auth_cubit.dart';
import 'package:onstagram/features/presentation/auth/cubit/credential/credential_cubit.dart';
import 'package:onstagram/features/presentation/user/get_single_user/get_single_user_cubit.dart';
import 'package:onstagram/features/presentation/user/user_cubit.dart';

final getIt = GetIt.instance;

Future init() async {
  // Cubits
  getIt.registerFactory(() => AuthCubit(
      // Each time when we request on this factory will give us new instance
      signOutUseCase: getIt
          .call(), // call when use cases and look for regeister type and when found will initiate and pass it in here
      isSignInUseCase: getIt.call(),
      getCurrentUidUseCase: getIt.call()));

  getIt.registerFactory(() => CredentialCubit(
        signInUseCase: getIt.call(),
        signUpUseCase: getIt.call(),
      ));

  getIt.registerFactory(() => UserCubit(
        getAllUserUseCase: getIt.call(),
        updateUserUseCase: getIt.call(),
      ));

  getIt.registerFactory(
      () => GetSingleUserCubit(getSingleUserUseCase: getIt.call()));

  // Use Cases
  getIt.registerLazySingleton(
      // give new instance only for the first time and call throuout of life time app, will give us same instance and not itiniate new instance,
      () => SignOutUseCase(userRepository: getIt.call()));

  getIt.registerLazySingleton(
      () => IsSignInUseCase(userRepository: getIt.call()));

  getIt.registerLazySingleton(
      () => GetCurrentUidUseCase(userRepository: getIt.call()));

  getIt
      .registerLazySingleton(() => SignInUseCase(userRepository: getIt.call()));

  getIt
      .registerLazySingleton(() => SignUpUseCase(userRepository: getIt.call()));

  getIt.registerLazySingleton(
      () => GetAllUserUseCase(userRepository: getIt.call()));

  getIt.registerLazySingleton(
      () => UpdateUserUseCase(userRepository: getIt.call()));

  getIt.registerLazySingleton(
      () => CreateUserUseCase(userRepository: getIt.call()));

  getIt.registerLazySingleton(
      () => GetSingleUserUseCase(userRepository: getIt.call()));

  //Repository

  getIt.registerLazySingleton<UserRepository>(
      () => UserRepositoryIml(remoteDataSource: getIt.call()));

  // Remote Datasource

  getIt.registerLazySingleton<UserRemoteDataSource>(() =>
      UserRemoteDataSourceImpl(
          firebaseFirestore: getIt.call(), firebaseAuth: getIt.call()));

  // Externals
  final firebaseFirestore = FirebaseFirestore.instance;
  final firebaseAuth = FirebaseAuth.instance;

  getIt.registerLazySingleton(() => firebaseFirestore);
  getIt.registerLazySingleton(() => firebaseAuth);
}
