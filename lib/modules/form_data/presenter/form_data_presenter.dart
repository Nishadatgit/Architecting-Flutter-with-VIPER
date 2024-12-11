import '../interactor/form_data_interactor.dart';
import '../router/form_data_router.dart';
import '../view/form_data_view_contract.dart';
import '../../../data/exceptions/network_exceptions.dart';

class FormDataPresenter {
  final FormDataViewContract view;
  final FormDataInteractor interactor;
  final FormDataRouter router;

  FormDataPresenter({
    required this.view,
    required this.interactor,
    required this.router,
  });

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
