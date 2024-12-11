import 'package:equatable/equatable.dart';

class FormDataEntity extends Equatable {
  final String firstName;
  final String lastName;
  final int age;
  final String address;
  final String city;
  final String emailAddress;

  const FormDataEntity({
    required this.firstName,
    required this.lastName,
    required this.age,
    required this.address,
    required this.city,
    required this.emailAddress,
  });

  factory FormDataEntity.fromJson(Map<String, dynamic> json) {
    return FormDataEntity(
      firstName: json['first_name'],
      lastName: json['last_name'],
      age: json['age'],
      address: json['address'],
      city: json['city'],
      emailAddress: json['email_address'],
    );
  }

  @override
  List<Object?> get props => [firstName, lastName, age];
}
