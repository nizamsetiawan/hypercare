import 'package:firebase_auth/firebase_auth.dart';
import 'package:dartz/dartz.dart';
import '../../../../core/core.dart';
import '../entities/login_entity.dart';

abstract class LoginRepository {
  Future<Either<Failure, UserCredential>> login(LoginEntity loginEntity);
}