import 'package:dartz/dartz.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:hypercare/src/features/login/data/models/login_model.dart';

import '../../../../core/core.dart';
import '../../domain/entities/login_entity.dart';
import '../../domain/repositories/login_repo.dart';
import '../remote/login_remote_datasource.dart';

class LoginRepositoryImpl extends LoginRepository {
  final LoginRemoteDataSource loginRemoteDataSource;
  final NetworkInfo networkInfo;

  LoginRepositoryImpl(
      {required this.loginRemoteDataSource, required this.networkInfo});

  @override
  Future<Either<Failure, UserCredential>> login(LoginEntity loginEntity) async {
    if (await networkInfo.isConncted) {
      try {
        final remoteLogin = await loginRemoteDataSource.login(
            loginModel: LoginModel(email: loginEntity.email, password: loginEntity.password));
        return Right(remoteLogin);
      } on FirebaseAuthException catch (e) {
        return Left(WrongLoginFailuer(error: AuthErrorHandler.handleAuthError(e)));
      }
    } else {
      return Left(ServerFailure(error: errorServerModel));
    }
  }

}