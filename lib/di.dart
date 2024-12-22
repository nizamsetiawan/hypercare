import 'package:firebase_auth/firebase_auth.dart';
import 'package:get_it/get_it.dart';
import 'package:hypercare/src/core/core.dart';
import 'package:hypercare/src/features/login/data/remote/login_remote_datasource.dart';
import 'package:hypercare/src/features/login/data/remote/login_remote_datasource_impl.dart';
import 'package:hypercare/src/features/login/data/repositories/login_repo_impl.dart';
import 'package:hypercare/src/features/login/domain/repositories/login_repo.dart';
import 'package:hypercare/src/features/login/domain/usecases/login_usecase.dart';
import 'package:hypercare/src/features/login/presentation/cubit/login_cubit.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:hypercare/src/features/register/data/remote/register_remote_datasource.dart';
import 'package:hypercare/src/features/register/data/remote/register_remote_datasource_impl.dart';
import 'package:hypercare/src/features/register/data/repositories/register_repository_impl.dart';
import 'package:hypercare/src/features/register/domain/repositories/register_repo.dart';
import 'package:hypercare/src/features/register/domain/usecases/create_account_usecase.dart';
import 'package:hypercare/src/features/register/domain/usecases/send_verifed_code_usecase.dart';
import 'package:hypercare/src/features/register/presentation/cubit/register_cubit.dart';
import 'package:internet_connection_checker/internet_connection_checker.dart';


final sl = GetIt.instance;

Future<void> setupGetIt() async {
  // Firebase
  sl.registerLazySingleton<FirebaseAuth>(() => FirebaseAuth.instance);
  sl.registerLazySingleton<FirebaseFirestore>(() => FirebaseFirestore.instance);

  //NetworkInfo , InternetConnectionChecker
  sl.registerLazySingleton<NetworkInfo>(() => NetworkInfoImpl(sl()));
  sl.registerLazySingleton(() => InternetConnectionChecker());


  /// ------LOGIN MODULE------------
  //DataSources
  sl.registerLazySingleton<LoginRemoteDataSource>(() => LoginRemoteDataSourceImpl(sl()));

  //Repositories
  sl.registerLazySingleton<LoginRepository>(() => LoginRepositoryImpl(loginRemoteDataSource: sl(), networkInfo: sl()));

  //Cubits
  sl.registerFactory(() => LoginCubit(sl()));

  //UseCase
  sl.registerLazySingleton(() => LoginUsecase(sl()));

  /// --------REGISTER MODULE------------
  // DataSources
  sl.registerLazySingleton<RegisterRemoteDatasource>(() => RegisterRemoteDatasourceImpl(sl()));

  //Repositories
  sl.registerLazySingleton<RegisterRepository>(() => RegisterRepositoryImpl(registerRemoteDataSource: sl(), networkInfo: sl()));

  //UseCase
  sl.registerLazySingleton(() => CreateAccountUsecase(registerRepository: sl()));
  sl.registerLazySingleton(() => SendVerifedCodeUseCase( sl()));

  //Cubits
  sl.registerFactory(() => RegisterCubit(
    createAccountUsercase: sl(),
    sendVerifedCodeUsecase: sl(),
  ));
}
