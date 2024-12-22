part of 'register_cubit.dart';

sealed class RegisterState extends Equatable {
  const RegisterState();

  @override
  List<Object> get props => [];
}

class RegisterInitial extends RegisterState {}

class RegisterLoading extends RegisterState {}

class RegisterSuccess extends RegisterState {
  final String verificationId;
  final String userId;

  const RegisterSuccess({
    required this.verificationId,
    required this.userId,
  });
}

class CreatedAccountSuccess extends RegisterState {}

class RegisterError extends RegisterState {
  final ErrorModel error;

  const RegisterError(this.error);
}
 
