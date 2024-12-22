import '../models/user_model.dart';

abstract class VerifyCodeRemoteDatasouruce {
  Future uploadUserData({required UserModel userModel});
  Future verifyCode({required String verificationId, required String smsCode});
}
