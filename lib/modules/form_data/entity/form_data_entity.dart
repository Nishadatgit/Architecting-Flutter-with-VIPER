class FormDataEntity {
  String firstName;
  String lastName;
  int age;
  String address;
  String city;
  String emailAddress;

  FormDataEntity({
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
}
