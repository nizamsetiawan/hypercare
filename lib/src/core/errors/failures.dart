part of 'errors.dart';


abstract class Failure extends Equatable {
  final ErrorModel error;
  const Failure({required this.error});
}

class OffLineFailure extends Failure {
  const OffLineFailure({required super.error});

  @override
  List<Object?> get props => [];
}

class ServerFailure extends Failure {
  const ServerFailure({required super.error});

  @override
  List<Object?> get props => [];
}

class EmptyCacheFailure extends Failure {
  const EmptyCacheFailure({required super.error});

  @override
  List<Object?> get props => [];
}

class WrongLoginFailuer extends Failure {
  const WrongLoginFailuer({required super.error});

  @override
  List<Object?> get props => [];
}

class WrongUplpadUserDataFailuer extends Failure {
  const WrongUplpadUserDataFailuer({required super.error});

  @override
  List<Object?> get props => [];
}

class VerfiyCodeFailure extends Failure {
  const VerfiyCodeFailure({required super.error});

  @override
  List<Object?> get props => [];
}

class WrongSendVerifyCodeFailuer extends Failure {
  const WrongSendVerifyCodeFailuer({required super.error});

  @override
  List<Object?> get props => [];
}

class WronCreateAccountFailuer extends Failure {
  const WronCreateAccountFailuer({required super.error});

  @override
  List<Object?> get props => [];
}

class WrongVerificationCodeFailuer extends Failure {
  const WrongVerificationCodeFailuer({required super.error});

  @override
  List<Object?> get props => [];
}

class ForgetPasswordFailuer extends Failure {
  const ForgetPasswordFailuer({required super.error});

  @override
  List<Object?> get props => [];
}

class SignOutFailure extends Failure {
  const SignOutFailure({required super.error});

  @override
  List<Object?> get props => [];
}
