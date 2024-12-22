import 'package:dartz/dartz.dart';
import 'package:hypercare/src/core/core.dart';
import 'package:hypercare/src/features/register/domain/repositories/register_repo.dart';

class SendVerifedCodeUseCase {
  final RegisterRepository registerRepository;

  SendVerifedCodeUseCase(this.registerRepository);

  Future<Either<Failure, String>> call({required String phoneNumber}) =>
      registerRepository.sendVerificationCode(phoneNumber: phoneNumber);
}
