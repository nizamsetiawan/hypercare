import 'package:dartz/dartz.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

import '../../../../core/core.dart';
import '../entities/register_entity.dart';

abstract class RegisterRepository {
  Future<Either<Failure, UserCredential>> createUser({
    required RegisterEntity registerEntity,
});

  Future<Either<Failure, String>> sendVerificationCode({required String phoneNumber});
}