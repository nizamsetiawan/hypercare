import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:hypercare/src/features/register/domain/usecases/send_verifed_code_usecase.dart';

import '../../../../core/core.dart';
import '../../domain/entities/user_entity.dart';
import '../../domain/usecases/upload_user_data.dart';
import '../../domain/usecases/verify_code_usecase.dart';

part 'verify_code_state.dart';

class VerifyCodeCubit extends Cubit<VerifyCodeState> {
  VerifyCodeCubit({
    required UploadUserDataUseCase uploadUserDataUseCase,
    required VerifyCodeUsecase verifyCodeUsecase,
    required SendVerifedCodeUseCase sendVerifedCodeUsecase,
  })  : _verifyCodeUsecase = verifyCodeUsecase,
        _uploadUserDataUseCase = uploadUserDataUseCase,
        _sendVerifyCodeUsecase = sendVerifedCodeUsecase,
        super(CreateAccountInitial());

  final UploadUserDataUseCase _uploadUserDataUseCase;
  final VerifyCodeUsecase _verifyCodeUsecase;
  final SendVerifedCodeUseCase _sendVerifyCodeUsecase;
  TextEditingController smsCodeController = TextEditingController();

  @override
  Future<void> close() {
    smsCodeController.dispose();
    return super.close();
  }

  String? _verifiyID;
  Future<void> resendCode(String phoneNumber) async {
    emit(ResendCode());
    final fialureOrString =
    await _sendVerifyCodeUsecase(phoneNumber: phoneNumber);
    fialureOrString.fold(
          (failure) {
        emit(WrongSendCode(error: failure.error));
      },
          (verificationID) {
        _verifiyID = verificationID;
        emit(ResendedCode());
      },
    );
  }

  Future createAccount({
    required UserEntity user,
    required String verificationID,
    required String smsCode,
  }) async {
    try {
      emit(VerifyCodeLoading());
      //Verify code or Failure
      final verifyOrFialure = await _verifyCodeUsecase(
          smsCode: smsCode, verificationID: _verifiyID ?? verificationID);
      verifyOrFialure.fold((failure) {
        emit(VerifyCodeError(error: failure.error));
        return;
      }, (right) => emit(VerifeedCode()));
      // Upload User data or Failure
      final uploadDataOrFailure = await _uploadUserDataUseCase(user);
      uploadDataOrFailure.fold((fialure) {
        emit(VerifyCodeError(error: fialure.error));
      }, (right) => emit(VerifyCodeSuccess()));
    } on FirebaseAuthException catch (e) {
      emit(VerifyCodeError(error: AuthErrorHandler.handleAuthError(e)));
    }
  }
}
