part of 'verify_code_cubit.dart';

abstract class VerifyCodeState extends Equatable {
  const VerifyCodeState();

  @override
  List<Object> get props => [];
}

class CreateAccountInitial extends VerifyCodeState {}

class UploadUserDataLoading extends VerifyCodeState {}

class UploadUserDataSuccess extends VerifyCodeState {}

class VerifyCodeLoading extends VerifyCodeState {}

class VerifeedCode extends VerifyCodeState {}

class VerifyCodeSuccess extends VerifyCodeState {}

class VerifyCodeError extends VerifyCodeState {
  final ErrorModel error;
  const VerifyCodeError({required this.error});
  @override
  List<Object> get props => [error];
}

class ResendCode extends VerifyCodeState {}

class ResendedCode extends VerifyCodeState {}

class WrongSendCode extends VerifyCodeState {
  final ErrorModel error;
  const WrongSendCode({required this.error});
}
