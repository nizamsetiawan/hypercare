import 'package:dartz/dartz.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:hypercare/src/features/login/domain/repositories/login_repo.dart';

import '../../../../core/core.dart';
import '../entities/login_entity.dart';

class LoginUsecase {
  final LoginRepository loginRepository;

  LoginUsecase(this.loginRepository);

  Future<Either<Failure, UserCredential>> call(
      {required LoginEntity loginEntity}) async {
    return loginRepository.login(loginEntity);
  }
}