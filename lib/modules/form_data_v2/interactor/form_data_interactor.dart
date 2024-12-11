import 'package:viper_form_app/modules/form_data/interactor/form_data_interactor.dart';
import 'package:viper_form_app/modules/form_data_v2/entity/form_data_entity.dart';

class FormDataInteractorImplV2 extends FormDataInteractorImpl {
  FormDataInteractorImplV2({required super.apiClient});

  @override
  Future<FormDataEntityV2> fetchFormData() async {
    try {
      final data = await apiClient.fetchFormData();
      return FormDataEntityV2.fromJson(data);
    } catch (e) {
      rethrow;
    }
  }
}
