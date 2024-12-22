import 'package:dartz/dartz.dart';
import '../../../../core/core.dart';
import '../repositories/verify_code_repo.dart';

class VerifyCodeUsecase {
  final VerifyRepo repo;

  VerifyCodeUsecase(this.repo);

  Future<Either<Failure, String>> call(
      {required String verificationID, required String smsCode}) async {
    return await repo.verifyCode(
        verificationID: verificationID, smsCode: smsCode);
  }
}
