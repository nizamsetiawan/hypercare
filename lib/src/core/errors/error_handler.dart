part of 'errors.dart';

ErrorModel errorServerModel = ErrorModel(
  message:
      'No internet connection. Please check your connection and try again.',
  code: 'no-internet',
);

class AuthErrorHandler implements Exception {
  static ErrorModel handleAuthError(FirebaseAuthException error) {
    switch (error.code) {
      case 'invalid-email':
        return ErrorModel(
            message: 'Invalid email address.', code: 'invalid-email');
      case 'user-disabled':
        return ErrorModel(
            message: 'This account has been disabled.', code: 'user-disabled');
      case 'user-not-found':
        return ErrorModel(
            message: 'No user found with this email address.',
            code: 'user-not-found');
      case 'wrong-password':
        return ErrorModel(
            message: 'Incorrect password.', code: 'wrong-password');
      case 'email-already-in-use':
        return ErrorModel(
            message: 'This email is already in use.',
            code: 'email-already-in-use');
      case 'operation-not-allowed':
        return ErrorModel(
            message: 'This operation is not allowed.',
            code: 'operation-not-allowed');
      case 'weak-password':
        return ErrorModel(
            message: 'The password is too weak, please choose a stronger one.',
            code: 'weak-password');
        case SMDisplayStrings.createAccountCodeError:
        return ErrorModel(
            message: 'The password is too weak, please choose a stronger one.',
            code: SMDisplayStrings.createAccountCodeError);
      default:
        return ErrorModel(
            message: 'An unexpected error occurred. Please try again later.',
            code: 'unknown-error');
    }
  }
}
