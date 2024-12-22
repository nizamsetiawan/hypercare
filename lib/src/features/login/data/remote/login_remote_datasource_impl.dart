import 'package:firebase_auth/firebase_auth.dart';
import 'package:hypercare/src/features/login/data/remote/login_remote_datasource.dart';

import '../models/login_model.dart';

class LoginRemoteDataSourceImpl implements LoginRemoteDataSource {
  final FirebaseAuth _firabaseAuth;

  LoginRemoteDataSourceImpl(this._firabaseAuth);

  @override
  Future<UserCredential> login({required LoginModel loginModel}) async {
    UserCredential userCredential =
        await _firabaseAuth.signInWithEmailAndPassword(
            email: loginModel.email!, password: loginModel.password!);
    return userCredential;
  }
}
