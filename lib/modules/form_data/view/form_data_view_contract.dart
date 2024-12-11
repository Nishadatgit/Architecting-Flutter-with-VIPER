import '../entity/form_data_entity.dart';

abstract class FormDataViewContract {
  void showLoading();
  void showData(FormDataEntity data);
  void showError(String message);
}
