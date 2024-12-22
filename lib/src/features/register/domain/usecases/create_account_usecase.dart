import 'package:dartz/dartz.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:hypercare/src/features/register/domain/repositories/register_repo.dart';

import '../../../../core/core.dart';
import '../entities/register_entity.dart';

class CreateAccountUsecase {
  RegisterRepository registerRepository;

  CreateAccountUsecase({required this.registerRepository});

  Future<Either<Failure, UserCredential>> call(
          {required RegisterEntity registerEntity}) async {
    return await registerRepository.createUser(registerEntity : registerEntity);
  }
}
