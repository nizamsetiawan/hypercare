import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/cupertino.dart';
import 'package:hypercare/src/features/login/domain/entities/login_entity.dart';
import 'package:hypercare/src/features/login/domain/usecases/login_usecase.dart';

import '../../../../core/core.dart';

part 'login_state.dart';

class LoginCubit extends Cubit<LoginState> {
  LoginCubit(this._loginWithEmailAndPasswordUsecase) : super(LoginInitial());
  final LoginUsecase _loginWithEmailAndPasswordUsecase;
  final formKey = GlobalKey<FormState>();

  TextEditingController email = TextEditingController();
  TextEditingController password = TextEditingController();

  Future<void> login(LoginEntity loginEntity) async {
    emit(LoginLoading());
    try {
      final failureOrRight =
      await _loginWithEmailAndPasswordUsecase(loginEntity: loginEntity);
      failureOrRight.fold((failure) => emit(LoginError(failure.error)),
              (right) {
            emit(LoginSuccess(right));
          });
    } on FirebaseAuthException catch (e) {
      emit(LoginError(AuthErrorHandler.handleAuthError(e)));
    }
  }

  @override
  Future<void> close() {
    email.dispose();
    password.dispose();
    return super.close();
  }

}
