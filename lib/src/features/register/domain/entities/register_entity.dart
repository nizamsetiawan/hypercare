import 'package:equatable/equatable.dart';

class RegisterEntity extends Equatable {

  // final String name;
  final String email;
  final String password;
  final String phoneNumber;
  // final String age;
  // final String gender;
  // final String major;
  // final String jobTitle;
  // final String durationOfHypertension;

  const RegisterEntity({
    // required this.name,
    required this.email,
    required this.password,
    required this.phoneNumber,
    // required this.age,
    // required this.gender,
    // required this.major,
    // required this.jobTitle,
    // required this.durationOfHypertension,
  });
  
  @override
  List<Object?> get props => [
    // name,
    email,
    password,
    phoneNumber,
    // age,
    // gender,
    // major,
    // jobTitle,
    // durationOfHypertension,
  ];
}
