import 'package:viper_form_app/modules/form_data/view/form_data_view_contract.dart';

import '../entity/form_data_entity.dart';

abstract class FormDataViewContractV2 extends FormDataViewContract {
  void showDataV2(FormDataEntityV2 data);
}
