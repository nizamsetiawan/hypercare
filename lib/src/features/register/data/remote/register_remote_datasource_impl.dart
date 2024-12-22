import 'dart:async';

import 'package:firebase_auth/firebase_auth.dart';
import 'package:hypercare/src/features/register/data/models/register_model.dart';
import 'package:hypercare/src/features/register/data/remote/register_remote_datasource.dart';

class RegisterRemoteDatasourceImpl implements RegisterRemoteDatasource {
  final FirebaseAuth firebaseAuth;
  RegisterRemoteDatasourceImpl(this.firebaseAuth);

  @override
  Future<UserCredential> createAccount({required RegisterModel registerModel}) async{
    UserCredential userCredential = await firebaseAuth.createUserWithEmailAndPassword(
        email: registerModel.email,
        password: registerModel.password
    );
    return userCredential;
  }

  @override
  Future<String> sendVerifedCode(String phoneNumber)async {
    Completer<String> completer = Completer<String>();
    await firebaseAuth.verifyPhoneNumber(
      phoneNumber: '+2$phoneNumber',
      timeout: const Duration(minutes: 2),
      verificationCompleted: (PhoneAuthCredential credential) {},
      verificationFailed: (FirebaseAuthException e) {},
      codeSent: (String verId, int? resendToken) {
        completer.complete(verId);
      },
      codeAutoRetrievalTimeout: (String verificationId) {},
    );
    return completer.future;
  }
}