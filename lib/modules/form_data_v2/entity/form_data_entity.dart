import 'package:viper_form_app/modules/form_data/entity/form_data_entity.dart';

class FormDataEntityV2 extends FormDataEntity {
  bool isSubscribed;

  FormDataEntityV2(
      {required this.isSubscribed,
      required super.firstName,
      required super.lastName,
      required super.age,
      required super.address,
      required super.city,
      required super.emailAddress});

  factory FormDataEntityV2.fromJson(Map<String, dynamic> json) {
    return FormDataEntityV2(
      firstName: json['first_name'],
      lastName: json['last_name'],
      age: json['age'],
      address: json['address'],
      city: json['city'],
      emailAddress: json['email_address'],
      isSubscribed: json['is_subscribed'] ?? false,
    );
  }
}
