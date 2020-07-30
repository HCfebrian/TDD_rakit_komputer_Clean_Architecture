import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:data_connection_checker/data_connection_checker.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:get_it/get_it.dart';
import 'package:google_sign_in/google_sign_in.dart';
import 'package:rakit_komputer/core/network/netword_info.dart';
import 'package:rakit_komputer/core/presentation/util/email_validation.dart';
import 'package:rakit_komputer/core/presentation/util/password_validation.dart';
import 'package:rakit_komputer/core/presentation/util/username_validation.dart';
import 'package:rakit_komputer/features/auth/data/data_sources/auth_remote_data_source.dart';
import 'package:rakit_komputer/features/auth/data/data_sources/firebase_auth_datasource_impl.dart';
import 'package:rakit_komputer/features/auth/data/repository/firebase_auth_repository_impl.dart';
import 'package:rakit_komputer/features/auth/domain/repository/auth_repository.dart';
import 'package:rakit_komputer/features/auth/domain/usecase/login.dart';
import 'package:rakit_komputer/features/auth/domain/usecase/register.dart';
import 'package:rakit_komputer/features/auth/presentation/bloc/auth_bloc.dart';
import 'package:rakit_komputer/features/get_build_list/data/data_source/build_remote_data_source_abstract.dart';
import 'package:rakit_komputer/features/get_build_list/data/data_source/build_remote_data_source_impl.dart';
import 'package:rakit_komputer/features/get_build_list/data/repository/build_repo_impl.dart';
import 'package:rakit_komputer/features/get_build_list/domain/repository/build_repository.dart';
import 'package:rakit_komputer/features/get_build_list/domain/usecase/get_completed_build.dart';
import 'package:rakit_komputer/features/get_build_list/presentation/bloc/completed_build/completed_build_bloc.dart';
import 'package:rakit_komputer/features/get_build_list/presentation/bloc/recommended_build/recommended_build_bloc.dart';

//service locator
final sl = GetIt.instance;

void init() {

  sl.registerFactory(() => AuthBloc(
        loginUseCase: sl(),
        validateEmail: sl(),
        validatePassword: sl(),
        registerUseCase: sl(),
        validateUsername: sl(),
      ));

  sl.registerFactory(() => RecommendedBuildBloc(buildUsecase: sl()));
  sl.registerFactory(() => CompletedBuildBloc(buildUsecase: sl()));
  //usecase
  sl.registerLazySingleton(() => LoginUseCase(authRepo: sl()));
  sl.registerLazySingleton(() => RegisterUseCase(authRepository: sl()));
  sl.registerLazySingleton(() => BuildUsecase(buildRepository: sl()));

  //repo
  sl.registerLazySingleton<AuthRepository>(() =>
      FirebaseAuthRepositoryImpl(networkInfo: sl(), authRemoteData: sl()));

  sl.registerLazySingleton<BuildRepoAbst>(() => BuildRepoImpl(remoteDataSource: sl()));
  //data
  sl.registerLazySingleton<AuthRemoteDataSource>(() =>
      FirebaseAuthRemoteDataSourceImpl(firebaseAuth: sl(), googleSignIn: sl()));

  sl.registerLazySingleton<BuildRemoteDataSourceAbstc>(() => BuildRemoteDataSourceImpl(firetoreInstance: sl()));
// Core
  //presentation
  //util
  sl.registerLazySingleton(() => ValidateEmail());
  sl.registerLazySingleton(() => ValidatePassword());
  sl.registerLazySingleton(() => ValidateUsername());
  //network
  sl.registerLazySingleton<NetworkInfo>(
      () => NetworkInfoImpl(dataConnectionChecker: sl()));

// External dependency

  sl.registerLazySingleton<FirebaseAuth>(() => FirebaseAuth.instance);
  sl.registerLazySingleton<GoogleSignIn>(() => GoogleSignIn());
  sl.registerLazySingleton(() => DataConnectionChecker());
  sl.registerLazySingleton<Firestore>(() => Firestore.instance);
}
