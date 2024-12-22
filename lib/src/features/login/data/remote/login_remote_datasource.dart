import 'package:firebase_auth/firebase_auth.dart';

import '../models/login_model.dart';

abstract class LoginRemoteDataSource{
  Future<UserCredential> login ({required LoginModel loginModel});
}