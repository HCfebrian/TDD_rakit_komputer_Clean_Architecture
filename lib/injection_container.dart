import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:data_connection_checker/data_connection_checker.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:get_it/get_it.dart';
import 'package:google_sign_in/google_sign_in.dart';
import 'package:rakit_komputer/core/network/netword_info.dart';
import 'package:rakit_komputer/core/presentation/util/email_validation.dart';
import 'package:rakit_komputer/core/presentation/util/password_validation.dart';
import 'package:rakit_komputer/core/presentation/util/username_validation.dart';
import 'package:rakit_komputer/features/auth/data/repository/firebase_auth_repository_impl.dart';
import 'package:rakit_komputer/features/auth/domain/repository/auth_repository.dart';
import 'package:rakit_komputer/features/auth/domain/usecase/login.dart';
import 'package:rakit_komputer/features/auth/domain/usecase/register.dart';
import 'package:rakit_komputer/features/auth/presentation/bloc/auth_bloc.dart';
import 'package:rakit_komputer/features/get_build/data/data_source/build_remote_data_source_abstract.dart';
import 'package:rakit_komputer/features/get_build/data/data_source/build_remote_data_source_impl.dart';
import 'package:rakit_komputer/features/get_build/data/repository/build_repo_impl.dart';
import 'package:rakit_komputer/features/get_build/domain/repository/build_repository.dart';
import 'package:rakit_komputer/features/get_build/domain/usecase/get_completed_build.dart';
import 'package:rakit_komputer/features/get_build/presentation/bloc/build_part/build_part_bloc.dart';
import 'package:rakit_komputer/features/get_build/presentation/bloc/completed_build/completed_build_bloc.dart';
import 'package:rakit_komputer/features/get_build/presentation/bloc/featured_build/get_featured_build_bloc.dart';
import 'package:rakit_komputer/features/get_build/presentation/bloc/recommended_build/recommended_build_bloc.dart';
import 'package:rakit_komputer/features/get_part/data/data_source/part_remote_data_abstc.dart';
import 'package:rakit_komputer/features/get_part/data/data_source/part_remote_data_imp.dart';
import 'package:rakit_komputer/features/get_part/data/repository/part_repo_imp.dart';
import 'package:rakit_komputer/features/get_part/domain/repository/part_repository.dart';
import 'package:rakit_komputer/features/get_part/domain/usecase/get_component_part.dart';
import 'package:rakit_komputer/features/get_part/presentation/bloc/part_detail/part_detail_bloc.dart';

import 'features/auth/data/data_sources/auth_remote_data_source.dart';
import 'features/auth/data/data_sources/firebase_auth_datasource_impl.dart';

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
  sl.registerFactory(() => FeaturedBuildBloc(buildUsecase: sl()));
  sl.registerFactory(() => BuildPartBloc(buildUsecase: sl()));
  sl.registerFactory(() => PartDetailBloc(partUsecase: sl()));
  //usecase
  sl.registerLazySingleton(() => LoginUseCase(authRepo: sl()));
  sl.registerLazySingleton(() => RegisterUseCase(authRepository: sl()));
  sl.registerLazySingleton(() => BuildUsecase(buildRepository: sl()));
  sl.registerLazySingleton(() => PartUsecase( partRepoAbst: sl()));

  //repo
  sl.registerLazySingleton<AuthRepositoryAbst>(() =>
      FirebaseAuthRepositoryImpl(networkInfo: sl(), authRemoteData: sl()));

  sl.registerLazySingleton<BuildRepoAbst>(() => BuildRepoImpl(remoteDataSource: sl()));
  sl.registerLazySingleton<PartRepoAbst>(() => PartRepoImp(partRemoteData:  sl()));

  //data
  sl.registerLazySingleton<AuthRemoteDataSource>(() =>
      FirebaseAuthRemoteDataSourceImpl(firebaseAuth: sl(), googleSignIn: sl()));

  sl.registerLazySingleton<BuildRemoteDataSourceAbstc>(() => BuildRemoteDataSourceImpl(firetoreInstance: sl()));
  sl.registerLazySingleton<PartRemoteDataSourceAbsct>(() => PartRemoteDataSourceImpl( firestoreInstance:sl()));
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
