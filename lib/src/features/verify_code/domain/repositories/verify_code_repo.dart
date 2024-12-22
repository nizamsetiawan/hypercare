import 'package:dartz/dartz.dart';
import '../../../../core/core.dart';
import '../entities/user_entity.dart';

abstract class VerifyRepo {
  Future <Either<Failure,Unit>> uploadUserData(UserEntity userEntity);
  Future <Either<Failure,String>> verifyCode({required String verificationID, required String smsCode} );
}