import 'package:firebase_auth/firebase_auth.dart';

import '../models/register_model.dart';

abstract class RegisterRemoteDatasource {
  Future<UserCredential> createAccount({
    required RegisterModel registerModel
  });

  Future<String> sendVerifedCode(String phoneNumber);
}
