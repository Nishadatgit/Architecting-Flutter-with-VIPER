import 'package:viper_form_app/modules/form_data/view/form_data_form_field_manager.dart';
import 'package:viper_form_app/modules/form_data_v2/entity/form_data_entity.dart';
import 'package:viper_form_app/shared/form_fields/form_field.dart';

class FormDataFormFieldManagerV2
    extends BaseFormFieldManager<FormDataEntityV2> {
  @override
  List<FormFieldWidget> getFields(FormDataEntityV2 formData) {
    final fields = getCommonFields(formData);

    fields.removeWhere((element) => element.label == "City");
    fields.removeWhere((element) => element.label == "Address");
    fields.removeWhere((element) => element.label == "Last Name");

    fields.addAll([
      CustomSpacingField(),
      CheckboxFormField(
        label: 'Subscription',
        selected: formData.isSubscribed,
        onChanged: (value) {
          formData.isSubscribed = value;
        },
      ),
    ]);
    return fields;
  }
}
