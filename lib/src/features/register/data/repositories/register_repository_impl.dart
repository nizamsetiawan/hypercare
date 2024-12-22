import 'package:dartz/dartz.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:hypercare/src/core/core.dart';
import 'package:hypercare/src/features/register/data/models/register_model.dart';
import 'package:hypercare/src/features/register/data/remote/register_remote_datasource.dart';
import 'package:hypercare/src/features/register/domain/entities/register_entity.dart';

import '../../domain/repositories/register_repo.dart';

class RegisterRepositoryImpl implements RegisterRepository {
  final NetworkInfo networkInfo;
  final RegisterRemoteDatasource registerRemoteDataSource;

  RegisterRepositoryImpl(
      {required this.networkInfo, required this.registerRemoteDataSource});

  @override
  Future<Either<Failure, UserCredential>> createUser(
      {required RegisterEntity registerEntity}) async {
    if (await networkInfo.isConncted) {
      try {
        RegisterModel model = RegisterModel(
          email: registerEntity.email,
          password: registerEntity.password,
          // name: registerEntity.name,
          phoneNumber: registerEntity.phoneNumber,
          // age: registerEntity.age,
          // gender: registerEntity.gender,
          // major: registerEntity.major,
          // jobTitle: registerEntity.jobTitle,
          // durationOfHypertension: registerEntity.durationOfHypertension,
        );
        final remoteRegister =
            registerRemoteDataSource.createAccount(registerModel: model);
        return Right(await remoteRegister);
      } on FirebaseAuthException catch (e) {
        return Left(
            WrongLoginFailuer(error: AuthErrorHandler.handleAuthError(e)));
      }
    } else {
      return Left(ServerFailure(error: errorServerModel));
    }
  }

  @override
  Future<Either<Failure, String>> sendVerificationCode(
      {required String phoneNumber}) async {
    if (await networkInfo.isConncted) {
      try {
        return Right(
            await registerRemoteDataSource.sendVerifedCode(phoneNumber));
      } on FirebaseAuthException catch (e) {
        return Left(
            WrongLoginFailuer(error: AuthErrorHandler.handleAuthError(e)));
      }
    } else {
      return Left(ServerFailure(error: errorServerModel));
    }
  }
}
