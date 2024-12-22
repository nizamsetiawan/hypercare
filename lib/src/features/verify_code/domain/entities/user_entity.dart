import 'package:equatable/equatable.dart';

class UserEntity extends Equatable {
  final String id;
  final String name;
  final String email;
  final String phoneNumber;
  final String age;
  final String gender;
  final String major;
  final String jobTitle;
  final String durationOfHypertension;

  const UserEntity(
      {required this.name,
        required this.id,
        required this.email,
        required this.phoneNumber,
        required this.gender,
        required this.age,
        required this.major,
        required this.jobTitle,
        required this.durationOfHypertension


      });

  @override
  List<Object?> get props => [name, email, gender, age, id, phoneNumber, major, jobTitle, durationOfHypertension];

  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'name': name,
      'email': email,
      'phoneNumber': phoneNumber,
      'age': age,
      'gender': gender,
      'major': major,
      'jobTitle': jobTitle,
      'durationOfHypertension': durationOfHypertension
    };
  }
}

