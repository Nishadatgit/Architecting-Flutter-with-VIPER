import 'package:viper_form_app/modules/form_data/entity/form_data_entity.dart';
import 'package:viper_form_app/shared/form_fields/form_field.dart';
import 'package:viper_form_app/shared/form_fields/form_field_manager.dart';

abstract class BaseFormFieldManager<T extends FormDataEntity>
    implements IFormFieldManager<T> {
  List<FormFieldWidget> getCommonFields(T formData) {
    return [
      TextFieldFormField(
        label: 'First Name',
        value: formData.firstName,
        onChanged: (value) {
          formData.firstName = value;
        },
      ),
      CustomSpacingField(),
      TextFieldFormField(
        label: 'Last Name',
        value: formData.lastName,
        onChanged: (value) {
          formData.lastName = value;
        },
      ),
      CustomSpacingField(),
      TextFieldFormField(
        label: 'Age',
        value: formData.age.toString(),
        onChanged: (value) {
          formData.age = int.tryParse(value) ?? -1;
        },
      ),
      CustomSpacingField(),
      TextFieldFormField(
        label: 'Address',
        value: formData.address,
        onChanged: (value) {
          formData.address = value;
        },
      ),
      CustomSpacingField(),
      TextFieldFormField(
        label: 'City',
        value: formData.city,
        onChanged: (value) {
          formData.city = value;
        },
      ),
      CustomSpacingField(),
      TextFieldFormField(
        label: 'Email Address',
        value: formData.emailAddress,
        onChanged: (value) {
          formData.emailAddress = value;
        },
      ),
    ];
  }

  List<FormFieldWidget> replaceField(
    List<FormFieldWidget> fields,
    String label,
    FormFieldWidget newField,
  ) {
    return fields.map((field) {
      if (field.label == label) {
        return newField;
      }
      return field;
    }).toList();
  }
}

class FormFieldManager extends BaseFormFieldManager<FormDataEntity> {
  @override
  List<FormFieldWidget> getFields(FormDataEntity formData) {
    return getCommonFields(formData);
  }
}
