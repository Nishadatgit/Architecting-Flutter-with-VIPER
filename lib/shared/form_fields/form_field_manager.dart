import 'package:viper_form_app/shared/form_fields/form_field.dart';

abstract class IFormFieldManager<T> {
  List<FormFieldWidget> getFields(T formData);
}
