import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:dartz/dartz.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'verify_code_remote_datasouruce.dart';
import '../models/user_model.dart';

class VerifyCodeRemoteDatasouruceImpl implements VerifyCodeRemoteDatasouruce {
  final FirebaseFirestore firestore;
  final FirebaseAuth firebaseAuth;

  VerifyCodeRemoteDatasouruceImpl(
      {required this.firestore, required this.firebaseAuth});

  @override
  Future<Unit> uploadUserData({required UserModel userModel}) async {
    DocumentReference userRef = firestore.collection('users').doc(userModel.id);
    await userRef.set(userModel.toJson());
    return unit;
  }

  @override
  Future verifyCode(
      {required String verificationId, required String smsCode}) async {
    PhoneAuthCredential credential = PhoneAuthProvider.credential(
      verificationId: verificationId,
      smsCode: smsCode,
    );
    return credential.toString();
  }
}
