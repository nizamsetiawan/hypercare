import 'package:dartz/dartz.dart';
import 'package:firebase_auth/firebase_auth.dart';
import '../../../../core/core.dart';
import '../remote/verify_code_remote_datasouruce.dart';
import '../models/user_model.dart';
import '../../domain/entities/user_entity.dart';
import '../../domain/repositories/verify_code_repo.dart';

class VerifyCodeRepositoryImpl implements VerifyRepo {
  final NetworkInfo networkInfo;
  final VerifyCodeRemoteDatasouruce accountDatasouruce;

  VerifyCodeRepositoryImpl(
      {required this.networkInfo, required this.accountDatasouruce});

  @override
  Future<Either<Failure, Unit>> uploadUserData(UserEntity userEntity) async {
    if (await networkInfo.isConncted) {
      try {
        UserModel model = UserModel(
          name: userEntity.name,
          email: userEntity.email,
          id: userEntity.id,
          gender: userEntity.gender,
          phoneNumber: userEntity.phoneNumber,
          age: userEntity.age,
          major: userEntity.major,
          jobTitle: userEntity.jobTitle,
          durationOfHypertension: userEntity.durationOfHypertension,
        );
        final remoteCreateAccount =
            accountDatasouruce.uploadUserData(userModel: model);
        return Right(await remoteCreateAccount);
      } on FirebaseAuthException catch (e) {
        return Left(WrongUplpadUserDataFailuer(
            error: AuthErrorHandler.handleAuthError(e)));
      }
    } else {
      return Left(ServerFailure(error: errorServerModel));
    }
  }

  @override
  Future<Either<Failure, String>> verifyCode(
      {required String verificationID, required String smsCode}) async {
    if (await networkInfo.isConncted) {
      try {
        final remoteVerfiyCode = accountDatasouruce.verifyCode(
            verificationId: verificationID, smsCode: smsCode);
        return Right(await remoteVerfiyCode);
      } on FirebaseAuthException catch (e) {
        return Left(
            VerfiyCodeFailure(error: AuthErrorHandler.handleAuthError(e)));
      }
    } else {
      return Left(ServerFailure(error: errorServerModel));
    }
  }
}
