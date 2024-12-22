import 'package:hypercare/src/features/register/domain/entities/register_entity.dart';

class RegisterModel extends RegisterEntity {
  const RegisterModel(
      {
        // required super.name,
      required super.email,
      required super.password,
      required super.phoneNumber,
      // required super.age,
      // required super.gender,
      // required super.major,
      // required super.jobTitle,
      // required super.durationOfHypertension
      });

  factory RegisterModel.fromJson(Map<String, dynamic> json) {
    return RegisterModel(
        // name: json['name'],
        email: json['email'],
        password: json['password'],
        phoneNumber: json['phoneNumber'],
        // age: json['age'],
        // gender: json['gender'],
        // major: json['major'],
        // jobTitle: json['jobTitle'],
        // durationOfHypertension: json['durationOfHypertension']
    );
  }
}
