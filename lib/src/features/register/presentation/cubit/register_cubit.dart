import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/cupertino.dart';
import 'package:hypercare/src/features/register/domain/usecases/create_account_usecase.dart';
import 'package:hypercare/src/features/register/domain/usecases/send_verifed_code_usecase.dart';

import '../../../../core/core.dart';
import '../../domain/entities/register_entity.dart';

part 'register_state.dart';

class RegisterCubit extends Cubit<RegisterState> {
  RegisterCubit({
    required CreateAccountUsecase createAccountUsercase,
    required SendVerifedCodeUseCase sendVerifedCodeUsecase,
  })  : _sendVerifedCodeUsecase = sendVerifedCodeUsecase,
        _createAccountUsercase = createAccountUsercase,
        super(RegisterInitial());
  final CreateAccountUsecase _createAccountUsercase;
  final SendVerifedCodeUseCase _sendVerifedCodeUsecase;
  final formKey = GlobalKey<FormState>();

  TextEditingController nameController = TextEditingController();
  TextEditingController emailController = TextEditingController();
  TextEditingController phoneNumberController = TextEditingController();
  TextEditingController passwordController = TextEditingController();
  TextEditingController ageController = TextEditingController();
  TextEditingController genderController = TextEditingController();
  TextEditingController majorController = TextEditingController();
  TextEditingController jobTitleController = TextEditingController();
  TextEditingController durationOfHypertensionController =
      TextEditingController();
  // bool isMale = true;
  // bool isDriver = true;

  Future<void> register({required RegisterEntity registerEntity}) async {
    try {
      UserCredential? userCredential;
      emit(RegisterLoading());
      // Create Account with email and password.
      final fialureOrUserCredential =
          await _createAccountUsercase(registerEntity: registerEntity);
      fialureOrUserCredential.fold((failure) {
        emit(RegisterError(failure.error));
        throw FirebaseAuthException(
            code: SMDisplayStrings.createAccountCodeError);
      }, (credential) {
        userCredential = credential;
        emit(CreatedAccountSuccess());
      });
      final fialureOrString = await _sendVerifedCodeUsecase(
          phoneNumber: registerEntity.phoneNumber);
      // send sms code for verify phone number.
      fialureOrString.fold(
          (failure) => emit(RegisterError(failure.error)),
          (verificationID) => emit(RegisterSuccess(
              verificationId: verificationID,
              userId: userCredential!.user!.uid)));
    } on FirebaseAuthException catch (e) {
      emit(RegisterError(AuthErrorHandler.handleAuthError(e)));
    }
  }

  @override
  Future<void> close() {
    nameController.dispose();
    phoneNumberController.dispose();
    emailController.dispose();
    passwordController.dispose();
    ageController.dispose();
    genderController.dispose();
    majorController.dispose();
    jobTitleController.dispose();
    durationOfHypertensionController.dispose();
    return super.close();
  }
}
