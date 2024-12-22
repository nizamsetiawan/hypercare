part of 'errors.dart';
class ErrorModel {
  final String message;
  final String code;

  ErrorModel({
    required this.message,
    required this.code,
  });
  factory ErrorModel.fromJson(Map<String, dynamic> json) =>
      ErrorModel(message: json['message'], code: json['code']);

  Map<String, dynamic> toJson() => {'message': message, 'code': code};
}
