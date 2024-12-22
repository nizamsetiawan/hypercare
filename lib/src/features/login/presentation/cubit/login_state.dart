part of 'login_cubit.dart';

sealed class LoginState extends Equatable {
  const LoginState();

  @override
  List<Object> get props => [];
}

class LoginInitial extends LoginState {}

class LoginLoading extends LoginState{}

class LoginSuccess extends LoginState {
  final UserCredential email;

  const LoginSuccess(this.email);
}

class LoginError extends LoginState {
  final ErrorModel error;

  const LoginError(this.error);
}
