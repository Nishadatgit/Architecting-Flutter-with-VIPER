import 'package:viper_form_app/modules/form_data/data/exceptions/network_exceptions.dart';
import 'package:viper_form_app/modules/form_data/presenter/form_data_presenter.dart';

class FormDataPresenterV2 extends FormDataPresenter {
  FormDataPresenterV2({
    required super.view,
    required super.interactor,
    required super.router,
  });

  @override
  Future<void> fetchFormData() async {
    view.showLoading();
    try {
      final data = await interactor.fetchFormData();
      view.showData(data);
    } on NetworkException catch (e) {
      view.showError(e.message);
    } catch (e) {
      view.showError('An unexpected error occurred');
    }
  }
}
