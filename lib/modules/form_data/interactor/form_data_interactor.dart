import '../../../data/network/api_client.dart';
import '../entity/form_data_entity.dart';

abstract class FormDataInteractor {
  Future<FormDataEntity> fetchFormData();
}

class FormDataInteractorImpl implements FormDataInteractor {
  final FormDataApiClient apiClient;

  FormDataInteractorImpl({required this.apiClient});

  @override
  Future<FormDataEntity> fetchFormData() async {
    try {
      final data = await apiClient.fetchFormData();
      return FormDataEntity.fromJson(data);
    } catch (e) {
      rethrow;
    }
  }
}
